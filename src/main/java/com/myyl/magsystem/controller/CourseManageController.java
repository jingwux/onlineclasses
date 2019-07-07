package com.myyl.magsystem.controller;


import com.github.pagehelper.PageInfo;
import com.myyl.common.ResultData;
import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.CourseNotExistException;
import com.myyl.pojo.User;
import com.myyl.service.CourseService;
import com.myyl.vo.CourseVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
@RequestMapping("/courseManage")
public class CourseManageController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/listCourse")
    @ResponseBody
    public ResultData listCourse(@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize) {
        log.info("查询课程列表");
        PageInfo<CourseVO> courseByPage = courseService.getCourseByPage(pageIndex, pageSize);
        return new ResultData(ResultData.SUCCESS, courseByPage);
    }

    /**
     * @param courseInfo
     * @return
     */
    @RequestMapping("/listCourse/{courseInfo}")
    @ResponseBody
    public ResultData getCourse(@PathVariable(required = false) String courseInfo) {
        log.info(courseInfo);
        try {
            return new ResultData(ResultData.SUCCESS, courseService.getCourseByInfo(courseInfo));
        } catch (CourseNotExistException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, e.getResultCodeEnum());
        }
    }

    @RequestMapping("/listCourseByPage")
    @ResponseBody
    public ResultData getCourseByPage(@RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize,
                                      @RequestParam(value = "courseInfo", required = false, defaultValue = "") String courseInfo) {
        ResultData resultData = new ResultData();
        try {
            resultData.setSuccess(ResultData.SUCCESS);
            resultData.setData(courseService.getCourseByInfo(pageIndex, pageSize, courseInfo));
        } catch (CourseNotExistException e) {
            madeErrorMessage(resultData, e.getResultCodeEnum());
        }
        return resultData;
    }

    @RequestMapping("/listApproveCourse")
    @ResponseBody
    public ResultData getApproveCourse(@RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize,
                                       @RequestParam(value = "courseInfo", required = false, defaultValue = "") String courseInfo,
                                       @RequestParam(value = "courseStatus", required = false, defaultValue = "0") Integer courseStatus) {
        ResultData resultData = new ResultData();
        try {
            resultData.setSuccess(ResultData.SUCCESS);
            resultData.setData(courseService.getApproveCourse(pageIndex, pageSize, courseInfo, courseStatus));
        } catch (CourseNotExistException e) {
            madeErrorMessage(resultData, e.getResultCodeEnum());
        }
        return resultData;
    }

    /**
     * @param courseVO
     * @return
     */
    @RequestMapping("/updateCourse")
    @ResponseBody
    public ResultData updateCourse(CourseVO courseVO) {
        log.info("更新课程信息请求");
        try {
            courseService.updateCourse(courseVO);
            return new ResultData(ResultData.SUCCESS);
        } catch (CourseNotExistException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, e.getResultCodeEnum());
        }
    }

    /**
     * @param cid
     * @return
     */
    @RequestMapping("/deleteCourse/{cid}")
    @ResponseBody
    public ResultData deleteCourse(@PathVariable("cid") String cid) {
        log.info("删除 {} ", cid);
        try {
            int i = courseService.deleteCourse(cid);
            return new ResultData(ResultData.SUCCESS);
        } catch (CourseNotExistException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, e.getResultCodeEnum());
        }
    }

    @PostMapping("/addCourse")
    @ResponseBody
    public ResultData addCourse(HttpSession httpSession,CourseVO courseVO, HttpServletRequest request) {
        log.info("添加课程 {} ", courseVO);
        String path = "F:/Temp/Upload/Img";
        courseVO.setFiles(path);
        User user = (User) httpSession.getAttribute("user");
        try {
            MultipartFile multipartFile = courseVO.getFile();
            String filename = multipartFile.getOriginalFilename();
            File file = new File(path, filename);
            multipartFile.transferTo(file);
            courseVO.setCid(String.valueOf(new Date().getTime()));
            courseVO.setCourseimg(filename);
            courseVO.setUid(user.getUid());
            courseService.addCourse(courseVO);
            return new ResultData(ResultData.SUCCESS);
        } catch (CourseNotExistException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, e.getResultCodeEnum());
        } catch (IOException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS);
        }

    }

    private void madeErrorMessage(ResultData resultData, ResultCodeEnum resultCodeEnum) {
        resultData.setSuccess(ResultData.NOT_SUCCESS);
        resultData.setCode(resultCodeEnum.getResultCode());
        resultData.setMessage(resultCodeEnum.getResultMessage());
    }

}
