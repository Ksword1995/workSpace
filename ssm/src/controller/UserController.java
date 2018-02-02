package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.UserService;
import entity.User;
import exception.DuplicalUsernameException;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(User user, HttpSession session, Map map) {

		User u = userService.findByUsernameAndPasswrod(user);
		if (u == null){
			map.put("message", "管理员名或密码错误");
			return "login";
		}
		session.setAttribute("nowAdmin", u);
		return "forward:/user/showManage";
	}
	
	@RequestMapping("/logout")
	public String logout( HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	
	@RequestMapping("/showManage")
	public String showManage(HttpServletRequest request){
		List<User> users = userService.findAll();
		request.setAttribute("users", users);
		return "success";
	}
	
//	使用ajax去做，js取值，回调函数window.location/show
	@RequestMapping("/add")
	public String add(HttpServletRequest request,User user,HttpSession session){
		User nowAdmin = (User) session.getAttribute("nowAdmin");
		String userId = nowAdmin.getUserId();
		user.setCreateRole(userId);
		System.out.println(userId);
		userService.addUser(user);
		return "redirect:/user/showManage";
	}
	
	@RequestMapping(value="/valUserId", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String valUserId(HttpServletRequest request){
		String userId = request.getParameter("userId");
		Boolean flag = userService.findByUserId(userId);
		if(flag){
			return "用户ID可用";
			
		}
		return "用户ID重复";
	}
	
	@RequestMapping(value="/valRemove", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String valRemove(HttpServletRequest request,HttpSession session){
		User nowAdmin = (User) session.getAttribute("nowAdmin");
		String ids = request.getParameter("ids");
		System.out.println(ids);
		String[] idArry = ids.split(",");
		String adminId = nowAdmin.getUserId();
		for (int i = 0; i < idArry.length; i++) {
			String id = userService.valPriv(idArry[i]);
			if(adminId.equals(id)){
				return "";
			}
			return "当前权限无法操作";
		}
		return null;
		
	}
	@RequestMapping("/remove")
	public String remove(HttpServletRequest request,String[] ids,HttpSession session){
		for (int i = 0; i < ids.length; i++) {
			String id=ids[i];
			userService.removeUser(id);
		}
		return "redirect:/user/showManage";
	}

	@RequestMapping("/showModify")
	public String showModify(HttpServletRequest request,String ids,HttpSession session){
		User user = userService.showModify(ids);
		System.out.println("show"+user.getId());
		request.setAttribute("user", user);
		return "modifyUser";
	}
	
	@RequestMapping("/showRoleManage")
	public String showRoleManage(HttpServletRequest request,String ids,HttpSession session){
		User user = userService.showModify(ids);
		request.setAttribute("user", user);
		return "roleManage";
	}
	
	@RequestMapping("/roleManage")
	public String roleManage(HttpServletRequest request,User user,HttpSession session){
		userService.modifyUserRole(user);
		return "forward:/user/showManage";
	}
	
	
	@RequestMapping(value="/valModifyUserId", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String valModifyUserId(HttpServletRequest request){
		boolean flag2=false;
		String id2="";
		String userId = request.getParameter("userId");
		String id = request.getParameter("id");
		Boolean flag = userService.findByUserId(userId);
		User user = userService.valModify(userId);
		if(user!=null){
			 id2 = user.getId();
			 if(id2.equals(id)){
					
				 flag2=true;
			}
		}else{
			 flag2=true;
		}
		
		if(flag || ( !flag && flag2 )   ){
			return "用户ID可用";
			
		}
		return "用户ID重复";
	}
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request,User user,HttpSession session){
		User nowAdmin = (User) session.getAttribute("nowAdmin");
		String userId = nowAdmin.getUserId();
		user.setCreateRole(userId);
		userService.modifyUser(user);
		return "redirect:/user/showManage";
	}
	
}
