package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Comment;
import com.myyl.pojo.User;
import com.myyl.service.CommentService;
import com.myyl.service.QuestionService;
import com.myyl.service.UserService;
import com.myyl.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */

 
@Controller
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/course/question")
    @ResponseBody
    public ResultData addQuestion(@RequestParam(value = "uid") String uid, @RequestParam(value = "cid") String cid
            , @RequestParam(value = "info") String info) {

        QuestionVO questionVO = new QuestionVO();
        User user             = userService.getUserInfoById(uid);

        questionVO.setQid(String.valueOf(new Date().getTime()));
        questionVO.setCid(cid);
        questionVO.setUid(uid);
        questionVO.setQname(user.getUname());
        questionVO.setContent(info);

        questionService.addQuestion(questionVO);
        List<QuestionVO> questionInfo = questionService.getQuestionInfo(cid);

        return new ResultData(true,questionInfo);
    }



    @RequestMapping(value = "/question/commet")
    @ResponseBody
    public ResultData commet(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "info") String info, @RequestParam(value = "qid") String qid) {
        Comment comment = new Comment();
        comment.setContent(info);
        comment.setQid(qid);
        comment.setUid(uid);
        comment.setComid(String.valueOf(new Date().getTime()));

        commentService.addCommet(comment);
        List<Comment> commetInfo = commentService.getCommetInfo(qid);

        return new ResultData(true,commetInfo);
    }



    @RequestMapping(value = "/question/add")
    @ResponseBody
    public ResultData addQuestion(QuestionVO question) {
        ResultData resultData = new ResultData();
        try {
            question.setQid("" + new Date().getTime());
            questionService.addQuestion(question);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());

        }
        return resultData;
    }
}
