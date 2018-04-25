package cn.hd.service;

import java.util.List;


import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Data;

public interface IDataService{
/**Data
 * 增加
 */
	void save(Data data)  throws RuntimeException;
	/**
	 * 修改
	 */
	void update(Data data) throws RuntimeException;
	/**
	 * 删除
	 */
	void delete(int  id) throws RuntimeException;
	/**
	 * 查询单个
	 */
	Data findById(int id) throws RuntimeException;
	/**
	 * 分页
	 */
	  PageInfo<Data> query(BaseConditionVO vo);
		/**
		 * 查询所有
		 */
	  List<Data> queryAll();
}
