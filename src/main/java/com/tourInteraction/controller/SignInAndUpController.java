package com.tourInteraction.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("register.do")
	private String register(HttpServletRequest request,HttpServletResponse response) throws Exception{
		boolean isSuccess = false;
//		request.setCharacterEncoding("utf-8");
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("reg_password");
		String comfirmPassword = request.getParameter("comfirm_reg_password");
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
		return "register";
	}
	
	@RequestMapping("loginIn.do")
	@ResponseBody
	private String loginIn(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("checkbox_save_password") String checkbox_save_password){
		logger.debug("loginIn.do");
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
			logger.debug("signup.do被调用");
			HttpSession session = request.getSession();
			session.removeAttribute("user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index";
	}
	@RequestMapping("backSignIn.do")
	private String backSignIn(HttpServletRequest request,HttpSession sin){
		logger.debug("backSignIn.do被调用");
		User user = new User();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		/**
		 * 方式一:
		 */
//		String savePassword = request.getParameter("checkbox_save_password");
//		user.setUserName(name);
//		user.setPassWord(MD5Util.md5(password));
//		try {
//			user = loginservice.getUser(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		if(user!=null){
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//		request.getSession().setAttribute("loginMsg","该用户名不存在或密码错误");

//		}else{
//			return "backgroundManagement/login";
//		}
//		return "backgroundManagement/main";
		
		/**
		 * 方式二
		 * 使用shiro登录认证
		 */
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(name, MD5Util.md5(password));
		try{
			subject.login(usernamePasswordToken);
			user = loginservice.getUserByUserNameDao(name);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("loginMsg","");
		}catch(Exception e){
			request.getSession().setAttribute("loginMsg","该用户名不存在或密码错误");
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
		logger.debug("getNowSignInUser被调用");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String result = JSONUtil.object2json(user);
		return result;
	}
	//更新session
	@RequestMapping("updateSession.do")
	public @ResponseBody String updateSession(HttpServletRequest req, @RequestParam("userIconPath") String userIconPath) {
		try {
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("user");
			user.setUserIconPath(userIconPath);
			session.removeAttribute("user");
			session.setAttribute("user", user);
			return "更新session完毕";

		} catch (Exception e) {
			return "更新session失败";
		}
		
	}
	
}
