package com.myyl.service;

import com.myyl.pojo.Data;
import com.myyl.vo.DataVO;

import java.util.List;

/**
 * 功能：资料实体类业务层接口
 * @author
 * @date
 */
public interface DataService {
	public List<Data> findData(String cid); //通过搜索词查找资料
	public int deleteData(String did); //删除资料
	public int addData(Data data); //上传资料
	public List<DataVO> findAllData(); //通过搜索词查找资料
}