package cn.hd.action;

import java.io.IOException;




import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hd.model.Userbean;
import cn.hd.service.IUserService;

@Controller
@RequestMapping("/login")
public class loginaction {
	@Resource
	private IUserService userService;

	@RequestMapping("/login_user")
	public String login(String username,String pwd,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		try {
			Userbean user = userService.findUserByNameAndPwd(username, pwd);
			session.setAttribute("LOGIN_USER", user);
			return "redirect:/index.jsp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String msg = e.getMessage();
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/login.jsp").forward(request, response);;
		}
		return null;

	}
}