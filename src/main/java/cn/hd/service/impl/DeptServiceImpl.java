package cn.hd.service.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hd.mapper.DeptMapper;
import cn.hd.model.BaseConditionVO;
import cn.hd.model.Dept;
import cn.hd.service.IDeptService;
 
@Service
public class DeptServiceImpl implements IDeptService  {

	@Autowired
	private DeptMapper deptMapper;

	@Override
	public void save(Dept dept) throws RuntimeException {
		// TODO Auto-generated method stub
		deptMapper.insertSelective(dept);
	}

	@Override
	public void update(Dept dept) throws RuntimeException {
		// TODO Auto-generated method stub
		deptMapper.updateByPrimaryKeySelective(dept);
	}

	@Override
	public Dept findById(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		return deptMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Dept> queryAll() {
		// TODO Auto-generated method stub
		return deptMapper.queryAll();
	}

	@Override
	public void delete(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		 deptMapper.deleteByPrimaryKey(id);
	}

	@Override
	public PageInfo<Dept> query(BaseConditionVO vo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(vo.getPageNum(),vo.getPageSize());
		List<Dept> list= deptMapper.query(vo);
		PageInfo<Dept> pageInfo= new PageInfo<>(list);
		return pageInfo;
	}

}
