package com.tourInteraction.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tourInteraction.entity.Home;
import com.tourInteraction.service.IHomeService;

@Controller
@RequestMapping("/homeTour")
public class HomeController {
	
	@Resource(name="homeServiceImpl")
	private IHomeService homeService ;
	
	@RequestMapping("/getTopNews.do")
	public String getTopNews(HttpServletRequest req){
		int limit = 0;
		int offset=5;
		System.out.println("0000000000000");
		List<Home> list = homeService.getTopNews(limit,offset);
		return null;
	}
	
	@RequestMapping(value="/insertNews.do")
	public String insertNews(HttpServletRequest req){
		int result = homeService.insertNews(1,1);
		System.out.println(result);
		return null;
	}
}
