package com.lexiang.service;

import com.lexiang.dto.Result;
import com.lexiang.entity.VoucherOrder;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IVoucherOrderService extends IService<VoucherOrder> {

    Result seckillVoucher(Long voucherId);

    Result payOrder(Long orderId, Integer payType);

    void handlePayResult(Long orderId, Integer payType);

    void closeTimeoutOrder(Long orderId);
}
