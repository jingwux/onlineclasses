package com.myyl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myyl.mapper.ChapterMapper;
import com.myyl.mapper.CourseMapper;
import com.myyl.pojo.Chapter;
import com.myyl.pojo.ChapterExample;
import com.myyl.pojo.Course;
import com.myyl.pojo.CourseExample;
import com.myyl.service.ChapterService;
import com.myyl.util.DateUtil;
import com.myyl.vo.ChapterVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChapterServiceImpl implements ChapterService {

    @Autowired
    private ChapterMapper chapterMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public long countByExample(ChapterExample example) {
        return chapterMapper.countByExample(new ChapterExample());
    }

    @Override
    public int deleteByPrimaryKey(String cpid) {
        return chapterMapper.deleteByPrimaryKey(cpid);
    }

    @Override
    public int insert(Chapter record) {
        Course course = courseMapper.selectByPrimaryKey(record.getCid());
        if (course != null) {
            record.setCpid(DateUtil.getLongTimeString());
            return chapterMapper.insertSelective(record);
        }
        throw new RuntimeException("课程不存在");
    }


    @Override
    public List<ChapterVO> selectByExample(String chapterInfo) {
        ChapterExample chapterExample = new ChapterExample();
        chapterExample.or().andCidEqualTo(chapterInfo);
        chapterExample.or().andCpnameLike("%" + chapterInfo + "%");
        List<Chapter> chapters = chapterMapper.selectByExample(chapterExample);
        return getChapterVOList(chapters);
    }

    @Override
    public Chapter selectByPrimaryKey(String cpid) {
        return chapterMapper.selectByPrimaryKey(cpid);
    }

    @Override
    public int updateByPrimaryKey(Chapter record) {
        return chapterMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public PageInfo<ChapterVO> getChapterByPage(Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        ChapterExample chapterExample = new ChapterExample();
        return getChapterVOPageInfo(chapterExample);
    }

    private PageInfo<ChapterVO> getChapterVOPageInfo(ChapterExample chapterExample) {
        List<Chapter> chapters = chapterMapper.selectByExample(chapterExample);

        PageInfo<Chapter> chapterPageInfo = new PageInfo<>(chapters);
        PageInfo<ChapterVO> chapterVOPageInfo = new PageInfo<>();

        BeanUtils.copyProperties(chapterPageInfo, chapterVOPageInfo);
        chapterVOPageInfo.setList(getChapterVOList(chapters));
        return chapterVOPageInfo;
    }

    @Override
    public PageInfo<ChapterVO> getChapterByCourseName(Integer pageIndex, Integer pageSize, String info) {
        if (StringUtils.isNotBlank(info)) {
            info = "%" + info + "%";
            // 根据课程名模糊查询
            CourseExample courseExample = new CourseExample();
            courseExample.or().andCnameLike(info);
            List<Course> courses = courseMapper.selectByExample(courseExample);
            List<String> cids = new ArrayList<>();
            for (Course course : courses) {
                cids.add(course.getCid());
            }

            PageHelper.startPage(pageIndex, pageSize);
            ChapterExample chapterExample = new ChapterExample();
            chapterExample.or().andCidIn(cids);

            return getChapterVOPageInfo(chapterExample);
        }
        return this.getChapterByPage(pageIndex, pageSize);
    }

    @Override
    public List<ChapterVO> getByCourseId(String cid) {
        ChapterExample chapterExample = new ChapterExample();
        chapterExample.or().andCidEqualTo(cid);
        return getChapterVOList(chapterMapper.selectByExample(chapterExample));
    }

    @Override
    public List<ChapterVO> getLv1Chapter(String cid) {
        ChapterExample chapterExample = new ChapterExample();
        chapterExample.or().andCidEqualTo(cid).andFlagEqualTo("0");

        return getChapterVOList(chapterMapper.selectByExample(chapterExample));
    }

    private List<ChapterVO> getChapterVOList(List<Chapter> chapters) {
        List<ChapterVO> chapterVOs = new ArrayList<>();
        for (Chapter chapter : chapters) {
            ChapterVO chapterVO = new ChapterVO();
            BeanUtils.copyProperties(chapter, chapterVO);
            cascadeGetCourseNameByCourseId(chapter.getCid(), chapterVO);
            chapterVOs.add(chapterVO);
        }
        return chapterVOs;
    }

    private void cascadeGetCourseNameByCourseId(String courseId, ChapterVO chapterVO) {
        Course course = courseMapper.selectByPrimaryKey(courseId);
        chapterVO.setCname(course.getCname());
    }


}
