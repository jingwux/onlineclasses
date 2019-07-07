package com.myyl.magsystem.controller;

import com.myyl.pojo.Admin;
import com.myyl.service.AdminService;
import com.myyl.service.CourseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
@RequestMapping("/manage")
public class ManageIndexController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private CourseService courseService;


    @RequestMapping({"", "/index"})
    public String manageIndex() {
        return "magsystem/index";
    }

    @GetMapping("/login")
    public String login() {
        return "magsystem/login";
    }

    @PostMapping("/login")
    public String doLogin(String userName, String password, HttpSession session, RedirectAttributes redirectAttributes) {
        log.info(userName + " " + password);
        Admin admin;
        try {
            admin = adminService.loginCheck(userName, password);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            redirectAttributes.addFlashAttribute("clazz", "failed");
            redirectAttributes.addFlashAttribute("msg", e.getMessage());
            return "redirect:/manage/login";
        }

        session.setAttribute("admin", admin);
        return "redirect:/manage/index";
    }

    @RequestMapping("/exit")
    public String logout(HttpSession session) {
        //清除session
        session.invalidate();
        //重定向到登录页面的跳转方法
        return "redirect:/manage/login";
    }

    @RequestMapping("/findCourse")
    public String loadFindCoursePage() {
        return "magsystem/findCourse";
    }

     @RequestMapping("/approveCourse")
     public String loadApproveCoursePage() {
         return "magsystem/approveCourse";
     }

    @RequestMapping("/addCourse")
    public String loadAddCoursePage() {
        return "magsystem/addCourse";
    }

    @RequestMapping("/addChapter")
    public String loadAddChapterPage() {
        return "magsystem/addChapter";
    }

    @RequestMapping("/addType")
    public String loadAddTypePage() {
        return "magsystem/addType";
    }

    @RequestMapping("/addData")
    public String loadAddDataPage() {
        return "magsystem/addData";
    }

    @RequestMapping("/addExercise")
    public String loadAddExercisePage() {
        return "magsystem/addExercise";
    }

    @RequestMapping("/deleteCommet")
    public String loadCommetPage() {
        return "magsystem/commet";
    }


    @RequestMapping("/editUser")
    public String loadEditUserPage(){
        return "magsystem/editUser";
    }

   /*  @RequestMapping("/addUser")
    public String loadAddUserPage(){
        return "magsystem/addUser";
    }
    */

}
