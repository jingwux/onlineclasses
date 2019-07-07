package com.myyl.service.impl;

import com.myyl.mapper.CommentMapper;
import com.myyl.mapper.UserMapper;
import com.myyl.pojo.Comment;
import com.myyl.pojo.CommentExample;
import com.myyl.pojo.User;
import com.myyl.service.CommentService;
import com.myyl.vo.CommentVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    /**
     *
     */
    @Autowired
    private CommentMapper commetMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Comment> getCommetInfo(String qid) {
        CommentExample commentExample = new CommentExample();
        commentExample.or().andQidEqualTo(qid);

        return commetMapper.selectByExample(commentExample);
    }

    @Override
    public List<CommentVO> getCommentVOInfo(String qid) {
        CommentExample commentExample = new CommentExample();
        commentExample.or().andQidEqualTo(qid);
        List<Comment> comments = commetMapper.selectByExample(commentExample);

        List<CommentVO> commentVOS = new ArrayList<>();
        for (Comment comment : comments) {
            CommentVO commentVO = new CommentVO();
            BeanUtils.copyProperties(comment, commentVO);
            User user = userMapper.selectByPrimaryKey(comment.getUid());
            commentVO.setUname(user.getUname());

            commentVOS.add(commentVO);
        }

        return commentVOS;
    }

    @Override
    public int addCommet(Comment comment) {


        return commetMapper.insertSelective(comment);

    }

    @Override
    public List<CommentVO> findAllCommet() {
        CommentExample commentExample = new CommentExample();
        List<Comment> commentList = commetMapper.selectByExample(commentExample);
        List<CommentVO> commentVOList = new ArrayList<>();
        for (Comment comment : commentList) {
            CommentVO commentVO = new CommentVO();
            commentVO.setComid(comment.getComid());
            commentVO.setQid(comment.getQid());
            commentVO.setUid(comment.getUid());
            commentVO.setContent(comment.getContent());
            commentVO.setCname(userMapper.selectByPrimaryKey(comment.getUid()).getUname());
            commentVOList.add(commentVO);
        }
        return commentVOList;
    }

    @Override
    public int updateInfo(Comment comment) {
        CommentExample commentExample = new CommentExample();
        commentExample.or().andComidEqualTo(comment.getComid());
        return commetMapper.updateByExampleSelective(comment, commentExample);
    }

}
