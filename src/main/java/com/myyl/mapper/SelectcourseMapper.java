package com.myyl.mapper;

import com.myyl.pojo.Selectcourse;
import com.myyl.pojo.SelectcourseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface SelectcourseMapper {
    long countByExample(SelectcourseExample example);

    int deleteByExample(SelectcourseExample example);

    int insert(Selectcourse record);

    int insertSelective(Selectcourse record);

    List<Selectcourse> selectByExample(SelectcourseExample example);

    int updateByExampleSelective(@Param("record") Selectcourse record, @Param("example") SelectcourseExample example);

    int updateByExample(@Param("record") Selectcourse record, @Param("example") SelectcourseExample example);
}