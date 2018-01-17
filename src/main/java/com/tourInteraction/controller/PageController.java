package com.tourInteraction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("page")
public class PageController {
	
	/**
	 * 前台页面
	 * @param req
	 * @return
	 */
	//Main Page
	@RequestMapping("/homeDisplay")
	public String homeDisplay(HttpServletRequest req){
		return "index";
	}
	
	@RequestMapping("/register")
	public String signDisplay(HttpServletRequest req){
		return "register";
	}
	
	@RequestMapping("/userCenter")
	public String userCenter(HttpServletRequest req){
		return "userCenter";
	}
	
	@RequestMapping("/userPage")
	public String userPage(HttpServletRequest req){
		return "userPage";
	}

	@RequestMapping("/otherUserPage")
	public String otherUserPage(HttpServletRequest req){
		return "otherUserPage";
	}
	
	@RequestMapping("/newsCenter")
	public String newsCenter(HttpServletRequest req){
		return "newsCenter";
	}
	
	@RequestMapping("/interactionModel")
	public String modelDisplay(HttpServletRequest req){
		return "interactionModel";
	}
	
	@RequestMapping("/interactionNews")
	public String interactionNews(HttpServletRequest req){
		return "interactionNews";
	}
	@RequestMapping("/interactionComment")
	public String interactionComment(HttpServletRequest req){
		return "interactionComment";
	}
	
	@RequestMapping(value="article")
	public String article(HttpServletRequest req) {
		return "article";
		
	}
	@RequestMapping(value="articleSubjects")
	public String articleSubjects(HttpServletRequest req) {
		return "articleSubjects";
		
	}
	
	@RequestMapping(value="subject")
	public String subject(HttpServletRequest req) {
		return "subject";
		
	}
	
	@RequestMapping(value="articleNews")
	public String articleNews(HttpServletRequest req) {
		return "articleNews";
	}

	@RequestMapping(value="search")
	public String search(HttpServletRequest req) {
		return "search";
	}
	
	/**
	 * 后台页面
	 */
	@RequestMapping("/backgroundLogin")
	public String backgroundManagementLogin(HttpServletRequest req){
		return "backgroundManagement/login";
	}
	@RequestMapping("/backgroundManagementMain")
	public String backgroundManagementMain(HttpServletRequest req){
		return "backgroundManagement/main";
	}
	@RequestMapping("/backgroundManagementUserManage")
	public String backgroundManagementUserManage(HttpServletRequest req){
		return "backgroundManagement/userManage";
	}
	@RequestMapping("/backgroundManagementRoleManage")
	public String backgroundManagementRoleManage(HttpServletRequest req){
		return "backgroundManagement/roleManage";
	}
	@RequestMapping("/backgroundManagementNewsManage")
	public String backgroundManagementNewsManage(HttpServletRequest req){
		return "backgroundManagement/newsManage";
	}
	@RequestMapping("/backgroundManagementModuleManage")
	public String backgroundManagementModuleManage(HttpServletRequest req){
		return "backgroundManagement/moduleManage";
	}
	@RequestMapping("/backgroundManagementConfigure")
	public String backgroundManagementConfigure(HttpServletRequest req){
		return "backgroundManagement/configure";
	}
	@RequestMapping("/backgroundManagementArticleSubjectManage")
	public String backgroundManagementArticleSubjectManage(HttpServletRequest req){
		return "backgroundManagement/articleSubjectManage";
	}
	@RequestMapping("/backgroundManagementArticleRequestSubmit")
	public String backgroundManagementArticleRequestSubmit(HttpServletRequest req){
		return "backgroundManagement/articleRequestSubmitManage";
	}
	/**
	 * appWeb页面
	 */
	@RequestMapping("/appWebLogin")
	public String appWebLogin(HttpServletRequest req){
		return "appWeb/login";
	}
	
	@RequestMapping("/appWebRegister")
	public String appWebRegister(HttpServletRequest req){
		return "appWeb/register";
	}
	
	
}
