package com.myyl.service;

import com.github.pagehelper.PageInfo;
import com.myyl.pojo.Course;
import com.myyl.usersystem.entity.CourseVo;
import com.myyl.vo.CourseVO;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface CourseService {

     Integer STUDENT = 1;

     Integer TEACHER = 2;

    /**
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    PageInfo<CourseVO> getCourseByPage(Integer pageIndex, Integer pageSize);

    /**
     *
     * @param info
     * @return
     */
    List<CourseVO> getCourseByInfo(String info); // 获取课程信息

    List<CourseVo> getCourseByInfo1(String info); // 获取课程信息

    PageInfo<CourseVO> getCourseByInfo(int pageIndex, int pageSize, String info); // 获取课程信息

    PageInfo<CourseVO> getApproveCourse(int pageIndex, int pageSize, String info, Integer status); // 获取课程信息

    PageInfo<CourseVO> getTeacherApplyCourse(int pageIndex, int pageSize,String uid, String info);

    /**
     *
     * @param courseVO
     * @return
     */
    int updateCourse(CourseVO courseVO); //更新课程信息

    int addCourse(CourseVO courseVO); //添加课程信息

    int deleteCourse(String cid); //通过cid删除课程

    List<CourseVO> getCourseByUid(String uid, Integer role); //通过教师id获取此教师所有课程，如果为管理员则可获取所有课程

   Course getCourseByCid(String cid);

    CourseVO getCourseIncludeTeacherByCid(String cid);

   List<Course> getCourseByUid(String uid);

   List<CourseVO> getHotCourseTop();

}
