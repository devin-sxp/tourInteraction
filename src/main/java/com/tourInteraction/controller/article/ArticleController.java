package com.tourInteraction.controller.article;

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
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getArticles.do")
	public @ResponseBody String getArticles(HttpServletRequest request,
			@RequestParam("limit")String limit,
			@RequestParam("offset")String offset){
		logger.debug("article/getArticles.do被调用");
		List<Article> list = new ArrayList<Article>();
		list = articleService.getArticles(limit,offset);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("list", list);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getArticleCount.do")
	public @ResponseBody int getArticleCount(HttpServletRequest request){
		logger.debug("article/getArticleCount.do被调用");
		int count = articleService.getArticleCount();
		return count;
	}
	
	@RequestMapping("/getNowUserArticle.do")
	public @ResponseBody String getNowUserArticle(HttpServletRequest request,
			@RequestParam("limit")String limit,
			@RequestParam("offset")String offset){
		logger.debug("article/getNowUserArticle.do被调用");
		User user = SignInAndUpController.getSignInUser(request);
		List<Article> list = new ArrayList<Article>();
		list = articleService.getNowUserArticle(user.getId(),limit,offset);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getNowUserArticleCount.do")
	public @ResponseBody int getNowUserArticleCount(HttpServletRequest request){
		logger.debug("article/getNowUserArticleCount.do被调用");
		User user = SignInAndUpController.getSignInUser(request);
		int count = articleService.getNowUserArticleCount(user.getId());
		return count;
	}
	
	@RequestMapping("getArticleById.do")
	public @ResponseBody String getArticleById( @RequestParam("articleId") int articleId){
		Article article = new Article();
		logger.debug("article/getArticleById.do被调用");
		article = articleService.getArticleById(articleId);
		String result = JSONUtil.object2json(article);
		return result;
	}
	
	@RequestMapping("getArticlesBySubjectId.do")
	public @ResponseBody String getArticlesBySubjectId( @RequestParam("subjectId") int subjectId,
			@RequestParam("limit")int limit,
			@RequestParam("offset")int offset){
		logger.debug("article/getArticlesBySubjectId.do被调用");
		Map<String,Object> map = new HashMap<String , Object>();
		map = articleService.getArticlesBySubjectId(subjectId,limit,offset);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("addArticle.do")
	@ResponseBody
	public String writeArticle(HttpServletRequest request, @RequestParam("articleName") String articleName,
			@RequestParam("articleContent") String articleContent,
			@RequestParam("articleIconId") int articleIconId){
		logger.debug("article/addArticle.do ..........");
		User user = SignInAndUpController.getSignInUser(request);
		Article article = new Article();
		article.setArticleContent(articleContent);
		article.setArticleName(articleName);
		article.setCreateTime(new Date());
		article.setArticleIconId(articleIconId);
		article.setArticleLookCount(0);
		article.setArticleLoveCount(0);
		article.setArticleSupportCount(0);
		article.setArticleCommentCount(0);
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
		logger.debug("article/getRequestSubmitNewsBySubjectId.do被调用");
		article = articleService.getRequestSubmitNewsBySubjectId(subjectId);
		String result = JSONUtil.object2json(article);
		return result;
	}
	
	

}
