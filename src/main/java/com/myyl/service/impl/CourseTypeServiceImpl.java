package com.myyl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myyl.mapper.CoursetypeMapper;
import com.myyl.pojo.Coursetype;
import com.myyl.pojo.CoursetypeExample;
import com.myyl.service.CourseTypeService;
import com.myyl.vo.CourseTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
public class CourseTypeServiceImpl implements CourseTypeService {

    @Autowired
    private CoursetypeMapper coursetypeMapper;


    @Override
    public int addCourseType(Coursetype courseType) {
        return coursetypeMapper.insertSelective(courseType);
    }

    @Override
    public Coursetype getCourseTypeByCourseTypeId(String courseTypeId) {
        return coursetypeMapper.selectByPrimaryKey(courseTypeId);
    }

    @Override
    public List<CourseTypeVO> getCourseTypeByCondition(String courseTypeName, String courseDirect) {
        CoursetypeExample coursetypeExample = new CoursetypeExample();
        coursetypeExample.or().andCtnameLike(courseTypeName);
        coursetypeExample.or().andPartypeEqualTo(courseDirect);
        List<Coursetype> coursetypes = coursetypeMapper.selectByExample(coursetypeExample);
        return getDirectionName(coursetypes);
    }

    @Override
    public PageInfo<CourseTypeVO> getCourseTypeByCondition(Integer pageIndex, Integer pageSize, String did, String courseTypeName) {
        PageHelper.startPage(pageIndex, pageSize);
        CoursetypeExample coursetypeExample = new CoursetypeExample();
        coursetypeExample.or().andCtnameLike(courseTypeName);
        coursetypeExample.or().andPartypeEqualTo(did);
        return new PageInfo<>(getDirectionName(coursetypeMapper.selectByExample(coursetypeExample)));
    }

    @Override
    public int deleteCourseType(String typeId) {
        return coursetypeMapper.deleteByPrimaryKey(typeId);
    }

    @Override
    public int updateCourseType(Coursetype courseType) {
        return coursetypeMapper.updateByPrimaryKeySelective(courseType);
    }

    @Override
    public List<Coursetype> getCourseDirection(String parType) {

        CoursetypeExample coursetypeExample = new CoursetypeExample();
        coursetypeExample.or().andPartypeEqualTo(parType);
        return coursetypeMapper.selectByExample(coursetypeExample);
    }

    @Override
    public List<Coursetype> getCourseTypeByParType(String parType) {
        CoursetypeExample coursetypeExample = new CoursetypeExample();
//        coursetypeExample.or().andTypeidEqualTo(parType);
        coursetypeExample.or().andPartypeEqualTo(parType);

        return coursetypeMapper.selectByExample(coursetypeExample);
    }

    @Override
    public List<CourseTypeVO> getCourseType() {
        CoursetypeExample coursetypeExample = new CoursetypeExample();
        coursetypeExample.or().andPartypeNotEqualTo(COURSE_TYPE_DIRECTION_ID);
        List<Coursetype> coursetypes = coursetypeMapper.selectByExample(coursetypeExample);
        return getDirectionName(coursetypes);
    }

    private List<CourseTypeVO> getDirectionName(List<Coursetype> coursetypes) {
        List<CourseTypeVO> courseTypeVOList = new ArrayList<>();
        for (Coursetype coursetype : coursetypes) {
            CourseTypeVO courseTypeVO = new CourseTypeVO();
            courseTypeVO.setCourseTypeId(coursetype.getTypeid());
            courseTypeVO.setCourseTypeName(coursetype.getCtname());
            //课程类型的 Partype 即为 课程方向的 id
            courseTypeVO.setCourseDirectionName(coursetypeMapper.selectByPrimaryKey(coursetype.getPartype()).getCtname());
            courseTypeVOList.add(courseTypeVO);
        }
        return courseTypeVOList;

    }


}
