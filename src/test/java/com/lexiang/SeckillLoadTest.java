package com.lexiang;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledIfSystemProperty;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.LongAdder;

import static com.lexiang.utils.RedisConstants.LOGIN_CODE_KEY;
import static com.lexiang.utils.RedisConstants.LOGIN_CODE_TTL;

@EnabledIfSystemProperty(named = "load.enabled", matches = "true")
class SeckillLoadTest {

    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
    private static final String FIXED_CODE = "123456";

    @Test
    void runLoadTest() throws Exception {
        LoadConfig config = LoadConfig.fromSystemProperties();
        StringRedisTemplate redisTemplate = buildRedisTemplate(config);
        HttpClient httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();

        try {
            Long voucherId = config.voucherId != null ? config.voucherId : createVoucher(httpClient, config);
            List<String> tokens = prepareTokens(redisTemplate, httpClient, config);
            LoadReport report = fireSeckillRequests(httpClient, config, voucherId, tokens);
            report.print(voucherId, config);
        } finally {
            LettuceConnectionFactory factory = (LettuceConnectionFactory) redisTemplate.getConnectionFactory();
            if (factory != null) {
                factory.destroy();
            }
        }
    }

    private static Long createVoucher(HttpClient httpClient, LoadConfig config) throws IOException, InterruptedException {
        LocalDateTime now = LocalDateTime.now();
        JSONObject payload = JSONUtil.createObj()
                .set("shopId", config.shopId)
                .set("title", "压测秒杀券-" + now.format(DateTimeFormatter.ofPattern("MMddHHmmss")))
                .set("subTitle", "自动生成压测券")
                .set("rules", "压测专用")
                .set("payValue", 1000)
                .set("actualValue", 1200)
                .set("type", 1)
                .set("stock", config.stock)
                .set("beginTime", now.minusMinutes(1).format(TIME_FORMATTER))
                .set("endTime", now.plusHours(2).format(TIME_FORMATTER));

        JSONObject result = postJson(httpClient, config.baseUrl + "/voucher/seckill", null, payload.toString());
        if (!result.getBool("success", false)) {
            throw new IllegalStateException("创建秒杀券失败: " + result.getStr("errorMsg"));
        }
        Long voucherId = result.getLong("data");
        if (voucherId == null) {
            throw new IllegalStateException("创建秒杀券成功，但返回的 voucherId 为空");
        }
        return voucherId;
    }

    private static List<String> prepareTokens(StringRedisTemplate redisTemplate, HttpClient httpClient, LoadConfig config)
            throws IOException, InterruptedException {
        List<String> tokens = new ArrayList<>(config.userCount);
        for (int i = 0; i < config.userCount; i++) {
            String phone = config.buildPhone(i);
            redisTemplate.opsForValue().set(LOGIN_CODE_KEY + phone, FIXED_CODE, LOGIN_CODE_TTL, TimeUnit.MINUTES);

            JSONObject loginPayload = JSONUtil.createObj()
                    .set("phone", phone)
                    .set("code", FIXED_CODE);
            JSONObject result = postJson(httpClient, config.baseUrl + "/user/login", null, loginPayload.toString());
            if (!result.getBool("success", false)) {
                throw new IllegalStateException("登录失败，phone=" + phone + ", error=" + result.getStr("errorMsg"));
            }
            String token = result.getStr("data");
            if (token == null || token.isEmpty()) {
                throw new IllegalStateException("登录成功，但 token 为空，phone=" + phone);
            }
            tokens.add(token);
        }
        return tokens;
    }

    private static LoadReport fireSeckillRequests(HttpClient httpClient, LoadConfig config, Long voucherId, List<String> tokens)
            throws InterruptedException {
        ExecutorService executor = Executors.newFixedThreadPool(config.concurrency);
        CountDownLatch ready = new CountDownLatch(tokens.size());
        CountDownLatch start = new CountDownLatch(1);
        CountDownLatch done = new CountDownLatch(tokens.size());
        List<Long> latencies = Collections.synchronizedList(new ArrayList<>(tokens.size()));
        Map<String, LongAdder> businessResults = new ConcurrentHashMap<>();
        AtomicInteger successCount = new AtomicInteger();
        AtomicInteger failureCount = new AtomicInteger();
        AtomicInteger transportErrorCount = new AtomicInteger();
        AtomicLong wallClockStart = new AtomicLong();

        for (String token : tokens) {
            executor.submit(() -> {
                ready.countDown();
                try {
                    start.await();
                    long requestStart = System.nanoTime();
                    JSONObject result = postJson(httpClient,
                            config.baseUrl + "/voucher-order/seckill/" + voucherId,
                            token,
                            null);
                    long elapsedMs = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - requestStart);
                    latencies.add(elapsedMs);

                    if (result.getBool("success", false)) {
                        successCount.incrementAndGet();
                        businessResults.computeIfAbsent("SUCCESS", key -> new LongAdder()).increment();
                    } else {
                        failureCount.incrementAndGet();
                        String errorMsg = result.getStr("errorMsg", "UNKNOWN");
                        businessResults.computeIfAbsent(errorMsg, key -> new LongAdder()).increment();
                    }
                } catch (Exception e) {
                    transportErrorCount.incrementAndGet();
                    businessResults.computeIfAbsent("TRANSPORT_ERROR:" + e.getClass().getSimpleName(),
                            key -> new LongAdder()).increment();
                } finally {
                    done.countDown();
                }
            });
        }

