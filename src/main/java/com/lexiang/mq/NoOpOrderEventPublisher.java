package com.lexiang.mq;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

@Slf4j
@Component("orderEventPublisher")
@ConditionalOnProperty(prefix = "rocketmq", name = "enabled", havingValue = "false", matchIfMissing = true)
public class NoOpOrderEventPublisher implements OrderEventPublisher {

    @Override
    public void sendPayResult(Long orderId, Integer payType) {

        log.debug("RocketMQ 未启用，忽略支付结果异步投递，orderId={}, payType={}", orderId, payType);
    }

    @Override
    public void sendOrderTimeoutCheck(Long orderId) {

        log.debug("RocketMQ 未启用，忽略超时订单延迟投递，orderId={}", orderId);
    }

    @Override
    public void sendOrderTimeoutCheck(Long orderId, int delayLevel) {

        log.debug("RocketMQ 未启用，忽略超时订单延迟投递，orderId={}, delayLevel={}", orderId, delayLevel);
    }
}
