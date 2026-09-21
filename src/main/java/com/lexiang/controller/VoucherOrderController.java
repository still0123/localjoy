package com.lexiang.controller;

import com.lexiang.dto.Result;
import com.lexiang.service.IVoucherOrderService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/voucher-order")
public class VoucherOrderController {

    @Resource
    private IVoucherOrderService voucherOrderService;

    @PostMapping("seckill/{id}")
    public Result seckillVoucher(@PathVariable("id") Long voucherId) {
        return voucherOrderService.seckillVoucher(voucherId);
    }

    @PostMapping("pay/{id}")
    public Result payOrder(@PathVariable("id") Long orderId,
                           @RequestParam(value = "payType", defaultValue = "1") Integer payType) {
        return voucherOrderService.payOrder(orderId, payType);
    }
}
