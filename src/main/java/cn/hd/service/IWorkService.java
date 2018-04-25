package cn.hd.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.hd.model.HandleHistory;
import cn.hd.model.Userbean;
import cn.hd.model.Workorder;

public interface IWorkService {
	 /**
     * 保存工单信息
     * @param work
     */
	void save(Workorder work);
	  /**
     * 查询
     * @param work
     * @return
     */
	PageInfo<Workorder> query(Workorder work);
	/**
	 * 根据工单编号 查询工单信息 包含客户信息
	 * @param workid
	 * @return
	 */
	Workorder findByWorkId(String workid);
	/**
	 * 处理工单
	 * @param work
	 * @param user
	 */
	
	void handleWork(Workorder work, Userbean user);
	/**
	 * 查出所有这个工单的处理过的处理人 （退单时要用用）
	 * @param workid
	 * @return
	 */
	List<HandleHistory> findHistoryByWorkid(String workid, int userid);
	/**
	 * 	根据工单编号  查出历史信息
	 * @param workid
	 * @return
	 */
	
	List<HandleHistory> queryByWorkid(String workid);
}
