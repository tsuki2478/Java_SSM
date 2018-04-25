package cn.hd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hd.mapper.MenuMapper;
import cn.hd.model.BaseConditionVO;
import cn.hd.model.Menu;
import cn.hd.service.IMenuService;
@Service
public class MenuServiceImpl  implements IMenuService{

	@Resource
	private MenuMapper menuMapper;
	
	
	@Override
	public void save(Menu menu) throws RuntimeException {
		// TODO Auto-generated method stub
		menuMapper.insertSelective(menu);
		
	}

	@Override
	public void update(Menu menu) throws RuntimeException {
		// TODO Auto-generated method stub
		menuMapper.updateByPrimaryKeySelective(menu);
	}

	@Override
	public void delete(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		menuMapper.updateByMidorPid(id);
	}

	@Override
	public Menu findById(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		return menuMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageInfo<Menu> query(BaseConditionVO vo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(vo.getPageNum(),vo.getPageSize());
		List<Menu> list= menuMapper.query(vo);
		PageInfo<Menu> pageInfo=new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public List<Menu> queryAll() {
		// TODO Auto-generated method stub
		return menuMapper.queryAll();
	}

}
