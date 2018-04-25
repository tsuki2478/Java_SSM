package cn.hd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hd.common.PrimaryKey;
import cn.hd.mapper.CustomerMapper;
import cn.hd.mapper.DeptMapper;
import cn.hd.mapper.HandleHistoryMapper;
import cn.hd.mapper.UserbeanMapper;
import cn.hd.mapper.WorkattachMapper;
import cn.hd.mapper.WorkorderMapper;
import cn.hd.model.Dept;
import cn.hd.model.HandleHistory;
import cn.hd.model.Userbean;
import cn.hd.model.Workattach;
import cn.hd.model.Workorder;
import cn.hd.service.IWorkService;

@Service
public class WorkServiceImpl implements IWorkService {
	

	@Resource
	private WorkorderMapper workMapper;

	@Resource
	private CustomerMapper cusMapper;
	@Resource
	private WorkattachMapper attachMapper;

	@Resource
	private HandleHistoryMapper historyMapper;

	@Resource
	private DeptMapper deptMapper;
	@Resource
	private UserbeanMapper userMapper;

	@Override
	public void save(Workorder work) {
		/*
		 * // TODO Auto-generated method stub //先计算出一个唯一的工单编号 ，赋值给工单编号 String
		 * workno="C201704140001"; work.setWorkorderid(workno);
		 * 
		 * //1)保存到客户表 cusMapper.insertSelective(work.getCustomer());
		 * 
		 * //2)保存到工单表
		 * work.setCustomername(work.getCustomer().getCustomername());
		 * work.setCustomerid(work.getCustomer().getId());
		 * work.setCentificatenumber(work.getCustomer().getCentificatenumber());
		 * workMapper.insertSelective(work);
		 */
		// 给工单编号附一个值。 因为工单编号唯一性，所有这个只是一次性测试用
		// String workno="C20170414011";
		String workno = PrimaryKey.getWorkorderId();
		work.setWorkorderid(workno);

		// 保存到客户表
		cusMapper.insertSelective(work.getCustomer());

		// 保存到工单表(因为是一对一外设。所有需要从work-Customer里面再次get取值)
		work.setCustomername(work.getCustomer().getCustomername());
		;
		work.setCustomerid(work.getCustomer().getId());
		work.setCentificatenumber(work.getCustomer().getCentificatenumber());
		workMapper.insertSelective(work);
		// 如果有附件则就保存附件
		List<Workattach> attaches = work.getAttaches();
		if (attaches != null && attaches.size() > 0) {
			for (Workattach attach : attaches) {
				attach.setWorkid(workno);
				attachMapper.insertSelective(attach);
			}

		}
	}

	/*
	 * @Override public PageInfo<Workorder> query(Workorder work) { // TODO
	 * Auto-generated method stub PageHelper.startPage(work.getPageNum(),
	 * work.getPageSize()); List<Workorder> list= workMapper.query();
	 * PageInfo<Workorder> pageInfo=new PageInfo<>(list); return pageInfo; }
	 */
	@Override
	public PageInfo<Workorder> query(Workorder work) {
		PageHelper.startPage(work.getPageNum(), work.getPageSize());
		List<Workorder> list = workMapper.query(work);
		PageInfo<Workorder> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Workorder findByWorkId(String workid) {
		// TODO Auto-generated method stub
		Workorder work = workMapper.selectByPrimaryKey(workid);
		return work;
	}
/**
 * 状态判断
 */
	@Override
	public void handleWork(Workorder work, Userbean user) {
		// TODO Auto-generated method stub
		HandleHistory history = new HandleHistory();
		history.setWorkorderid(work.getWorkorderid());
		history.setDescs(work.getDescs());
		history.setHandleperson(user.getUserid());
		history.setHandlepersonname(user.getUsername());
		history.setHandlegroup(user.getDid());
		Dept dept = deptMapper.selectByPrimaryKey(user.getDid());
		history.setHandlepersonname(dept.getName());

		// 1先修改工单表 状态（0 表示未处理，1 表示转办，2 表示归档 3表示退单 4 表示挂起）
		if (work.getStatus()==1) {
			// 转办
			workMapper.updateByPrimaryKeySelective(work);
			history.setActionstr("转办");

		} else if (work.getStatus()==2) {
			// 归档
			workMapper.updateByPrimaryKeySelective(work);
			history.setActionstr("归档");
		} else if (work.getStatus()==3) {
			Userbean u=userMapper.selectByPrimaryKey(work.getHandleperson());
			work.setHandlegroup(u.getDid());
			workMapper.updateByPrimaryKeySelective(work);
			// 退单处理人已知  ,处理组要相应地改掉	
			history.setActionstr("退单");

		} else if (work.getStatus()==4) {
			workMapper.updateByPrimaryKeySelective(work);
			history.setActionstr("挂起");

		}
		
		// 2 把当前操作日志保存到历史记录中
		historyMapper.insertSelective(history);
	}

@Override
public List<HandleHistory> findHistoryByWorkid(String workid, int userid) {
	// TODO Auto-generated method stub
	List<HandleHistory> historyList=historyMapper.findHistoryByWorkid(workid,userid);
	return historyList;
}

@Override
public List<HandleHistory> queryByWorkid(String workid) {
	// TODO Auto-generated method stub
	List<HandleHistory> historyList=historyMapper.queryByWorkid(workid);
	return historyList;
}
}