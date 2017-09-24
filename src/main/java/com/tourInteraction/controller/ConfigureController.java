package com.tourInteraction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.Configure;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IConfigureService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping(value = "configure")
public class ConfigureController {
	@Autowired
	@Qualifier(value = "configureServiceImpl")
	private IConfigureService configureService;
	
	@RequestMapping("/getConfigure.do")
	public @ResponseBody String getConfigure(HttpServletRequest req){
		
		System.out.println("getConfigure.do被调用");
		List<Configure> list = new ArrayList<Configure>();
		list = configureService.getConfigure();
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	@RequestMapping("/getConfigureById.do")
	public @ResponseBody String getConfigureById(HttpServletRequest req,
			@RequestParam("id") long id){
		System.out.println("getConfigure.do被调用");
		String result="";

		Configure configure = configureService.getConfigureById(id);
	
		result = JSONUtil.object2json(configure);
		return result;

	}
	
	@RequestMapping("/addConfigure.do")
	public @ResponseBody String addConfigure(HttpServletRequest req, 
			@RequestParam("staticCodeConfigure") String staticCodeConfigure, 
			@RequestParam("staticCodeUse") String staticCodeUse,
			@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("file") String file){
		System.out.println("addConfigure.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Configure configure = new Configure();
		configure.setStaticCodeConfigure("configure_pic");
		configure.setStaticCodeUse(staticCodeUse);
		configure.setTitle(title);
		configure.setDescription(description);
		configure.setFile(file);
		configure.setCreateUser((long)user.getId());
		configure.setCreateTime(new Date());
		configure.setStatus("1");
		int num = configureService.addConfigure(configure);
		String result = "添加配置失败";
		if(num>0){
			result = "添加配置成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/updateConfigure.do")
	public @ResponseBody String updateConfigure(HttpServletRequest req, 
			@RequestParam("id") Long id, 
			@RequestParam("staticCodeConfigure") String staticCodeConfigure, 
			@RequestParam("staticCodeUse") String staticCodeUse,
			@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("file") String file) throws Throwable{
		System.out.println("updateConfigure.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Configure configure = new Configure();
		configure.setId(id);
		configure.setStaticCodeConfigure(staticCodeConfigure);
		configure.setStaticCodeUse(staticCodeUse);
		configure.setTitle(title);
		configure.setDescription(description);
		configure.setFile(file);
		configure.setUpdateUser((long)user.getId());
		configure.setUpdateTime(new Date());
		int num = configureService.updateConfigure(configure);		
		String result = "修改配置失败";
		if(num>0){
			result = "修改配置成功";
			return result;
		}
		return result;

	}
	
	@RequestMapping("/delConfigureById.do")
	public @ResponseBody String delConfigureById(@RequestParam("id") int id){
		
		System.out.println("configure/delConfigureById.do被调用");
		
		int num = configureService.delConfigureById(id);
		String result = "删除失败";
		if(num > 0 ){
			result = "删除成功";
		}
		return result;
	}
}
