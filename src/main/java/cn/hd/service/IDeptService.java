package cn.hd.service;

import java.util.List;


import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Dept;

public interface IDeptService {
/**
 * 增加
 */
	void save(Dept dept)  throws RuntimeException;
	/**
	 * 修改
	 */
	void update(Dept dept) throws RuntimeException;
	/**
	 * 删除
	 */
	void delete(int  id) throws RuntimeException;
	/**
	 * 查询单个
	 */
	Dept findById(int id) throws RuntimeException;
	/**
	 * 分页
	 */
	  PageInfo<Dept> query(BaseConditionVO vo);
		/**
		 * 查询所有
		 */
	  List<Dept> queryAll();
}
