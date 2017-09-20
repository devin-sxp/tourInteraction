package com.tourInteraction.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.Configure;
import com.tourInteraction.entity.Static;
import com.tourInteraction.service.IStaticService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("static")
public class StaticController {
	
	@Autowired
	private IStaticService staticService;
	@RequestMapping("/getStatic.do")
	public @ResponseBody String getStatic(HttpServletRequest req,
			@RequestParam("staticType") String staticType){
		
		System.out.println("getStatic.do被调用");
		List<Static> list = new ArrayList<Static>();
		list = staticService.getStatic(staticType);
		String result = JSONUtil.list2json(list);
		return result;
	}
}
