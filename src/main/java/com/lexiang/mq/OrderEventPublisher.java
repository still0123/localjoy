package com.lexiang.mq;

public interface OrderEventPublisher {

    void sendPayResult(Long orderId, Integer payType);

    void sendOrderTimeoutCheck(Long orderId);

    void sendOrderTimeoutCheck(Long orderId, int delayLevel);
}
