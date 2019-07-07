package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Course;
import com.myyl.pojo.User;
import com.myyl.service.*;
import com.myyl.usersystem.entity.CourseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Controller
@RequestMapping("/user/index")
public class UserIndexController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private SelectCourseService selectCourseSevice;
    @Autowired
    private UserService userService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    QuestionService questionService;

    @RequestMapping("/myCourse")
    public String myCoursePage(HttpSession session, Model model){
       User user = (User) session.getAttribute("user");
       List<CourseVo> list = new ArrayList();
       if(user != null) {
           List<Course> course =  selectCourseSevice.getCourseByUid(user.getUid());
           for (Course course1 : course) {
               CourseVo coursevo = new CourseVo();
              coursevo.setCname(course1.getCname());
              coursevo.setUname(userService.getUserInfoById(course1.getUid()).getUname());
              coursevo.setTotal(course1.getTotal());
              coursevo.setUpdatetime(course1.getUpdatetime());
              coursevo.setCid(course1.getCid());
              list.add(coursevo);
           }
           model.addAttribute("list",list);
       }
        return "usersystem/myCourse";
    }
    @RequestMapping("/myIndex")
    @ResponseBody
    public ResultData myCourse(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<CourseVo> list = new ArrayList();
        if(user != null) {
            List<Course> course =  selectCourseSevice.getCourseByUid(user.getUid());
            for (Course course1 : course) {
                CourseVo coursevo = new CourseVo();
                coursevo.setCourseimg(course1.getCourseimg());
                coursevo.setCname(course1.getCname());
                coursevo.setUname(userService.getUserInfoById(course1.getUid()).getUname());
                coursevo.setTotal(course1.getTotal());
                coursevo.setUpdatetime(course1.getUpdatetime());
                coursevo.setCid(course1.getCid());
                list.add(coursevo);
            }
            //model.addAttribute("list",list);
        }
        return new ResultData(ResultData.SUCCESS, list);
    }
    @RequestMapping("/teacher/myCourse")
    @ResponseBody
    public ResultData teacherCourse(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<CourseVo> list = new ArrayList();
        if(user != null) {
            List<Course> course =  courseService.getCourseByUid(user.getUid());
            for (Course course1 : course) {
                if(course1.getStatus() == 1){
                    CourseVo coursevo = new CourseVo();
                    coursevo.setCourseimg(course1.getCourseimg());
                    coursevo.setCname(course1.getCname());
                    coursevo.setUname(userService.getUserInfoById(course1.getUid()).getUname());
                    coursevo.setTotal(course1.getTotal());
                    coursevo.setUpdatetime(course1.getUpdatetime());
                    coursevo.setCid(course1.getCid());
                    list.add(coursevo);
                }
            }
        }
        return new ResultData(ResultData.SUCCESS, list);
    }

    @RequestMapping("/myContact")
    public String myContactPage() {
        return "usersystem/contact";
    }

    @RequestMapping("/contactUs")
    public String contactUsPage() {
        return "usersystem/contactUs";
    }

    /*@RequestMapping("/video")
    public String courseVideo(String cid,Model model) {
        Course c =  (Course)courseService.getCourseByCid(cid);
        List<ChapterVO> chapter = chapterService.selectByExample(cid);
        List<Question> questionInfo = questionService.getQuestionInfo(cid);
        if(questionInfo != null) {

        }
        model.addAttribute("question",questionInfo);
        model.addAttribute("course",c);
        model.addAttribute("chapter",chapter);
        return "usersystem/courseVideo";
    }*/

    @RequestMapping("/teacherCourse")
    public String teacherCoursePage(String uid,Model model) {
        User user  = userService.getUserInfoById(uid);
        model.addAttribute("user",user);
        return "usersystem/teacherCourse";
    }

    @RequestMapping("/setting")
    public String settingPage(HttpSession httpSession,Model model) {
        User user = (User) httpSession.getAttribute("user");
        User user1 = userService.getUserInfoById(user.getUid());
        model.addAttribute("userSetting",user1);
        return "usersystem/setting";
    }

}
