package com.myyl.service.impl;

import com.myyl.mapper.ExerciseMapper;
import com.myyl.pojo.Exercise;
import com.myyl.pojo.ExerciseExample;
import com.myyl.service.ExerciseService;
import com.myyl.util.DateUtil;
import com.myyl.vo.ExeriseVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class  ExerciseServiceImpl implements ExerciseService {
    @Autowired
    private ExerciseMapper exerciseMapper;

    @Override
    public List<Exercise> getExerciseInfo(String id) {
        ExerciseExample exerciseExample = new ExerciseExample();
        exerciseExample.or().andPareidEqualTo(id);
        return  exerciseMapper.selectByExample(exerciseExample);
    }

    @Override
    public List<Exercise> getExerciseByEidAndUid(String cid, String uid) {
        ExerciseExample exerciseExample = new ExerciseExample();
        exerciseExample.or().andUidEqualTo(uid).andPareidEqualTo(cid);
        return exerciseMapper.selectByExample(exerciseExample);
    }

    @Override
    public int updateExercise(Exercise exer) {
        return 0;
    }

    @Override
    public int backExercise(String eid) {
        return 0;
    }

    @Override
    public int addExercise(Exercise exer) {
        ExerciseExample exerciseExample = new ExerciseExample();
        exerciseExample.or().andPareidEqualTo(exer.getPareid()).andUidEqualTo(exer.getUid());
        List<Exercise> exercises = exerciseMapper.selectByExample(exerciseExample);
        if(exercises.size() == 0) {
            exer.setEid(String.valueOf(new Date().getTime()));
            return exerciseMapper.insertSelective(exer);
        }
        exercises.get(0).setAttachment(exer.getAttachment());
        exercises.get(0).setEname(exer.getEname());
        return exerciseMapper.updateByPrimaryKeySelective(exercises.get(0));
    }

    @Override
    public int saveExercise(Exercise exer) {
        return 0;
    }

    @Override
    public int addExercise(ExeriseVO exeriseVO) {
        Exercise exercise = new Exercise();
        BeanUtils.copyProperties(exeriseVO, exercise);
        exercise.setEid(DateUtil.getLongTimeString());

        String path = "F:/Temp/Upload/Img";
        MultipartFile multipartFile = exeriseVO.getFile();
        try {
            if (!multipartFile.isEmpty()){
                String filename = multipartFile.getOriginalFilename();
                File file = new File(path, filename);
                exercise.setAttachment(multipartFile.getOriginalFilename());
                multipartFile.transferTo(file);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        exercise.setStatus("1");
        exercise.setPareid(exeriseVO.getCid());
        return exerciseMapper.insertSelective(exercise);
    }
}
