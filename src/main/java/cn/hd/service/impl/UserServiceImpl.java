package cn.hd.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hd.mapper.UserbeanMapper;
import cn.hd.model.BaseConditionVO;
import cn.hd.model.Userbean;
import cn.hd.service.IUserService;
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserbeanMapper userMapper;
	
	@Override
	public void save(Userbean user) throws RuntimeException {
		// TODO Auto-generated method stub
//			1 先保存到用户表
		userMapper.insertSelective(user);
//			2在保存到用户与角色的中间表
		List<Integer> rids=user.getRids();
		if (rids!=null && rids.size()>0) {
			for (Integer rid : rids) {
		userMapper.insertUseridAndRid(user.getUserid(),rid);
			}
		}
		
	}

	@Override
	public void update(Userbean user) throws RuntimeException {
		// TODO Auto-generated method stub
//		根据用户id修改用户信息
		userMapper.updateByPrimaryKeySelective(user);
//		根据用户id先删除中间表
		userMapper.deleteUseridAndRidByUserid(user.getUserid());
//		增加到中间表
		List<Integer> rids= user.getRids();
		if (rids!=null && rids.size()>0) {
			for (Integer rid : rids) {
				userMapper.insertUseridAndRid(user.getUserid(), rid);
			}
		}
	}

	@Override
	public void delete(int id) throws RuntimeException {
		// TODO Auto-generated method stub
//		线删除中间表（从表）
		userMapper.deleteUseridAndRidByUserid(id);
//		在删除用户信息表（主表）
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Userbean findById(int id) throws RuntimeException {
		// TODO Auto-generated method stub
//		根据用户id取出用户信息
		 Userbean user = userMapper.selectByPrimaryKey(id);
//		取出一个用户的所拥有的的角色信息
		List<Integer> rids=userMapper.findRidsByUserid(id);
		if (rids!=null && rids.size()>0) {
			user.setRids(rids);
		}
		return  user;
	}

	@Override
	public PageInfo<Userbean> query(BaseConditionVO vo)  {
		// TODO Auto-generated method stub
		PageHelper.startPage(vo.getPageNum(), vo.getPageSize());
		List<Userbean> list=userMapper.query(vo);
		PageInfo<Userbean> pageInfo=new PageInfo<>(list);
		return pageInfo;
	}
 
	@Override
	public Userbean findByUsername(String username) {
		// TODO Auto-generated method stub
		Userbean user=userMapper.findByUsername(username);
		return user;
	}

	@Override
	public List<Userbean> queryUserByDid(int did) {
		// TODO Auto-generated method stub
		List<Userbean> list= userMapper.queryUserByDid(did);
		return list;
	}

	@Override
	public Userbean findUserByNameAndPwd(String username, String pwd) throws Exception {
		// TODO Auto-generated method stub
	Userbean  user= userMapper.findByUsername(username);
		if (user!=null) {
			if (user.getPassword().equals(pwd)) {
				return user;
			}else{
				//密码错误
				throw new Exception("用户名或密码出错");
			}
		}else{
//		用户名错误
			throw new Exception("用户名或密码错误");
		}
			
	}
}
