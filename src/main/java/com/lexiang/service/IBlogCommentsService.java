package com.lexiang.service;

import com.lexiang.dto.Result;
import com.lexiang.entity.BlogComments;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IBlogCommentsService extends IService<BlogComments> {

    Result saveComment(BlogComments blogComments);

    Result queryCommentsByBlogId(Long blogId, Integer current);
}
