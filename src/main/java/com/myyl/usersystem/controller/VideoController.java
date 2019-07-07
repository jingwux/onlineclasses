package com.myyl.usersystem.controller;

import com.myyl.pojo.Chapter;
import com.myyl.pojo.Course;
import com.myyl.service.ChapterService;
import com.myyl.service.CourseService;
import com.myyl.service.QuestionService;
import com.myyl.vo.ChapterVO;
import com.myyl.vo.QuestionVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Controller
public class VideoController {
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private QuestionService questionService;
    /**
     * 按章节播放视频
     *
     * @param cpid
     * @param model
     * @return
     */
    @RequestMapping(value = "/course/video")
    public String video(String cpid, Model model) {
        Chapter       chapter = chapterService.selectByPrimaryKey(cpid);
        Course         course = courseService.getCourseByCid(chapter.getCid());
        ChapterVO chapterVO   = new ChapterVO();

        BeanUtils.copyProperties(chapter, chapterVO);
        chapterVO.setCname(course.getCname());

        List<QuestionVO> questions = questionService.getQuestionInfo(chapter.getCid());
        model.addAttribute("chapter", chapterVO);
        model.addAttribute("questions", questions);
        model.addAttribute("course",course);

        return "usersystem/courseVideo";
    }
}
