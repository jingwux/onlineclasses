package com.myyl.service;

import com.myyl.pojo.Data;
import com.myyl.vo.DataVO;

import java.util.List;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface DataService {
	public List<Data> findData(String cid); //通过搜索词查找资料
	public int deleteData(String did); //删除资料
	public int addData(Data data); //上传资料
	public List<DataVO> findAllData(); //通过搜索词查找资料
}