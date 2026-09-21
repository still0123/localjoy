package com.lexiang.service;

import com.lexiang.dto.Result;
import com.lexiang.entity.Shop;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IShopService extends IService<Shop> {

    Result queryById(Long id);

    Result updateShop(Shop shop);

}
