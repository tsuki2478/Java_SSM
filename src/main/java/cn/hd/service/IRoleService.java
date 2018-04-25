package cn.hd.service;

import java.util.List;



import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Dept;
import cn.hd.model.Rolebean;

public interface IRoleService {
/**
 * 增加
 */
	void save(Rolebean role)  throws RuntimeException;
	/**
	 * 修改
	 */
	void update(Rolebean role) throws RuntimeException;
	/**
	 * 删除
	 */
	void delete(int  id) throws RuntimeException;
	/**
	 * 查询单个
	 */
	Rolebean findById(int id) throws RuntimeException;
	/**
	 * 分页
	 */
	  PageInfo<Rolebean> query(BaseConditionVO vo);
		/**
		 * 查询所有
		 */
	  List<Rolebean> queryAll();
	  /**
	   * 根据角色id取出这个角色所拥有的菜单(权限)
	   * @param id
	   * @return
	   */
		List<Integer> findMidsByRid(int id);
		   /**
		    * 授权 ，保存到中间表
		    * @param role
		    */
		void saveRidAndMids(Rolebean role);
		
}
