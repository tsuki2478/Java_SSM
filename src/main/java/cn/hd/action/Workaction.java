package cn.hd.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.hd.common.PrimaryKey;
import cn.hd.model.Data;
import cn.hd.model.Dept;
import cn.hd.model.HandleHistory;
import cn.hd.model.Userbean;
import cn.hd.model.Workattach;
import cn.hd.model.Workorder;
import cn.hd.service.IDataService;
import cn.hd.service.IDeptService;
import cn.hd.service.IUserService;
import cn.hd.service.IWorkService;

@Controller
@RequestMapping("/work")
public class Workaction {

	@Resource
	private IDeptService deptService;
	@Resource
	private IDataService dataService;
	@Resource
	private IUserService userService;
	@Resource
	private IWorkService workService;

	// 到创建工单的页面
	@RequestMapping("/init")
	public String init(Model model) {
		// 1)取出所有的部门信息
		List<Dept> deptlist = deptService.queryAll();
		// 2)取出所有数据字典信息
		List<Data> datalist = dataService.queryAll();

		model.addAttribute("deptlist", deptlist);
		model.addAttribute("datalist", datalist);
		return "work/createWork";
	}

	// g根据部门id找出这个部门下所有用户列表
	@RequestMapping("queryUserByDid/{did}")
	@ResponseBody
	public List<Userbean> queryUserByDid(@PathVariable("did") int did) {
		// 根据部门id找出这个部门下所有的用户列表
		List<Userbean> list = userService.queryUserByDid(did);

		return list;
	}

	// 保存工单
	@RequestMapping("/save")
	public String save(MultipartFile[] upload, Workorder work, HttpServletRequest request,HttpSession session) {
		String basepath = request.getServletContext().getRealPath("/upload");
		if (upload != null) {
			List<Workattach> attaches = new ArrayList<>();
			for (MultipartFile file : upload) {
				if (!file.isEmpty()) {
					Workattach attach = new Workattach();
					String oldfilename = file.getOriginalFilename();
					// 最后一个点号的下标位置
					int opt = oldfilename.lastIndexOf(".");
					// 获取后缀名
					String ext = oldfilename.substring(opt);
					// 新名字
					String newfilename = PrimaryKey.getFileNewName() + ext;
					File newfile = new File(basepath + "/" + newfilename);
					try {
						file.transferTo(newfile);
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					attach.setOldfilename(file.getOriginalFilename());
					attach.setNewfilename(newfilename);
					attaches.add(attach);
				}
			}
			work.setAttaches(attaches);
		}
		Userbean user=(Userbean) session.getAttribute("LOGIN_USER");
		// 保存工单信息
		workService.save(work);
		return "redirect:/work/init";
	}

	// 我的工单
	@RequestMapping("/myWork")
	public String myWork(Workorder work, HttpSession session, Model model) {
		Userbean user = (Userbean) session.getAttribute("LOGIN_USER");
		work.setHandleperson(user.getUserid());
		PageInfo<Workorder> pageInfo = workService.query(work);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("work", work);

		// 1)取出所有的部门信息
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		return "work/worklist";
	}

	// 本組工单
	@RequestMapping("/myGroup")
	public String myGroup(Workorder work, HttpSession session, Model model) {
		Userbean user = (Userbean) session.getAttribute("LOGIN_USER");

		work.setHandlegroup(user.getDid());
		PageInfo<Workorder> pageInfo = workService.query(work);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("work", work);

		// 1)取出所有的部门信息
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		return "work/worklist";
	}

	// 本組退單
	@RequestMapping("/myGroupBack")
	public String myGroupBack(Workorder work, HttpSession session, Model model) {
		Userbean user = (Userbean) session.getAttribute("LOGIN_USER");

		work.setHandlegroup(user.getDid());
		work.setStatus(3);
		PageInfo<Workorder> pageInfo = workService.query(work);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("work", work);

		// 1)取出所有的部门信息
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		return "work/worklist";
	}

	// 所有工單
	@RequestMapping("/queryAll")
	public String queryAll(Workorder work, HttpSession session, Model model) {

		PageInfo<Workorder> pageInfo = workService.query(work);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("work", work);

		// 1)取出所有的部门信息
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		return "work/worklist";
	}

	// 到工单处理页面
	@RequestMapping("/handlePage/{id}")
	public String handlePage(@PathVariable("id") String workid, Model model, HttpSession session) {
		// 根据工单编号 查询工单信息 包含客户信息
		Workorder work = workService.findByWorkId(workid);
		model.addAttribute("work", work);
		// 查询出所有的处理组信息 （转单时候需要）
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		// 查询所有这个工单的处理过的处理人（退单时候需求）
		Userbean user = (Userbean) session.getAttribute("LOGIN_USER");
		List<HandleHistory> lasthistoryList = workService.findHistoryByWorkid(workid, user.getUserid());
		model.addAttribute("lasthistoryList", lasthistoryList);
		//根据工单编号  查出历史信息
		List<HandleHistory> historys=workService.queryByWorkid(workid);
		model.addAttribute("historys", historys);
		
		return "work/handleWork";
		
	}

	// 处理工单
	@RequestMapping("/handle")
	public String handleWork(Workorder work, HttpSession session,Integer backhandleperson) {
		Userbean user = (Userbean) session.getAttribute("LOGIN_USER");
		if (work.getStatus()==3) {
			work.setHandleperson(backhandleperson);
		}
			workService.handleWork(work, user);
			
			return "work/handleWork";
	}
}