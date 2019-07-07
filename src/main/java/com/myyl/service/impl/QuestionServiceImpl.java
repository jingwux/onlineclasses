package com.myyl.service.impl;

import com.myyl.mapper.QuestionMapper;
import com.myyl.pojo.Question;
import com.myyl.pojo.QuestionExample;
import com.myyl.service.CommentService;
import com.myyl.service.QuestionService;
import com.myyl.vo.CommentVO;
import com.myyl.vo.QuestionVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * 功能：问题答疑业务层实现
 * @author
 * @date
 */
@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
    /**
     *
     */
    @Autowired
    private QuestionMapper questionMapper ;


    @Autowired
    private CommentService commentService;

    /**
     * 功能:获取问题信息
     */
    /**
     * 功能：添加问题信息
     */
    @Override
    public int addQuestion(QuestionVO questionVO) {
        Question question = new Question();
        BeanUtils.copyProperties(questionVO, question);
        return questionMapper.insertSelective(question);
    }

    @Override
    public List<QuestionVO> getQuestionInfo(String cid) {
        QuestionExample questionExample = new QuestionExample();
        questionExample.or().andCidEqualTo(cid);
        List<Question> questions = questionMapper.selectByExample(questionExample);

        List<QuestionVO> questionVOS = new ArrayList<>();
        for (Question question : questions) {
            QuestionVO questionVO = new QuestionVO();
            BeanUtils.copyProperties(question, questionVO);
            List<CommentVO> comments = commentService.getCommentVOInfo(question.getQid());
            questionVO.setComments(new HashSet<>(comments));
            questionVOS.add(questionVO);
        }
        return questionVOS;
    }


}
