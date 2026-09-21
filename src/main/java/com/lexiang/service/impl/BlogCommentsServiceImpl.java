package com.lexiang.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lexiang.dto.Result;
import com.lexiang.entity.BlogComments;
import com.lexiang.mapper.BlogCommentsMapper;
import com.lexiang.service.IBlogCommentsService;
import com.lexiang.utils.SystemConstants;
import com.lexiang.utils.UserHolder;
import org.springframework.stereotype.Service;

@Service
public class BlogCommentsServiceImpl extends ServiceImpl<BlogCommentsMapper, BlogComments> implements IBlogCommentsService {

    @Override
    public Result saveComment(BlogComments blogComments) {
        if (blogComments.getBlogId() == null) {
            return Result.fail("blogId不能为空");
        }
        if (blogComments.getContent() == null || blogComments.getContent().trim().isEmpty()) {
            return Result.fail("评论内容不能为空");
        }

        blogComments.setUserId(UserHolder.getUser().getId());
        if (blogComments.getParentId() == null) {
            blogComments.setParentId(0L);
        }
        if (blogComments.getAnswerId() == null) {
            blogComments.setAnswerId(0L);
        }
        if (blogComments.getLiked() == null) {
            blogComments.setLiked(0);
        }
        if (blogComments.getStatus() == null) {
            blogComments.setStatus(false);
        }

        save(blogComments);
        return Result.ok(blogComments.getId());
    }

    @Override
    public Result queryCommentsByBlogId(Long blogId, Integer current) {
        Page<BlogComments> page = query()
                .eq("blog_id", blogId)
                .orderByDesc("create_time")
                .page(new Page<>(current, SystemConstants.MAX_PAGE_SIZE));
        return Result.ok(page.getRecords());
    }
}
