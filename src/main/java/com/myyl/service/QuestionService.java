package com.myyl.service;

import com.myyl.vo.QuestionVO;

import java.util.List;

/**
 * 功能：问题答疑业务层接口
 * @author
 * @date
 */
public interface QuestionService {
    public List<QuestionVO> getQuestionInfo(String cid); //获取问题信息
    public int addQuestion(QuestionVO questionVO); //添加问题信息
}
