package com.tourInteraction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.InteractionNews;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IInteractionNewsService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/interactionNews")
public class InteractionNewsController {
	
	@Resource(name="interactionNewsServiceImpl")
	private IInteractionNewsService interactionNewsService;
	
	@RequestMapping("/getNews.do")
	public @ResponseBody String getNews(@RequestParam(value = "moduleId",defaultValue="0") int moduleId, @RequestParam("limit") int limit,
								@RequestParam("offset") int offset, String newsTitle, String newsLabel, String createUserName){
		
		System.out.println("getNews.do被调用");
		List<InteractionNews> list = new ArrayList<InteractionNews>();
		Map<String, Object> mapParam = new HashMap<>();
		
		if(newsTitle != null && newsTitle != ""){
			mapParam.put("newsTitle", newsTitle);

		}
		if(newsLabel != null && newsLabel != ""){
			mapParam.put("newsLabel", newsLabel);

		}
		if(createUserName != null && createUserName != ""){
			mapParam.put("createUserName", createUserName);

		}
		if(moduleId != 0){
			mapParam.put("moduleId", moduleId);
		}
		
		mapParam.put("limit", limit);
		mapParam.put("offset", offset);
		int count = interactionNewsService.getNewsCount(mapParam);
		list = interactionNewsService.getNews(mapParam);
		Map map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", count);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/addNews.do")
	public @ResponseBody String addNews(HttpServletRequest req, @RequestParam("moduleId") int moduleId,@RequestParam("newsTitle") String newsTitle, @RequestParam("newsLabel") String newsLabel,@RequestParam("newsContent") String newsContent){
		System.out.println("addNews.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("newsTitle", newsTitle);
		mapParam.put("newsLabel", newsLabel);
		mapParam.put("newsContent", newsContent);
		mapParam.put("moduleId", moduleId);
		mapParam.put("newsAddress", "地点");
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", "1");

		int num = interactionNewsService.addNews(mapParam);
		String result = "发布失败";
		if(num>0){
			result = "发布成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/getNewsById.do")
	public @ResponseBody String getNewsById(@RequestParam("newsId") int newsId){
		
		System.out.println("getNewsById.do被调用");
		
		InteractionNews interactionNews = interactionNewsService.getNewsById(newsId);

		String result = JSONUtil.object2json(interactionNews);
		return result;
	}
	
	@RequestMapping("/delNewsById.do")
	public @ResponseBody String delNewsById(@RequestParam("id") int id){
		
		System.out.println("interactionNews/delNewsById.do被调用");
		
		int num = interactionNewsService.delNewsById(id);
		String result = "删除失败";
		if(num > 0 ){
			result = "删除成功";
		}
		return result;
	}
}
