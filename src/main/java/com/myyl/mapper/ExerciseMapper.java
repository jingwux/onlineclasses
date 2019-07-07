package com.myyl.mapper;

import com.myyl.pojo.Exercise;
import com.myyl.pojo.ExerciseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExerciseMapper {
    long countByExample(ExerciseExample example);

    int deleteByExample(ExerciseExample example);

    int deleteByPrimaryKey(String eid);

    int insert(Exercise record);

    int insertSelective(Exercise record);

    List<Exercise> selectByExample(ExerciseExample example);

    Exercise selectByPrimaryKey(String eid);

    int updateByExampleSelective(@Param("record") Exercise record, @Param("example") ExerciseExample example);

    int updateByExample(@Param("record") Exercise record, @Param("example") ExerciseExample example);

    int updateByPrimaryKeySelective(Exercise record);

    int updateByPrimaryKey(Exercise record);
}