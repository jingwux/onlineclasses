package com.myyl.service;

import com.myyl.pojo.Comment;
import com.myyl.vo.CommentVO;

import java.util.List;

/**
 * 功能：问题答疑业务层接口
 *
 * @author
 * @date
 */
public interface CommentService {

    public List<Comment> getCommetInfo(String qid); //获取评论信息

    public List<CommentVO> getCommentVOInfo(String qid); //获取评论信息

    public int addCommet(Comment comment); //添加评论信息

    public List<CommentVO> findAllCommet();

    int updateInfo(Comment comment); //修改个人资料
}
