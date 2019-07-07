package com.myyl.service;

import com.github.pagehelper.PageInfo;
import com.myyl.pojo.Coursetype;
import com.myyl.vo.CourseTypeVO;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface CourseTypeService {

    String COURSE_TYPE_DIRECTION_ID = "0";  //  parType=0的数据为课程方向

    int addCourseType(Coursetype ty); //添加课程方向

    /**
     * 通过课程 id 获取课程类别
     *
     * @param courseTypeId
     * @return
     */
    Coursetype getCourseTypeByCourseTypeId(String courseTypeId); //获取课程类型信息

    List<CourseTypeVO> getCourseTypeByCondition(String courseTypeName, String courseDirect); //获取课程类型信息


    PageInfo<CourseTypeVO> getCourseTypeByCondition(Integer pageIndex, Integer pageSize, String did, String courseTypeName);

    int deleteCourseType(String typeId); //删除课程类型信息

    int updateCourseType(Coursetype courseType); //更新课程类型信息

    /**
     * 获取课程方向
     *
     * @param parType
     * @return
     */
    List<Coursetype> getCourseDirection(String parType); //获取课程类型信息

    /**
     * 获取课程方向下的课程类别
     *
     * @param parType
     * @return
     */
    List<Coursetype> getCourseTypeByParType(String parType);

    List<CourseTypeVO> getCourseType();

}
