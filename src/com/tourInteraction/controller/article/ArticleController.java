package com.tourInteraction.controller.article;

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

import com.tourInteraction.controller.SignInAndUpController;
import com.tourInteraction.entity.User;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.service.article.IArticleService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Resource(name="articleServiceImpl")
	private IArticleService	articleService;
	
	@RequestMapping("/getArticle.do")
	public @ResponseBody String getArticle(String limit,String offset){
		System.out.println("article/getArticle.do被调用");

		List<Article> list = new ArrayList<Article>();
		list = articleService.getArticle(limit,offset);
		Map map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", 10);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("getArticleById.do")
	public @ResponseBody String getArticleById( @RequestParam("id") int id){
		Article article = new Article();
		System.out.println("article/getArticleById.do被调用");
		article = articleService.getArticleById(id);
		String result = JSONUtil.object2json(article);
		return result;
	}
	
	@RequestMapping("addArticle.do")
	@ResponseBody
	public String writeArticle(HttpServletRequest request, @RequestParam("articleName") String articleName,
			@RequestParam("articleContent") String articleContent,
			@RequestParam("articleIconId") int articleIconId){
		System.out.println("article/addArticle.do ..........");
		User user = SignInAndUpController.getSignInUser(request);
		Article article = new Article();
		article.setArticleContent(articleContent);
		article.setArticleName(articleName);
		article.setCreateTime(new Date());
		article.setArticleIconId(articleIconId);
		article.setArticleLookCount(0);
		article.setArticleLoveCount(0);
		article.setArticleSupportCount(0);
		article.setCreateUser(user.getId());
		article.setStatus("1");
		int num = articleService.writeArticle(article);
		String result = "保存失败，请稍后重试！";
		if(num > 0 ){
			result = "保存成功，请在个人主页查看！";
		}
		return result;
		
	}
	
	//根据专题获取投稿申请信息
	@RequestMapping("getRequestSubmitNewsBySubjectId.do")
	public @ResponseBody String getRequestSubmitNewsBySubjectId( @RequestParam("subjectId") int subjectId){
		Article article = new Article();
		System.out.println("article/getRequestSubmitNewsBySubjectId.do被调用");
		article = articleService.getRequestSubmitNewsBySubjectId(subjectId);
		String result = JSONUtil.object2json(article);
		return result;
	}
	
	

}
