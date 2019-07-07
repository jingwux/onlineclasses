package com.myyl.service.impl;

import com.myyl.mapper.ExerciseMapper;
import com.myyl.mapper.UserMapper;
import com.myyl.mapper.WorkMapper;
import com.myyl.pojo.*;
import com.myyl.service.ExerciseService;
import com.myyl.service.WorkService;
import com.myyl.vo.WorkVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkMapper workMapper;
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<WorkVO> getWorkInfo(String cid) {
        WorkExample workExample = new WorkExample();
        workExample.or().andCidEqualTo(cid);
        List<Work> workList = workMapper.selectByExample(workExample);
        List<WorkVO> workVOList = new ArrayList<>();
        for (Work work : workList) {
            User user = userMapper.selectByPrimaryKey(work.getUid());
            WorkVO workVO = new WorkVO();
            BeanUtils.copyProperties(work,workVO);
            workVO.setUname(user.getUname());
            workVOList.add(workVO);
        }
        return workVOList;
    }

    @Override
    public List<Work> getWorkByCid(String cid) {
        WorkExample workExample = new WorkExample();
        workExample.or().andCidEqualTo(cid);
        return workMapper.selectByExample(workExample);
    }

    @Override
    public List<Work> getWorkByCidAndUid(String cid, String uid) {
        WorkExample workExample = new WorkExample();
        workExample.or().andCidEqualTo(cid).andUidEqualTo(uid);
        return workMapper.selectByExample(workExample);
    }

    @Override
    public int updateWork(Work work, String uid, String cid) {
        WorkExample workExample = new WorkExample();
        workExample.or().andUidEqualTo(uid).andCidEqualTo(cid);

        return workMapper.updateByExampleSelective(work,workExample);
    }
    @Override
    public int addWork(Work work) {
        WorkExample workExample = new WorkExample();
        workExample.or().andCidEqualTo(work.getCid()).andUidEqualTo(work.getUid());
        List<Work> works = workMapper.selectByExample(workExample);
        if(works.size() == 0) {
            return workMapper.insertSelective(work);
        }
        works.get(0).setFilepath(work.getFilepath());
        works.get(0).setFilename(work.getFilename());
        works.get(0).setWname(work.getWname());
        return workMapper.updateByPrimaryKeySelective(works.get(0));
    }

    @Override
    public int saveWork(Work work) {
        return 0;
    }
}
