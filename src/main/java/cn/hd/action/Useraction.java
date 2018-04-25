package cn.hd.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Dept;
import cn.hd.model.Rolebean;
import cn.hd.model.Userbean;
import cn.hd.service.IDeptService;
import cn.hd.service.IRoleService;
import cn.hd.service.IUserService;

@Controller
@RequestMapping("/user")
public class Useraction {

	@Autowired
	private IUserService userService;
	@Autowired
	private IDeptService deptService;
	@Autowired
	private IRoleService roleService;

	/**
	 * 分页搜索
	 * 
	 * @param model
	 * @param vo
	 * @return
	 */
	@RequestMapping("/query")
	public String query(Model model, BaseConditionVO vo) {
		// List<Userbean> list= userService.query(null);
		// model.addAttribute("list", list);
		PageInfo<Userbean> list = userService.query(vo);
		model.addAttribute("pageModel", list);
		model.addAttribute("vo", vo);
		return "user/userlist";

	}

	/**
	 * 到添加页面
	 */

	@RequestMapping("/init")
	public String init(Model model) {
		// 取出所有的部门(处理组)
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		// 再取出所有的角色
		List<Rolebean> rolelist = roleService.queryAll();
		model.addAttribute("rolelist", rolelist);
		return "user/useradd";
	}

	/**
	 * 到修改页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Model model) {
		// 根據ID找到需要修改的條目
		Userbean user = userService.findById(id);
		model.addAttribute("user", user);
		// 取出所有的部门(处理组)
		List<Dept> deptlist = deptService.queryAll();
		model.addAttribute("deptlist", deptlist);
		// 角色數據
		List<Rolebean> rolelist = roleService.queryAll();
		model.addAttribute("rolelist", rolelist);
		return "user/userUpdate";
	}

	/**
	 * 保存 根据条件判断给增加还是修改
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Userbean user) {
		String pwd=user.getPassword();
		Md5Hash md5=new Md5Hash(pwd, "hd");
		user.setPassword(md5.toString());
		if (user.getUserid() != null && user.getUserid() > 0) {
			userService.update(user);
		} else {
			userService.save(user);
		}
		return "redirect:/user/query";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		userService.delete(id);
		return "redirect:/user/query";
	}

	/**
	 * 驗證用戶名的唯一性
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/validateUsername")
	@ResponseBody
	public Map validateUsername(String username) {
		// 根據用戶名到數據庫中查詢，如果有記錄。。就表示，已經存在
		Map map = new HashMap<>();
		Userbean user = userService.findByUsername(username);
		if (user != null) {
			map.put("msg", "此用户名已经存在，请重新输入");
			map.put("flag", "1");

		} else {
			map.put("msg", "此用户名可以使用");
			map.put("flag", "2");

		}

		return map;

	}

}
