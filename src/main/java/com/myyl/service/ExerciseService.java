package com.myyl.service;

import com.myyl.pojo.Exercise;
import com.myyl.vo.ExeriseVO;

import java.util.List;

/**
 * 功能：作业业务层接口
 *
 * @author
 * @date
 */
public interface ExerciseService {

    List<Exercise> getExerciseInfo(String id); //通过编号获取作业信息

    List<Exercise> getExerciseByEidAndUid(String cid, String uid); //通过作业号与学号获取作业

    //	List<Exercise> getExerciseInfo(String info); //获取作业信息
    int updateExercise(Exercise exer); //更新作业信息

    int backExercise(String eid); //退回作业

    int addExercise(Exercise exer); //添加作业

    int saveExercise(Exercise exer); //保存作业

    /**
     * 老师发布作业
     * @param exeriseVO
     * @return
     */
    int addExercise(ExeriseVO exeriseVO);

}
