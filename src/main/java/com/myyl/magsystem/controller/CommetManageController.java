package com.myyl.magsystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Comment;
import com.myyl.pojo.User;
import com.myyl.service.CommentService;
import com.myyl.service.DataService;
import com.myyl.vo.CommentVO;
import com.myyl.vo.DataVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
public class CommetManageController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value="/manage/loadCommet")
    @ResponseBody
    public ResultData getData() {
        ResultData resultData = new ResultData();
        List<CommentVO> allComment = commentService.findAllCommet();
        resultData.setData(allComment);
        resultData.setSuccess(true);
        return resultData;
    }

    @RequestMapping("/manage/updateComment")
    public ResultData updateUserByCondition(Comment comment) {
        ResultData resultData = new ResultData();
        try {
            commentService.updateInfo(comment);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }
}
