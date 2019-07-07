package com.myyl.service.impl;

import com.github.pagehelper.PageInfo;
import com.myyl.service.CourseService;
import com.myyl.vo.CourseVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class CourseServiceImplTest {

    @Autowired
    private CourseService courseService;

    @Test
    public void getCourseByPage() {
        PageInfo<CourseVO> courseByPage = courseService.getCourseByPage(1, 2);
        System.out.println(courseByPage);
        List<CourseVO> list = courseByPage.getList();
        for (CourseVO course : list) {
          System.out.println(course);
        }
    }


    @Test
    public void getCourseByInfo() {
        List<CourseVO> courseByInfo = courseService.getCourseByInfo("C++");
        for (CourseVO courseVO : courseByInfo) {
            System.out.println(courseVO);
        }


    }


    @Test
    public void getHotCourseTop5(){
        List<CourseVO> cs = courseService.getHotCourseTop();
        for (CourseVO c : cs) {
            System.out.println(c.getAccessnum());
        }

    }
}