        ready.await();
        wallClockStart.set(System.nanoTime());
        start.countDown();
        done.await();
        long totalElapsedMs = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - wallClockStart.get());
        executor.shutdown();
        executor.awaitTermination(10, TimeUnit.SECONDS);

        return new LoadReport(
                tokens.size(),
                successCount.get(),
                failureCount.get(),
                transportErrorCount.get(),
                totalElapsedMs,
                latencies,
                businessResults
        );
    }

    private static JSONObject postJson(HttpClient httpClient, String url, String token, String body)
            throws IOException, InterruptedException {
        HttpRequest.Builder builder = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .timeout(Duration.ofSeconds(10))
                .header("Content-Type", "application/json");
        if (token != null && !token.isEmpty()) {
            builder.header("authorization", token);
        }
        if (body == null) {
            builder.POST(HttpRequest.BodyPublishers.noBody());
        } else {
            builder.POST(HttpRequest.BodyPublishers.ofString(body));
        }

        HttpResponse<String> response = httpClient.send(builder.build(), HttpResponse.BodyHandlers.ofString());
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            throw new IllegalStateException("HTTP " + response.statusCode() + ": " + response.body());
        }
        return JSONUtil.parseObj(response.body());
    }

    private static StringRedisTemplate buildRedisTemplate(LoadConfig config) {
        RedisStandaloneConfiguration redisConfig = new RedisStandaloneConfiguration(config.redisHost, config.redisPort);
        if (config.redisPassword != null && !config.redisPassword.isEmpty()) {
            redisConfig.setPassword(RedisPassword.of(config.redisPassword));
        }
        LettuceConnectionFactory factory = new LettuceConnectionFactory(redisConfig);
        factory.afterPropertiesSet();

        StringRedisTemplate redisTemplate = new StringRedisTemplate();
        redisTemplate.setConnectionFactory(factory);
        redisTemplate.afterPropertiesSet();
        return redisTemplate;
    }

    private static final class LoadConfig {
        private final String baseUrl;
        private final String redisHost;
        private final int redisPort;
        private final String redisPassword;
        private final int shopId;
        private final int stock;
        private final int userCount;
        private final int concurrency;
        private final long phoneStart;
        private final Long voucherId;

        private LoadConfig(String baseUrl, String redisHost, int redisPort, String redisPassword, int shopId,
                           int stock, int userCount, int concurrency, long phoneStart, Long voucherId) {
            this.baseUrl = baseUrl;
            this.redisHost = redisHost;
            this.redisPort = redisPort;
            this.redisPassword = redisPassword;
            this.shopId = shopId;
            this.stock = stock;
            this.userCount = userCount;
            this.concurrency = concurrency;
            this.phoneStart = phoneStart;
            this.voucherId = voucherId;
        }

        private static LoadConfig fromSystemProperties() {
            String baseUrl = System.getProperty("load.baseUrl", "http://127.0.0.1:8081");
            String redisHost = System.getProperty("load.redisHost", "127.0.0.1");
            int redisPort = Integer.parseInt(System.getProperty("load.redisPort", "6379"));
            String redisPassword = System.getProperty("load.redisPassword", System.getenv().getOrDefault("REDIS_PASSWORD", ""));
            int shopId = Integer.parseInt(System.getProperty("load.shopId", "1"));
            int stock = Integer.parseInt(System.getProperty("load.stock", "200"));
            int userCount = Integer.parseInt(System.getProperty("load.userCount", "200"));
            int concurrency = Integer.parseInt(System.getProperty("load.concurrency", "50"));
            long phoneStart = Long.parseLong(System.getProperty("load.phoneStart", "13600001000"));
            Long voucherId = System.getProperty("load.voucherId") == null
                    ? null
                    : Long.parseLong(System.getProperty("load.voucherId"));

            if (concurrency <= 0 || userCount <= 0 || stock <= 0) {
                throw new IllegalArgumentException("load.concurrency、load.userCount、load.stock 必须大于 0");
            }
            if (concurrency > userCount) {
                concurrency = userCount;
            }
            return new LoadConfig(baseUrl, redisHost, redisPort, redisPassword, shopId, stock,
                    userCount, concurrency, phoneStart, voucherId);
        }

        private String buildPhone(int offset) {
            return String.valueOf(phoneStart + offset);
        }
    }

    private static final class LoadReport {
        private final int totalRequests;
        private final int successCount;
        private final int failureCount;
        private final int transportErrorCount;
        private final long totalElapsedMs;
        private final List<Long> latencies;
        private final Map<String, LongAdder> businessResults;

        private LoadReport(int totalRequests, int successCount, int failureCount, int transportErrorCount,
                           long totalElapsedMs, List<Long> latencies, Map<String, LongAdder> businessResults) {
            this.totalRequests = totalRequests;
            this.successCount = successCount;
            this.failureCount = failureCount;
            this.transportErrorCount = transportErrorCount;
            this.totalElapsedMs = totalElapsedMs;
            this.latencies = latencies;
            this.businessResults = businessResults;
        }

        private void print(Long voucherId, LoadConfig config) throws IOException {
            List<Long> sortedLatencies = new ArrayList<>(latencies);
            Collections.sort(sortedLatencies);
            double qps = totalElapsedMs == 0 ? totalRequests : totalRequests * 1000.0 / totalElapsedMs;

            StringBuilder output = new StringBuilder();
            output.append(System.lineSeparator());
            output.append("========== 秒杀压测结果 ==========").append(System.lineSeparator());
            output.append("baseUrl        : ").append(config.baseUrl).append(System.lineSeparator());
            output.append("voucherId      : ").append(voucherId).append(System.lineSeparator());
            output.append("shopId         : ").append(config.shopId).append(System.lineSeparator());
            output.append("stock          : ").append(config.stock).append(System.lineSeparator());
            output.append("userCount      : ").append(config.userCount).append(System.lineSeparator());
            output.append("concurrency    : ").append(config.concurrency).append(System.lineSeparator());
            output.append("elapsedMs      : ").append(totalElapsedMs).append(System.lineSeparator());
            output.append("throughputQps  : ").append(String.format("%.2f", qps)).append(System.lineSeparator());
            output.append("success        : ").append(successCount).append(System.lineSeparator());
            output.append("businessFail   : ").append(failureCount).append(System.lineSeparator());
            output.append("transportFail  : ").append(transportErrorCount).append(System.lineSeparator());
            output.append("avgLatencyMs   : ").append(String.format("%.2f", average(sortedLatencies))).append(System.lineSeparator());
            output.append("p50LatencyMs   : ").append(percentile(sortedLatencies, 0.50)).append(System.lineSeparator());
            output.append("p90LatencyMs   : ").append(percentile(sortedLatencies, 0.90)).append(System.lineSeparator());
            output.append("p99LatencyMs   : ").append(percentile(sortedLatencies, 0.99)).append(System.lineSeparator());
            output.append("businessStats  :").append(System.lineSeparator());
            businessResults.entrySet().stream()
                    .sorted(Map.Entry.comparingByKey())
                    .forEach(entry -> output.append("  ")
                            .append(entry.getKey())
                            .append(" = ")
                            .append(entry.getValue().sum())
                            .append(System.lineSeparator()));
            output.append("==================================").append(System.lineSeparator()).append(System.lineSeparator());

            String text = output.toString();
            System.out.print(text);
            System.out.flush();
            Files.writeString(Path.of("target", "load-test-report.txt"), text, StandardCharsets.UTF_8);
        }

        private static double average(List<Long> numbers) {
            if (numbers.isEmpty()) {
                return 0D;
            }
            long sum = 0L;
            for (Long number : numbers) {
                sum += number;
            }
            return sum * 1.0 / numbers.size();
        }

        private static long percentile(List<Long> numbers, double percentile) {
            if (numbers.isEmpty()) {
                return 0L;
            }
            int index = (int) Math.ceil(percentile * numbers.size()) - 1;
            index = Math.max(0, Math.min(index, numbers.size() - 1));
            return numbers.get(index);
        }
    }
}
