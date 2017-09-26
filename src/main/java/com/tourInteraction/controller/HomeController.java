package com.tourInteraction.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tourInteraction.entity.Home;
import com.tourInteraction.service.IHomeService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/homeTour")
public class HomeController {
	
	@Resource(name="homeServiceImpl")
	private IHomeService homeService ;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getTopNews.do")
	public String getTopNews(HttpServletRequest req){
		int limit = 0;
		int offset=5;
		logger.info("homeTour/getTopNews.do");
		List<Home> list = homeService.getTopNews(limit,offset);
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	@RequestMapping(value="/insertNews.do")
	public String insertNews(HttpServletRequest req){
		int num = homeService.insertNews(1,1);
		String result = "增加消息失败";
		if(num > 0){
			result = "增加消息成功";
		}
		logger.info(result);
		return result;
	}
}
