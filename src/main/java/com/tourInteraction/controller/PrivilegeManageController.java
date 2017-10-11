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

import com.tourInteraction.entity.Privilege;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IPrivilegeManageService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("privilegeManage")
public class PrivilegeManageController {
	
	@Resource(name="privilegeManageServiceImpl")
	private IPrivilegeManageService privilegeManageService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("getPrivileges.do")
	public @ResponseBody String getPrivileges(HttpServletRequest request){
		
		logger.debug("privilegeManage/getPrivileges.do被调用");
		List<Privilege> list = new ArrayList<Privilege>();
		list = privilegeManageService.getPrivileges();
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	
	@RequestMapping("delPrivilegeById.do")
	public @ResponseBody String delPrivilegeById( @RequestParam("roleId") int privilegeId){
		logger.debug("privilegeManage/delPrivilegeById.do被调用");
		
		int num = privilegeManageService.delPrivilegeById(privilegeId);
		String result = "删除失败!";
		if(num > 0){
			result = "删除成功!";
		}
		return result;
	}
	
	@RequestMapping("/addPrivilege.do")
	public @ResponseBody String addPrivilege(HttpServletRequest req,
			@RequestParam("parentId") int parentId,
			@RequestParam("privilegeName") String privilegeName,
			@RequestParam("privilegeValue") String privilegeValue){
		logger.debug("privilegeManage/addPrivilege.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("parentId", parentId);
		mapParam.put("privilegeName", privilegeName);
		mapParam.put("privilegeValue", privilegeValue);
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", "1");
		
		int num = privilegeManageService.addPrivilege(mapParam);
		String result = "增加角色失败";
		if(num>0){
			result = "增加角色成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/updatePrivilege.do")
	public @ResponseBody String updatePrivilege(HttpServletRequest req, 
			@RequestParam("privilegeId") int privilegeId,
			@RequestParam("parentId") int parentId,
			@RequestParam("privilegeName") String privilegeName,
			@RequestParam("privilegeValue") String privilegeValue){
		logger.debug("privilegeManage/updatePrivilege.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Privilege privilege = new Privilege();
		privilege.setId(privilegeId);
		privilege.setParentId(parentId);
		privilege.setPrivilegeName(privilegeName);
		privilege.setPrivilegeValue(privilegeValue);
		privilege.setUpdateTime(new Date());
		privilege.setUpdateUser(user.getId());
		
		int num = privilegeManageService.updatePrivilege(privilege);
		String result = "修改角色失败";
		if(num>0){
			result = "修改角色成功";
			return result;
		}
		return result;
	}

}
