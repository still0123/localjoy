package com.lexiang.mq;

import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Slf4j
@Component("orderEventPublisher")
@ConditionalOnProperty(prefix = "rocketmq", name = "enabled", havingValue = "true")
public class RocketMqOrderEventPublisher implements OrderEventPublisher {

    @Resource
    private RocketMQTemplate rocketMQTemplate;

    @Value("${lexiang.mq.pay-topic:lexiang-order-pay}")
    private String payTopic;

    @Value("${lexiang.mq.timeout-topic:lexiang-order-timeout}")
    private String timeoutTopic;

    @Value("${lexiang.mq.timeout-delay-level:4}")
    private int timeoutDelayLevel;

    @Value("${lexiang.mq.timeout-retry-delay-level:3}")
    private int timeoutRetryDelayLevel;

    @Override
    public void sendPayResult(Long orderId, Integer payType) {

        Message<String> message = MessageBuilder
                .withPayload(JSONUtil.toJsonStr(new OrderPayMessage(orderId, payType)))

                .setHeader(RocketMQHeaders.KEYS, orderId.toString())
                .build();

        rocketMQTemplate.syncSend(payTopic, message, 3000);

        log.debug("支付结果消息发送成功，orderId={}, payType={}", orderId, payType);
    }

    @Override
    public void sendOrderTimeoutCheck(Long orderId) {

        sendOrderTimeoutCheck(orderId, timeoutDelayLevel);
    }

    @Override
    public void sendOrderTimeoutCheck(Long orderId, int delayLevel) {

        int effectiveDelayLevel = delayLevel > 0 ? delayLevel : timeoutRetryDelayLevel;

        Message<String> message = MessageBuilder
                .withPayload(JSONUtil.toJsonStr(new OrderTimeoutMessage(orderId)))
                .setHeader(RocketMQHeaders.KEYS, orderId.toString())
                .build();

        rocketMQTemplate.syncSend(timeoutTopic, message, 3000, effectiveDelayLevel);

        log.debug("超时检查消息发送成功，orderId={}, delayLevel={}", orderId, effectiveDelayLevel);
    }
}
