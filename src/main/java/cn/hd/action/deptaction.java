package cn.hd.action;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Dept;
import cn.hd.service.IDeptService;

@Controller
@RequestMapping("/dept")
public class deptaction {

	@Resource
	private IDeptService deptService;

	/**
	 * 分页搜索
	 * 
	 * @param model
	 * @param vo
	 * @return
	 */
	@RequestMapping("/query")
	public String query( BaseConditionVO vo,Model model) {
		PageInfo<Dept> pageInfo = deptService.query(vo);
		model.addAttribute("pageModel", pageInfo);
		model.addAttribute("vo", vo);
		return "dept/deptlist";
	}

	/**
	 * 添加页面 (model )
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/init")
	public String init(Model model) {
		return "dept/deptadd";

	}

	/**
	 * 修改 页面
	 */
	@RequestMapping("/updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Model model) {

		Dept dept = deptService.findById(id);
		model.addAttribute("dept", dept);
		return "dept/deptupdate";

	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {

		deptService.delete(id);
		return "redirect:/dept/query";
	}

	@RequestMapping("/save")
	public String save(Dept dept) {
		if (dept.getId() != null && dept.getId() > 0) {
			deptService.update(dept);
		} else {
			deptService.save(dept);
		}
		return "redirect:/dept/query";
	}

}
