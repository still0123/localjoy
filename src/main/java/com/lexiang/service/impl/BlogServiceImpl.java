package com.lexiang.service.impl;

import com.lexiang.entity.Blog;
import com.lexiang.mapper.BlogMapper;
import com.lexiang.service.IBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {

}
