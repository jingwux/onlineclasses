package com.myyl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.CourseNotExistException;
import com.myyl.mapper.CourseMapper;
import com.myyl.mapper.SelectcourseMapper;
import com.myyl.mapper.UserMapper;
import com.myyl.pojo.*;
import com.myyl.service.CourseService;
import com.myyl.usersystem.entity.CourseVo;
import com.myyl.vo.CourseVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SelectcourseMapper selectcourseMapper;

    @Override
    public PageInfo<CourseVO> getCourseByPage(Integer pageIndex, Integer pageSize) {
        // 分页查询开始
        PageHelper.startPage(pageIndex, pageSize);
        CourseExample courseExample = new CourseExample();
        List<Course> courses = courseMapper.selectByExample(courseExample);
        PageInfo<Course> coursesInfo = new PageInfo<>(courses);
        // 级联查询
        List<CourseVO> courseVOList = new ArrayList<>(pageSize);
        int i = 0;
        for (Course course : courses) {
            if (i >= pageSize) break;
            CourseVO courseVO = new CourseVO();
            cascadeSelectTeacherInfoById(course, courseVO);
            courseVOList.add(courseVO);
        }
        PageInfo<CourseVO> courseVOPageInfo = new PageInfo<>();
        // 将coursesInfo的值拷贝至courseVOPageInfo
        BeanUtils.copyProperties(coursesInfo, courseVOPageInfo);
        // 重新设置 list 数据
        courseVOPageInfo.setList(courseVOList);
        return courseVOPageInfo;
    }

    @Override
    public List<CourseVO> getCourseByInfo(String info) {
        CourseExample courseExample = new CourseExample();
        info = "%" + info + "%";
        courseExample.or().andCnameLike(info);
        courseExample.or().andCidLike(info);
        List<Course> courses = courseMapper.selectByExample(courseExample);
        if (courses.isEmpty()) {
            throw new CourseNotExistException(ResultCodeEnum.COURSE_ERROR);
        }

        return getCourseVOList(courses);
    }

    @Override
    public List<CourseVo> getCourseByInfo1(String info) {
        CourseExample courseExample = new CourseExample();
        info = "%" + info + "%";
        courseExample.or().andCnameLike(info);
        courseExample.or().andCidLike(info);
        List<Course> courses = courseMapper.selectByExample(courseExample);
//        if (courses.isEmpty()) {
//            throw new CourseNotExistException(ResultCodeEnum.COURSE_ERROR);
//        }

        return getCourseVoList(courses);
    }

    @Override
    public PageInfo<CourseVO> getCourseByInfo(int pageIndex, int pageSize, String info) {
        PageHelper.startPage(pageIndex, pageSize);
        return new PageInfo<>(this.getCourseByInfo(info));
    }

    @Override
    public PageInfo<CourseVO> getApproveCourse(int pageIndex, int pageSize, String info, Integer status) {
        PageHelper.startPage(pageIndex, pageSize);

        CourseExample example = new CourseExample();
        example.or().andStatusEqualTo(status);
        List<Course> courses = courseMapper.selectByExample(example);

        return new PageInfo<>(getCourseVOList(courses));
    }

    @Override
    public PageInfo<CourseVO> getTeacherApplyCourse(int pageIndex, int pageSize, String uid, String info) {
        PageHelper.startPage(pageIndex, pageSize);

        CourseExample example = new CourseExample();
        List<Integer> list = new ArrayList<>();
        list.add(0);
        list.add(2);
        example.or().andUidEqualTo(uid).andStatusIn(list);
        List<Course> courses = courseMapper.selectByExample(example);

        return new PageInfo<>(getCourseVOList(courses));
    }

    @Override
    public int updateCourse(CourseVO courseVO) {
        Course course = new Course();
        BeanUtils.copyProperties(courseVO, course);
        return courseMapper.updateByPrimaryKeySelective(course);
    }

    @Override
    public int addCourse(CourseVO courseVO) {
        Course course = new Course();
        BeanUtils.copyProperties(courseVO, course);
        course.setStatus(CourseVO.APPLY);
        return courseMapper.insertSelective(course);
    }

    @Override
    public int deleteCourse(String cid) {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andCidEqualTo(cid);
        int i = courseMapper.deleteByPrimaryKey(cid);

        // 级联删除
        SelectcourseExample selectcourseExample = new SelectcourseExample();
        selectcourseExample.or().andCidEqualTo(cid);
        selectcourseMapper.deleteByExample(selectcourseExample);
        return i;
    }

    @Override
    public List<CourseVO> getCourseByUid(String uid, Integer role) {
        List<CourseVO> courseVOList = new ArrayList<>();
        if (TEACHER.equals(role)) {
            CourseExample courseExample = new CourseExample();
            courseExample.or().andUidEqualTo(uid);
            List<Course> courses = courseMapper.selectByExample(courseExample);

            //查询老师的信息
            UserExample userExample = new UserExample();
            userExample.or().andUidEqualTo(uid).andRoleEqualTo(role);
            List<User> teachers = userMapper.selectByExample(userExample);
            //赋值至vo
            for (Course course : courses) {
                CourseVO courseVO = new CourseVO();
                BeanUtils.copyProperties(course, courseVO);
                courseVO.setTeacherId(teachers.get(0).getUid());
                courseVO.setTeacherName(teachers.get(0).getUname());
                courseVOList.add(courseVO);
            }

        } else if (STUDENT.equals(role)) {
            SelectcourseExample selectcourseExample = new SelectcourseExample();
            selectcourseExample.or().andUidEqualTo(uid);
            List<Selectcourse> selectCourses = selectcourseMapper.selectByExample(selectcourseExample);
            //根据学生选课表查询所选课程
            for (Selectcourse selectCourse : selectCourses) {
                Course course = courseMapper.selectByPrimaryKey(selectCourse.getCid());
                CourseVO courseVO = new CourseVO();
                BeanUtils.copyProperties(course, courseVO);
                courseVOList.add(courseVO);
            }
        }

        return courseVOList;
    }

    @Override
    public Course getCourseByCid(String cid) {
        return courseMapper.selectByPrimaryKey(cid);
    }

    @Override
    public CourseVO getCourseIncludeTeacherByCid(String cid) {
        Course course = this.getCourseByCid(cid);
        CourseVO courseVO = new CourseVO();
        BeanUtils.copyProperties(course, courseVO);
        User teacher = userMapper.selectByPrimaryKey(course.getUid());
        courseVO.setTeacherId(teacher.getUid());
        courseVO.setTeacherName(teacher.getUname());
        return courseVO;
    }

    @Override
    public List<Course> getCourseByUid(String uid) {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andUidEqualTo(uid);
        return courseMapper.selectByExample(courseExample);
    }

    @Override
    public List<CourseVO> getHotCourseTop() {
        CourseExample courseExample = new CourseExample();
        courseExample.setOrderByClause("accessNum desc ");
        courseExample.setLimit(10);
        List<Course> courses = courseMapper.selectByExample(courseExample);
        return getCourseVOList(courses);
    }


    private void cascadeSelectTeacherInfoById(Course course, CourseVO courseVO) {
        User user = userMapper.selectByPrimaryKey(course.getUid());
        // 将course的的拷贝至courseVO
        BeanUtils.copyProperties(course, courseVO);
        HashSet<User> users = new HashSet<>();
        users.add(user);
        courseVO.setUsers(users);

    }


    private List<CourseVO> getCourseVOList(List<Course> courses) {
        List<CourseVO> courseVOList = new ArrayList<>();
        for (Course course : courses) {
            CourseVO courseVO = new CourseVO();
            cascadeSelectTeacherInfoById(course, courseVO);
            courseVOList.add(courseVO);
        }
        return courseVOList;
    }

    private List<CourseVo> getCourseVoList(List<Course> courses) {
        List<CourseVo> courseVOList = new ArrayList<>();
        for (Course course : courses) {
            CourseVo courseVO = new CourseVo();
            User user = userMapper.selectByPrimaryKey(course.getUid());
            // 将course的的拷贝至courseVO
            BeanUtils.copyProperties(course, courseVO);
            courseVO.setUname(user.getUname());
            courseVOList.add(courseVO);
        }
        return courseVOList;
    }

}
