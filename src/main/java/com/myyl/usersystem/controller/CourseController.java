package com.myyl.usersystem.controller;

import com.github.pagehelper.PageInfo;
import com.myyl.common.ResultData;
import com.myyl.pojo.*;
import com.myyl.service.*;
import com.myyl.usersystem.entity.CourseVo;
import com.myyl.vo.ChapterVO;
import com.myyl.vo.CourseVO;
import com.myyl.vo.QuestionVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;



/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ExerciseService exerciseService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SelectCourseService selectCourseService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private DataService dataService;
    @Autowired
    private CourseTypeService courseTypeService;
    @Autowired
    private WorkService workService;

    @RequestMapping(value = "/course/courseDetail")
    public String courseDetail(String cid, Model model,HttpSession httpSession) throws ParseException {
        CourseVO course = courseService.getCourseIncludeTeacherByCid(cid);
        User user = (User) httpSession.getAttribute("user");
        List<ChapterVO> chapter     = chapterService.selectByExample(cid);
        List<QuestionVO> questionInfo = questionService.getQuestionInfo(cid);
        List<Data> dataList         = dataService.findData(cid);
        List<Exercise> exerciseInfo = exerciseService.getExerciseInfo(cid);

        // 查询课程方向
        Coursetype coursetype = courseTypeService.getCourseTypeByCourseTypeId(course.getTypeid());
        Coursetype c = courseTypeService.getCourseTypeByCourseTypeId(coursetype.getPartype());
        course.setTypeDirection(c.getCtname());
        model.addAttribute("user",user);
        model.addAttribute("exerciseInfo",exerciseInfo);
        model.addAttribute("data",dataList);
        model.addAttribute("question",questionInfo);
        model.addAttribute("course",course);
        model.addAttribute("chapter",chapter);

        return "usersystem/course";
    }

    @RequestMapping(value = "/course/view/{cid}")
    public String courseDetail(Model model, HttpSession session, @PathVariable String cid) {
        User user = (User) session.getAttribute("user");
        boolean hasCourse;

        CourseVO courseVO = courseService.getCourseIncludeTeacherByCid(cid);

        hasCourse = isCurrentUserHasCourse(user, courseVO);

        List<ChapterVO> chapter = chapterService.selectByExample(cid);
        model.addAttribute("course", courseVO);
        model.addAttribute("hasCourse", hasCourse);
        model.addAttribute("chapter", chapter);

        return "usersystem/courseDetail";
    }

    private boolean isCurrentUserHasCourse(User user, CourseVO c) {
        if (user != null) {
            List<Course> courseByUid = selectCourseService.getCourseByUid(user.getUid());
            for (Course course : courseByUid) {
                // 所学课程是否包含当前课程
                if (StringUtils.equals(c.getCid(), course.getCid())) {
                    return true;
                }
            }
        }
        return false;
    }

    @RequestMapping(value = "/course/teacher/detail")
    public String teacherDetail(String cid, Model model) {
        Course course = (Course) courseService.getCourseByCid(cid);
        List<ChapterVO> chapter = chapterService.selectByExample(cid);
        List<QuestionVO> questionInfo = questionService.getQuestionInfo(cid);
        List<Comment> commetInfo = new ArrayList<>();
        List<Comment> comments = new ArrayList<>();
        List<Data> dataList = dataService.findData(cid);
        List<Exercise> exerciseInfo = exerciseService.getExerciseInfo(cid);
        List<Work> workInfo = workService.getWorkByCid(cid);
        if (questionInfo != null) {
            for (QuestionVO question : questionInfo) {
                commetInfo = commentService.getCommetInfo(question.getQid());

                comments.addAll(commetInfo);
            }
        }
        model.addAttribute("workInfo",workInfo);
        model.addAttribute("exerciseInfo",exerciseInfo);
        model.addAttribute("data",dataList);
        model.addAttribute("comment", comments);
        model.addAttribute("question", questionInfo);
        model.addAttribute("course", course);
        model.addAttribute("chapter", chapter);

        return "usersystem/XQteachercourse";
    }

    @RequestMapping(value = "/course/search")
    public String searchCourse(String info, Model model) {
        List<CourseVo> courseByInfo = courseService.getCourseByInfo1(info);
        model.addAttribute("list", courseByInfo);

        return "usersystem/searchCourse";
    }

    @RequestMapping(value = "/course/approveRecords/{uid}")
    @ResponseBody
    public ResultData getApproveCourse(@RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize,
                                       @PathVariable String uid) {
        ResultData resultData = new ResultData();
        PageInfo<CourseVO> teacherApplyCourse;
        try {
            teacherApplyCourse = courseService.getTeacherApplyCourse(pageIndex, pageSize, uid, null);
            resultData.setData(teacherApplyCourse);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setMessage(e.getMessage());
            resultData.setSuccess(ResultData.NOT_SUCCESS);
        }
        return resultData;
    }

    @RequestMapping(value = "/course/hotCourse")
    @ResponseBody
    public ResultData getHotCourse() {
        ResultData resultData = new ResultData();
        try {
            resultData.setData(courseService.getHotCourseTop());
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setMessage(e.getMessage());
            resultData.setSuccess(ResultData.NOT_SUCCESS);
        }
        return resultData;
    }

    @RequestMapping(value = "/join/course")
    public String joinCourse(String cid, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("user");
        selectCourseService.insertRecord(cid, user.getUid());
        return user.getRole() == 1 ? "redirect:/user/index/myCourse" : "redirect:/user/index/teacher/myCourse";
    }

    @GetMapping("/getCourseTypeByDirection")
    @ResponseBody
    public ResultData loadCourseType() {
        List<Coursetype> courseDirection = courseTypeService.getCourseTypeByParType("610001");
        return new ResultData(ResultData.SUCCESS, courseDirection);
    }

}
