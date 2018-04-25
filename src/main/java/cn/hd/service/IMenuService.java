package cn.hd.service;

import java.util.List;


import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Menu;

public interface IMenuService{
/**
 * 增加
 */
	void save(Menu menu)  throws RuntimeException;
	/**
	 * 修改
	 */
	void update(Menu menu) throws RuntimeException;
	/**
	 * 删除
	 */
	void delete(int  id) throws RuntimeException;
	/**
	 * 查询单个
	 */
	Menu findById(int id) throws RuntimeException;
	/**
	 * 分页
	 */
	  PageInfo<Menu> query(BaseConditionVO vo);
		/**
		 * 查询所有
		 */
	  List<Menu> queryAll();
}
