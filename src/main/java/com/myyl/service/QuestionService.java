package com.myyl.service;

import com.myyl.vo.QuestionVO;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface QuestionService {
    public List<QuestionVO> getQuestionInfo(String cid); //获取问题信息
    public int addQuestion(QuestionVO questionVO); //添加问题信息
}
