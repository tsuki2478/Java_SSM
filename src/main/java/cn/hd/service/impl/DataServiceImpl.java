package cn.hd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.hd.mapper.DataMapper;
import cn.hd.model.BaseConditionVO;
import cn.hd.model.Data;
import cn.hd.service.IDataService;
@Service
public class DataServiceImpl implements IDataService{

	@Resource
	private DataMapper dataMapper;
	@Override
	public void save(Data data) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Data data) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Data findById(int id) throws RuntimeException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Data> query(BaseConditionVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Data> queryAll() {
		// TODO Auto-generated method stub
		return dataMapper.queryAll();
	}

}
