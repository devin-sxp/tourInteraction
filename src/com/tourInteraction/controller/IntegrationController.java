package com.tourInteraction.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.User;
import com.tourInteraction.service.IIntegrationtService;

@Controller
@RequestMapping("/integration")
public class IntegrationController {
	
	@Resource(name="integrationServiceImpl")
	private IIntegrationtService integrationtService ;
//	
//	@RequestMapping("/getCommentByNewsId.do")
//	public @ResponseBody String getCommentByNewsId(@RequestParam("newsId") int newsId){
//		
//		System.out.println("getCommentByNewsId.do被调用");
//		List<InteractionComment> list = new ArrayList<InteractionComment>();
//		Map<String, Object> mapParam = new HashMap<>();
//		
//		mapParam.put("newsId", newsId);
//		int count = interactionCommentService.getCommentCount(mapParam);
//		list = interactionCommentService.getComment(mapParam);
//		Map map = new HashMap<String , Object>();
//		map.put("list", list);
//		map.put("count", count);
//		String result = JSONUtil.map2json(map);
//		return result;
//	}

	@RequestMapping("/addIntegration.do")
	public @ResponseBody String addIntegration(HttpServletRequest req, 
			@RequestParam("integration") long integration){
		
		System.out.println("addIntegration.do被调用");
		int num = 0;
		User user = SignInAndUpController.getSignInUser(req);
		integration = user.getIntegration()+integration;
		user.setIntegration(integration);
		user.setUpdateTime(new Date());
		num = integrationtService.addIntegration(user);
		String result = "奖励失败";
		if(num>0){
			result = "奖励成功";
			return result;
		}
		return result;
	}
}
