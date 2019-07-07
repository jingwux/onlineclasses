package com.myyl.mapper;

import com.myyl.pojo.Course;
import com.myyl.pojo.CourseExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class CourseMapperTest {

    @Autowired
    private CourseMapper courseMapper;

    @Test
    public void selectByExample() {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andCnameLike("%C++%");
        List<Course> courses = courseMapper.selectByExample(courseExample);
        for (Course course : courses) {
            System.out.println(course);
        }

    }


}