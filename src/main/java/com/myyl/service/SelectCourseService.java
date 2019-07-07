package com.myyl.service;

import com.myyl.pojo.Course;
import com.myyl.pojo.Selectcourse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface SelectCourseService {
    List<Course> getCourseByUid(String uid);

    int updateSelectCourse(Selectcourse selectcourse,String uid, String cid);

    List<Selectcourse> getCourseByUidAndCid(String uid,String cid);

    int insertRecord(String cid,String uid);
}
