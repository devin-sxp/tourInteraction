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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.controller.SignInAndUpController;
import com.tourInteraction.entity.article.ArticleReply;
import com.tourInteraction.service.article.IArticleCommentAndReplyService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/articleCommentAndReply")
@Transactional
public class ArticleCommentAndReplyController {
	
	@Resource(name="articleCommentAndReplyServiceImpl")
	private IArticleCommentAndReplyService	articleCommentAndReplyService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getArticleComments.do")
	public @ResponseBody String getArticleComments(String limit,String offset,
			@RequestParam("articleId") int articleId,@RequestParam("getMethod")String getMethod){
		logger.info("articleCommentAndReply/getArticleComments.do被调用");
		Map<String, Object> map = articleCommentAndReplyService.getArticleComment(limit, offset, articleId, getMethod);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getArticleReply.do")
	public @ResponseBody String getArticleReply(String limit,String offset,
			@RequestParam("commentId") int commentId){
		logger.info("articleCommentAndReply/getArticleReply.do被调用");

		List<ArticleReply> list = new ArrayList<ArticleReply>();
		list = articleCommentAndReplyService.getArticleReply(limit, offset, commentId);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", 10);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/addArticleComment.do")
	@ResponseBody
	public String addArticleComment(HttpServletRequest request,
			@RequestParam("commentContent") String commentContent,
			@RequestParam("articleId") int articleId){
		logger.info("articleCommentAndReply/addArticleComment.do被调用");
		String result = "评论失败！";
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("commentPraiseCount", 0);
		map.put("commentReplyCount", 0);
		map.put("commentContent", commentContent);
		map.put("createUser", SignInAndUpController.getSignInUser(request).getId());
		map.put("createTime", new Date());
		map.put("status", "1");
		int num = articleCommentAndReplyService.addArticleComment(map);
		if(num>0){
			result = "评论成功！";
		}
		return result;
	}
	
	@RequestMapping("/updateArticleComment.do")
	@ResponseBody
	public String updateArticleComment(HttpServletRequest request,
			@RequestParam("commentId") int commentId) {
		logger.info("articleCommentAndReply/updateArticleComment.do被调用");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentId", commentId);
		map.put("praiseCountAddValue", 1);
		int num = articleCommentAndReplyService.updateArticleComment(map);
		String result = "赞失败了!";
		if(num>0){
			result = "赞成功了!";
		}
		return result;
	}
	
	
	@RequestMapping("/addCommentReply.do")
	@ResponseBody
	public String addCommentReply(HttpServletRequest request,
			@RequestParam("textarea_reply_content") String replyContent,
			@RequestParam("commentId") int commentId,
			@RequestParam("targetUserId") int targetUserId){
		logger.info("articleCommentAndReply/addCommentReply.do被调用");
		String result = "回复失败！";
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("commentId", commentId);
		map.put("replyContent", replyContent);
		map.put("targetUserId", targetUserId);
		map.put("replyCountAddValue", 1);
		map.put("createUser", SignInAndUpController.getSignInUser(request).getId());
		map.put("createTime", new Date());
		map.put("status", "1");
		int num = articleCommentAndReplyService.addCommentReply(map);
		if(num>0){
			result = "回复成功！";
		}
		return result;
	}
}
