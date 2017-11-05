package com.tourInteraction.controller.article;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.controller.SignInAndUpController;
import com.tourInteraction.entity.User;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleRequestSubmit;
import com.tourInteraction.service.article.IArticleService;
import com.tourInteraction.utils.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
		logger.info("article/getArticles.do被调用");
		List<Article> list = new ArrayList<Article>();
		list = articleService.getArticles(limit,offset);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("list", list);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getArticleCount.do")
	public @ResponseBody int getArticleCount(HttpServletRequest request){
		logger.info("article/getArticleCount.do被调用");
		int count = articleService.getArticleCount();
		return count;
	}
	
	@RequestMapping("/getNowUserArticle.do")
	public @ResponseBody String getNowUserArticle(HttpServletRequest request,
			@RequestParam("limit")String limit,
			@RequestParam("offset")String offset){
		logger.info("article/getNowUserArticle.do被调用");
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
		logger.info("article/getNowUserArticleCount.do被调用");
		User user = SignInAndUpController.getSignInUser(request);
		int count = articleService.getNowUserArticleCount(user.getId());
		return count;
	}
	
	@RequestMapping("getArticleById.do")
	public @ResponseBody String getArticleById( @RequestParam("articleId") int articleId){
		Article article = new Article();
		logger.info("article/getArticleById.do被调用");
		article = articleService.getArticleById(articleId);
		String result = JSONUtil.object2json(article);
		return result;
	}
	
	@RequestMapping("getArticlesBySubjectId.do")
	public @ResponseBody String getArticlesBySubjectId( @RequestParam("subjectId") int subjectId,
			@RequestParam("limit")int limit,
			@RequestParam("offset")int offset){
		logger.info("article/getArticlesBySubjectId.do被调用");
		Map<String,Object> map = new HashMap<String , Object>();
		map = articleService.getArticlesBySubjectId(subjectId,limit,offset);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("getArticleAuthorBySubjectId.do")
	public @ResponseBody String getArticleAuthorBySubjectId( @RequestParam("subjectId") int subjectId,
			@RequestParam("limit")int limit,
			@RequestParam("offset")int offset){
		logger.info("article/getArticleAuthorBySubjectId.do被调用");
		Map<String,Object> map = new HashMap<String , Object>();
		map = articleService.getArticleAuthorBySubjectId(subjectId,limit,offset);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("addArticle.do")
	@ResponseBody
	public String writeArticle(HttpServletRequest request, @RequestParam("articleName") String articleName,
			@RequestParam("articleContent") String articleContent,
			@RequestParam("articleIconId") int articleIconId){
		logger.info("article/addArticle.do ..........");
		User user = SignInAndUpController.getSignInUser(request);
		Article article = new Article();
		article.setArticleContent(articleContent);
		article.setArticleName(articleName);
		article.setCreateTime(new Date());
		article.setArticleIconId(articleIconId);
		article.setArticleLookCount(GlobalConstantKey.ARTICLE_LOOK_COUNT);
		article.setArticleLoveCount(GlobalConstantKey.ARTICLE_LOVE_COUNT);
		article.setArticleSupportCount(GlobalConstantKey.ARTICLE_SUPPORT_COUNT);
		article.setArticleCommentCount(GlobalConstantKey.ARTICLE_COMMENT_COUNT);
		article.setCreateUser(user.getId());
		article.setStatus(GlobalConstantKey.STATUS_OPEN);
		int num = articleService.writeArticle(article);
		String result = "保存失败，请稍后重试！";
		if(num > 0 ){
			result = "保存成功，请在个人主页查看！";
		}
		return result;
		
	}
	
	//根据专题获取投稿申请信息
	@RequestMapping("getArticleRequestSubmitNews.do")
	public @ResponseBody String getArticleRequestSubmitNews(HttpServletRequest request){
		logger.info("article/getArticleRequestSubmitNews.do被调用");
		User user =SignInAndUpController.getSignInUser(request);
		List<ArticleRequestSubmit> list = articleService.getArticleRequestSubmitNews(user.getId());
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	@RequestMapping("dealArticleRequestSubmitNews.do")
	@ResponseBody
	public String dealArticleRequestSubmitNews(HttpServletRequest request, @RequestParam("requestId") int requestId,
			@RequestParam("requestArticleId") int requestArticleId,
			@RequestParam("requestSubjectId") int requestSubjectId,@RequestParam("isPass") int isPass){
		logger.info("article/dealArticleRequestSubmitNews.do ..........");
		User user = SignInAndUpController.getSignInUser(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("requestId", requestId);
		map.put("requestArticleId", requestArticleId);
		map.put("requestSubjectId", requestSubjectId);
		map.put("isPass", isPass);
		map.put("updateUser", user.getId());
		map.put("updateTime", new Date());
		map.put("status", GlobalConstantKey.STATUS_CLOSE);
		int num = articleService.dealArticleRequestSubmitNews(map);
		String result = "操作失败！";
		if(num > 0 ){
			result = "操作成功！";
		}
		return result;
		
	}

}
