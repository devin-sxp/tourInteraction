package com.tourInteraction.controller.article;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;
import com.tourInteraction.service.article.IArticleCommentAndReplyService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/articleCommentAndReply")
public class ArticleCommentAndReplyController {
	
	@Resource(name="articleCommentAndReplyServiceImpl")
	private IArticleCommentAndReplyService	articleCommentAndReplyService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getArticleComment.do")
	public @ResponseBody String getArticleComment(String limit,String offset,
			@RequestParam("articleId") int articleId){
		logger.debug("articleCommentAndReply/getArticleComment.do被调用");

		List<ArticleComment> list = new ArrayList<ArticleComment>();
		list = articleCommentAndReplyService.getArticleComment(limit, offset, articleId);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", 10);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getArticleReply.do")
	public @ResponseBody String getArticleReply(String limit,String offset,
			@RequestParam("commentId") int commentId){
		logger.debug("articleCommentAndReply/getArticleReply.do被调用");

		List<ArticleReply> list = new ArrayList<ArticleReply>();
		list = articleCommentAndReplyService.getArticleReply(limit, offset, commentId);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", 10);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
}
