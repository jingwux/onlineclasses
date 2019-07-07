package com.myyl.magsystem.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myyl.common.ResultData;
import com.myyl.pojo.Coursetype;
import com.myyl.service.CourseTypeService;
import com.myyl.vo.CourseTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@RestController
@RequestMapping("/courseTypeManage")
public class CourseTypeManageController {

    @Autowired
    private CourseTypeService courseTypeService;

    private final String COURSE_DIRECTION = "0";

    /**
     * 查询课程类型
     *
     * @param courseType
     * @param parType
     * @return
     */
    @RequestMapping("/getCourseType/{courseType}/{parType}")
    public ResultData loadCourseType(@PathVariable("courseType") String courseType, @PathVariable("parType") String parType) {
        //当courseType = 0 查询课程方向
        List<Coursetype> courseDirection = courseTypeService.getCourseTypeByParType(COURSE_DIRECTION.equals(courseType) ? COURSE_DIRECTION : parType);
        return new ResultData(ResultData.SUCCESS, courseDirection);
    }


    @RequestMapping("/listCourseType")
    public ResultData listCourseType(@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<CourseTypeVO> courseTypeVOList = courseTypeService.getCourseType();
        PageInfo<CourseTypeVO> courseTypeVOPageInfo = new PageInfo<>(courseTypeVOList);
        return new ResultData(ResultData.SUCCESS, courseTypeVOPageInfo);
    }



    @RequestMapping("/list")
    public ResultData listCourseType(@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize,
                                     @RequestParam("courseDirectId") String courseDirectId, @RequestParam("courseTypeName") String courseTypeName) {
        PageInfo<CourseTypeVO> type = courseTypeService.getCourseTypeByCondition(pageIndex, pageSize, courseDirectId, courseTypeName);
        return new ResultData(ResultData.SUCCESS,  type);
    }


    @RequestMapping("/listCourseType/{courseTypeName}/{courseDirectId}")
    public ResultData listCourseTypeByCondition(@PathVariable String courseTypeName, @PathVariable String courseDirectId) {
        ResultData resultData = new ResultData();
        List<CourseTypeVO> courseType = courseTypeService.getCourseTypeByCondition(courseTypeName, courseDirectId);
        resultData.setData(courseType);
        resultData.setSuccess(true);
        return resultData;
    }


    @RequestMapping("/updateCourseType")
    public ResultData updateCourseType(Coursetype courseType) {
        ResultData resultData = new ResultData();
        int i = courseTypeService.updateCourseType(courseType);
        if (i > 0) {
            resultData.setSuccess(ResultData.SUCCESS);
            resultData.setMessage("更新成功");
            return resultData;
        }
        resultData.setSuccess(ResultData.NOT_SUCCESS);
        resultData.setMessage("更新失败");
        return resultData;
    }


    @RequestMapping("/deleteCourseType/{courseTypeId}")
    public ResultData deleteCourseType(@PathVariable String courseTypeId) {
        ResultData resultData = new ResultData();
        int i = courseTypeService.deleteCourseType(courseTypeId);
        if (i > 0) {
            resultData.setSuccess(ResultData.SUCCESS);
            resultData.setMessage("删除成功");
            return resultData;
        }
        resultData.setSuccess(ResultData.NOT_SUCCESS);
        resultData.setMessage("删除失败");
        return resultData;
    }


    @RequestMapping("/addCourseType")
    public ResultData addCourseType(Coursetype courseType) {
        ResultData resultData = new ResultData();
        int i = courseTypeService.addCourseType(courseType);
        if (i > 0) {
            resultData.setSuccess(ResultData.SUCCESS);
            resultData.setMessage("添加成功");
            return resultData;
        }
        resultData.setSuccess(ResultData.NOT_SUCCESS);
        resultData.setMessage("添加失败");
        return resultData;
    }


}
