package com.myyl.service;

import com.github.pagehelper.PageInfo;
import com.myyl.pojo.Chapter;
import com.myyl.pojo.ChapterExample;
import com.myyl.vo.ChapterVO;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface ChapterService {

    long countByExample(ChapterExample example);

    int deleteByPrimaryKey(String cpid);

    int insert(Chapter record);

    List<ChapterVO> selectByExample(String cid);

    Chapter selectByPrimaryKey(String cpid);

    int updateByPrimaryKey(Chapter record);

    PageInfo<ChapterVO> getChapterByPage(Integer pageIndex, Integer pageSize);

    PageInfo<ChapterVO> getChapterByCourseName(Integer pageIndex, Integer pageSize,String info);

    List<ChapterVO> getByCourseId(String cid);

    /**
     * @return
     */
    List<ChapterVO> getLv1Chapter(String cid);

}
