package com.lexiang.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lexiang.dto.LoginFormDTO;
import com.lexiang.dto.Result;
import com.lexiang.entity.User;

import javax.servlet.http.HttpSession;

public interface IUserService extends IService<User> {

    Result sendCode(String phone, HttpSession session);

    Result login(LoginFormDTO loginForm, HttpSession session);
}
