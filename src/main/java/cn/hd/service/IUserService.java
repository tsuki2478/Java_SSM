	package cn.hd.service;

import java.util.List;


import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Userbean;

public interface IUserService {
/**
 * 增加
 */
	void save(Userbean user)  throws RuntimeException;
	/**
	 * 修改
	 */
	void update(Userbean user) throws RuntimeException;
	/**
	 * 删除
	 */
	void delete(int  id) throws RuntimeException;
	/**
	 * 查询单个
	 */
	 Userbean findById(int id) throws RuntimeException;
	/**
	 * 查询所有
	 */
PageInfo<Userbean> query(BaseConditionVO vo);
		/**
	    * 根据用户名到数据库中查询，如果有记录，就表示已经存在
	    * @param username
	    * @return
	    */
	Userbean findByUsername(String username);
/**
 * 根据部门id找出这个部门下所有的用户列表 
 * @param did
 * @return
 */
	List<Userbean> queryUserByDid(int did);
	/**
	 * 根据用户名及密码查询
	 * @param username
	 * @param pwd
	 * @return
	 */
	Userbean findUserByNameAndPwd(String username, String pwd)throws Exception;
}
