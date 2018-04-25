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
import cn.hd.service.IMenuService;

@Controller
@RequestMapping("/menu")
public class menuaction {

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
		PageInfo<Menu> pageInfo = menuService.query(vo);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("vo", vo);
		return "menu/menulist";

	}

	/**
	 * 到添加页面
	 */
	@RequestMapping("/init")
	public String init(Model model) {
		// 取出所有的菜单
		List<Menu> list = menuService.queryAll();
		model.addAttribute("menulist", list);
		return "menu/menuadd";
	}

	/**
	 * 到修改页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Model model) {
		Menu menu = menuService.findById(id);
		model.addAttribute("menu", menu);
		// 取出所有的菜单
		List<Menu> list = menuService.queryAll();
		model.addAttribute("menulist", list);

		return "menu/menuUpdate";
	}

	/**
	 * 保存 根据条件判断给增加还是修改
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Menu menu) {
		if (menu.getMid() != null && menu.getMid() > 0) {
			menuService.update(menu);
		} else {
			menuService.save(menu);
		}
		return "redirect:/menu/query";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		menuService.delete(id);
		return "redirect:/menu/query";
	}

}
