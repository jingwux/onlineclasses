package com.myyl.service;

import com.myyl.pojo.Exercise;
import com.myyl.pojo.Work;
import com.myyl.vo.WorkVO;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface WorkService {

    List<WorkVO> getWorkInfo(String id); //通过编号获取作业信息

    List<Work> getWorkByCid (String cid);

    List<Work> getWorkByCidAndUid(String cid, String uid); //通过作业号与学号获取作业

    int addWork(Work work); //添加作业

    int saveWork(Work work); //保存作业

     int updateWork(Work work, String uid, String cid);


}
