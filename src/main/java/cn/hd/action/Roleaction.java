package cn.hd.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Menu;
import cn.hd.model.Rolebean;
import cn.hd.service.IMenuService;
import cn.hd.service.IRoleService;

@Controller
@RequestMapping("/role")
public class Roleaction {

	@Resource
	private IRoleService roleService;

	@Resource
	IMenuService menuService;

	/**
	 * 分页搜索
	 * 
	 * @param model
	 * @param vo
	 * @return
	 */
	@RequestMapping("/query")
	public String query(BaseConditionVO vo, Model model) {
		PageInfo<Rolebean> pageInfo = roleService.query(vo);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("vo", vo);
		return "role/rolelist";

	}

	/**
	 * 到添加页面
	 */
	@RequestMapping("/init")
	public String init(Model model) {

		return "role/rolepadd";
	}

	/**
	 * 到修改页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Model model) {
		Rolebean role = roleService.findById(id);
		model.addAttribute("role", role);
		return "role/roleUdate";
	}

	/**
	 * 保存 根据条件判断给增加还是修改
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Rolebean role) {
		if (role.getRid() != null && role.getRid() > 0) {
			roleService.update(role);
		} else {
			roleService.save(role);
		}
		return "redirect:/role/query";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		roleService.delete(id);
		return "redirect:/role/query";
	}

	// 到授权页面
	@RequestMapping("/grant/{id}")
	public String grant(@PathVariable("id") int id, Model model) {
		// 1先取出所有 的权限（菜单）
		List<Menu> menulist = menuService.queryAll();
		model.addAttribute("menulist", menulist);
		model.addAttribute("rid", id);
		// 2根据角色id取出这个角色所拥有的的菜单（权限）
		List<Integer> mids = roleService.findMidsByRid(id);
		model.addAttribute("mids", mids);
		return "role/grant";
	}

	// 授权保存
	@RequestMapping("/grantsave")
	public String grantsave(Rolebean role) {
		roleService.saveRidAndMids(role);
		return "redirect:/role/query";

	}

}
