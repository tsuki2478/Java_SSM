package cn.hd.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hd.mapper.RolebeanMapper;
import cn.hd.model.BaseConditionVO;
import cn.hd.model.Rolebean;
import cn.hd.service.IRoleService;
@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RolebeanMapper roleMapper;
	
	@Override
	public void save(Rolebean role) throws RuntimeException {
		// TODO Auto-generated method stub
		roleMapper.insertSelective(role);
	}

	@Override
	public void update(Rolebean role) throws RuntimeException {
		// TODO Auto-generated method stub
		roleMapper.updateByPrimaryKeySelective(role);

	}

	@Override
	public void delete(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		roleMapper.deleteByPrimaryKey(id);

	}

	@Override
	public Rolebean findById(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageInfo<Rolebean> query(BaseConditionVO vo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(vo.getPageNum(), vo.getPageSize());
		List<Rolebean> list=roleMapper.query(vo);
		PageInfo<Rolebean> pageInfo=new PageInfo<>(list);
		return pageInfo;	
		}

	@Override
	public List<Rolebean> queryAll() {
		// TODO Auto-generated method stub
		return roleMapper.queryAll();
	}

	@Override
	public List<Integer> findMidsByRid(int id) {
		// TODO Auto-generated method stub
		List<Integer> list= roleMapper.findMidsByRid(id);
		return list;
	}

	@Override
	public void saveRidAndMids(Rolebean role) {
		// TODO Auto-generated method stub
//		根据角色id先删除中间表
		roleMapper.deleteRidAndMidByRid(role.getRid());
//		保存到中间表 
		List<Integer> mids=role.getMids();
		if (mids!=null && mids.size()>0) {
			for (Integer mid : mids) {
				roleMapper.saveRidAndMid(role.getRid(), mid);
			}
		}
	}
	
	

}
