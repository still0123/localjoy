package com.lexiang.controller;

import com.lexiang.dto.Result;
import com.lexiang.entity.BlogComments;
import com.lexiang.service.IBlogCommentsService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 博客评论控制器。
 * 负责接收与博客评论相关的请求，并将业务处理交给评论服务层。
 *
 * @author 虎哥
 * @since 2021-12-22
 */
@RestController
@RequestMapping("/blog-comments")
public class BlogCommentsController {

    @Resource
    private IBlogCommentsService blogCommentsService;

    @PostMapping
    public Result saveComment(@RequestBody BlogComments blogComments) {
        return blogCommentsService.saveComment(blogComments);
    }

    @GetMapping("/of/blog")
    public Result queryCommentsByBlogId(
            @RequestParam("blogId") Long blogId,
            @RequestParam(value = "current", defaultValue = "1") Integer current) {
        return blogCommentsService.queryCommentsByBlogId(blogId, current);
    }
}
