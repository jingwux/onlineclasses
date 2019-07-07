package com.myyl.service.impl;

import com.myyl.mapper.CourseMapper;
import com.myyl.mapper.SelectcourseMapper;
import com.myyl.pojo.Course;
import com.myyl.pojo.CourseExample;
import com.myyl.pojo.Selectcourse;
import com.myyl.pojo.SelectcourseExample;
import com.myyl.service.SelectCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class SelectCourseServiceImpl implements SelectCourseService {

    @Autowired
    private SelectcourseMapper selectcourseMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> getCourseByUid(String uid) {
        SelectcourseExample selectcourseExample = new SelectcourseExample();
        selectcourseExample.or().andUidEqualTo(uid);
        List<Selectcourse> selectcourses = selectcourseMapper.selectByExample(selectcourseExample);
        CourseExample courseExample = new CourseExample();
        List<Course> courses = new ArrayList<>();
        for (Selectcourse selectcours : selectcourses) {
            courseExample.or().andCidEqualTo(selectcours.getCid());
            courses = courseMapper.selectByExample(courseExample);
        }
        return courses;
    }

    @Override
    public int updateSelectCourse(Selectcourse selectcourse,String uid, String cid) {
        SelectcourseExample selectcourseExample = new SelectcourseExample();
        selectcourseExample.or().andUidEqualTo(uid).andCidEqualTo(cid);
       // List<Selectcourse> selectcourse1 = selectcourseMapper.selectByExample(selectcourseExample);
        return selectcourseMapper.updateByExampleSelective(selectcourse,selectcourseExample);
    }

    @Override
    public List<Selectcourse> getCourseByUidAndCid(String uid, String cid) {
        SelectcourseExample selectcourseExample = new SelectcourseExample();
        selectcourseExample.or().andCidEqualTo(cid).andUidEqualTo(uid);
        return selectcourseMapper.selectByExample(selectcourseExample);

    }

    @Override
    public int insertRecord(String cid,String uid) {
        Selectcourse selectcourse = new Selectcourse();
        selectcourse.setCid(cid);
        selectcourse.setUid(uid);
        selectcourse.setScore("0");
        selectcourse.setStatus(1);
        return selectcourseMapper.insertSelective(selectcourse);
    }
}
