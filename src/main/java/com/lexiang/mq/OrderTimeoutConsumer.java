package com.lexiang.mq;

import cn.hutool.json.JSONUtil;
import com.lexiang.service.IVoucherOrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.ConsumeMode;
import org.apache.rocketmq.spring.annotation.MessageModel;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Slf4j
@Component
@ConditionalOnProperty(prefix = "rocketmq", name = "enabled", havingValue = "true")
@RocketMQMessageListener(
        topic = "${lexiang.mq.timeout-topic:lexiang-order-timeout}",
        consumerGroup = "lexiang-order-timeout-group",

        consumeMode = ConsumeMode.CONCURRENTLY,

        messageModel = MessageModel.CLUSTERING
)
public class OrderTimeoutConsumer implements RocketMQListener<String> {

    @Resource
    private IVoucherOrderService voucherOrderService;

    @Override
    public void onMessage(String payload) {

        OrderTimeoutMessage message = JSONUtil.toBean(payload, OrderTimeoutMessage.class);

        log.debug("收到超时订单检查消息，message={}", message);

        voucherOrderService.closeTimeoutOrder(message.getOrderId());
    }
}
