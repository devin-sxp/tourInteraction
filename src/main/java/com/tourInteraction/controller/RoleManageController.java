package com.tourInteraction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.Role;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IRoleManageService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("roleManage")
public class RoleManageController {
	
	@Resource(name="roleManageServiceImpl")
	private IRoleManageService roleManageService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("getRoles.do")
	public @ResponseBody String getRoles(HttpServletRequest request){
		
		logger.info("roleManage/getRoles.do被调用");
		List<Role> list = new ArrayList<Role>();
		list = roleManageService.getRoles();
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	
	@RequestMapping("delRoleById.do")
	public @ResponseBody String delRoleById( @RequestParam("roleId") int roleId){
		logger.info("roleManage/delRoleById.do被调用");
		
		int num = roleManageService.delRoleById(roleId);
		String result = "删除失败!";
		if(num > 0){
			result = "删除成功!";
		}
		return result;
	}
	
	@RequestMapping("/addRole.do")
	public @ResponseBody String addRole(HttpServletRequest req, 
			@RequestParam("roleName") String roleName){
		logger.info("roleManage/addRole.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("roleName", roleName);
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", "1");
		
		int num = roleManageService.addRole(mapParam);
		String result = "增加角色失败";
		if(num>0){
			result = "增加角色成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/updateRole.do")
	public @ResponseBody String updateRole(HttpServletRequest req, 
			@RequestParam("roleId") int roleId,
			@RequestParam("roleName") String roleName){
		logger.info("roleManage/updateRole.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Role role = new Role();
		role.setId(roleId);
		role.setRoleName(roleName);
		role.setUpdateTime(new Date());
		role.setUpdateUser(user.getId());
		
		int num = roleManageService.updateRole(role);
		String result = "修改角色失败";
		if(num>0){
			result = "修改角色成功";
			return result;
		}
		return result;
	}

}
