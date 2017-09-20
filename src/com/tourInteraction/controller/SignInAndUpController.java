package com.tourInteraction.controller;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.User;
import com.tourInteraction.service.ILoginService;
import com.tourInteraction.utils.JSONUtil;
import com.tourInteraction.utils.MD5Util;

@Controller
@RequestMapping("signTour")
public class SignInAndUpController {
	
	@Resource(name="loginServiceImpl")
	private ILoginService loginservice ;
	
	@RequestMapping("register.do")
	private String register(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		boolean isSuccess = false;
//		request.setCharacterEncoding("utf-8");
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirm_password");
		if(password.equals(comfirmPassword)){
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			user.setUserName(name);
			user.setPassWord(MD5Util.md5(password));
			user.setPhoneNumber(phone);	
			user.setEmail(email);
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			user.setIntegration(0);
			user.setRoleId(1);
			user.setStatus("1");
			try {
				isSuccess = loginservice.setUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(isSuccess){
				request.setAttribute("msg", "注册成功");
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return "index";
			}else{
				request.setAttribute("msg", "注册失败,该账户已被注册");
			}
		}else{
			request.setAttribute("msgRegister", "两次输入密码不匹配");
//			request.getRequestDispatcher("/page/register").forward(request, response);
		}
		return "register";
	}
	
	@RequestMapping("loginIn.do")
	@ResponseBody
	private String loginIn(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("checkbox_save_password") String checkbox_save_password){
		System.out.println("loginIn.do");
		User user = new User();
		System.out.println(checkbox_save_password);
		user.setUserName(name);
		user.setPassWord(MD5Util.md5(password));
		try {
			user = loginservice.getUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
//			request.setAttribute("msg", "用户 "+user.getUserName()+"登录成功");
			return "success";
		}else{
			request.setAttribute("msg", "登录失败！请重新登录");
			return "failed";
		}
	}
	
	@RequestMapping("signup.do")
	private String signup(HttpServletRequest request,HttpSession sin){
		try {
			System.out.println("signup.do被调用");
			HttpSession session = request.getSession();
			session.removeAttribute("user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index";
	}
	@RequestMapping("backSignIn.do")
	private String backSignIn(HttpServletRequest request,HttpSession sin){
		System.out.println("backSignIn.do被调用");
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String savePassword = request.getParameter("checkbox_save_password");
		user.setUserName(name);
		user.setPassWord(MD5Util.md5(password));
		try {
			user = loginservice.getUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}else{
			return "backgroundManagement/login";
		}
		return "backgroundManagement/main";
	}
	
	@RequestMapping("appLoginIn.do")
	private String appLoginIn(HttpServletRequest request,HttpServletResponse response){
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		user.setUserName(name);
		user.setPassWord(MD5Util.md5(password));
		try {
			user = loginservice.getUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
//			request.setAttribute("msg", "用户 "+user.getUserName()+"登录成功");
			return "index";

		}else{
			HttpSession session = request.getSession();
			request.setAttribute("msg", "糟糕！登录失败请重试！");
		}
		return "appWeb/login";
	}
	
	@RequestMapping("appRegister.do")
	private String appRegister(HttpServletRequest request,HttpServletResponse response) throws Exception{
		boolean isSuccess = false;
//		request.setCharacterEncoding("utf-8");
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirm_password");
		if(password.equals(comfirmPassword)){
			user.setUserName(name);
			user.setPassWord(MD5Util.md5(password));
			user.setPhoneNumber("0");	
			user.setEmail("0");
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			user.setIntegration(0);
			user.setRoleId(1);
			user.setStatus("1");
			try {
				isSuccess = loginservice.setUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(isSuccess){
				user = loginservice.getUser(user);
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return "index";
			}else{
				request.setAttribute("msg", "注册失败,该账户已被注册");
			}
		}else{
			request.setAttribute("msgRegister", "两次输入密码不匹配");
//			request.getRequestDispatcher("/page/register").forward(request, response);
		}
		return "appWeb/register";
	}
	
	//当前登陆用户信息
	public static User getSignInUser(HttpServletRequest request){
		System.out.println("getSignInUser被调用");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		return user;
	}
	@RequestMapping("getNowSignInUser.do")
	public @ResponseBody String getNowSignInUser(HttpServletRequest request){
		System.out.println("getNowSignInUser被调用");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String result = JSONUtil.object2json(user);
		return result;
	}
}
