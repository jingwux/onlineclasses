package com.myyl.service.impl;

import com.myyl.mapper.CourseMapper;
import com.myyl.mapper.DataMapper;
import com.myyl.pojo.Data;
import com.myyl.pojo.DataExample;
import com.myyl.service.DataService;
import com.myyl.vo.DataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
@Transactional
public class DataServiceImpl implements DataService {

    @Autowired
    private DataMapper dataMapper;
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Data> findData(String cid) {
        DataExample dataExample = new DataExample();
        dataExample.or().andCidEqualTo(cid);
        return dataMapper.selectByExample(dataExample);
    }



    @Override
    public int deleteData(String did) {
        return dataMapper.deleteByPrimaryKey(did);
    }

    @Override
    public int addData(Data data) {
        return dataMapper.insert(data);
    }

    @Override
    public List<DataVO> findAllData() {
        DataExample dataExample = new DataExample();
        List<Data> dataList = dataMapper.selectByExample(dataExample);
        List<DataVO> dataVOList = new ArrayList<>();
        for (Data data : dataList) {
            DataVO dataVO = new DataVO();
            dataVO.setDid(data.getDid());
            dataVO.setCid(data.getCid());
            dataVO.setDname(data.getDname());
            dataVO.setCname(courseMapper.selectByPrimaryKey(data.getCid()).getCname());
            dataVOList.add(dataVO);
        }
        return dataVOList;
    }
}
