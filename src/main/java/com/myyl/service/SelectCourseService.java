package com.myyl.service;

import com.myyl.pojo.Course;
import com.myyl.pojo.Selectcourse;
import org.springframework.stereotype.Service;

import java.util.List;

public interface SelectCourseService {
    List<Course> getCourseByUid(String uid);

    int updateSelectCourse(Selectcourse selectcourse,String uid, String cid);

    List<Selectcourse> getCourseByUidAndCid(String uid,String cid);

    int insertRecord(String cid,String uid);
}
