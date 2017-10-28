package com.tourInteraction.serviceImpl.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.article.ArticleCommentAndReplyDao;
import com.tourInteraction.dao.article.ArticleDao;
import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;
import com.tourInteraction.service.article.IArticleCommentAndReplyService;

@Service("articleCommentAndReplyServiceImpl")
public class ArticleCommentAndReplyServiceImpl implements IArticleCommentAndReplyService {

	@Resource
	private ArticleCommentAndReplyDao articleCommentAndReplyDao;

	@Autowired
	@Qualifier("articleDao")
	private ArticleDao articleDao;
	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> getArticleComment(String limit, String offset, int articleId,String getMethod) {
		// TODO Auto-generated method stub
		int commentCount = articleCommentAndReplyDao.getArticleCommentCount(articleId);
		List<ArticleComment> list = articleCommentAndReplyDao.getArticleComment(limit, offset, articleId, getMethod);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", commentCount);
		map.put("list", list);
		return map;
	}

	@Override
	public List<ArticleReply> getArticleReply(String limit, String offset, int commentId) {
		// TODO Auto-generated method stub
		return articleCommentAndReplyDao.getArticleReply(limit, offset, commentId);
	}

	@Override
	@Transactional
	public int addArticleComment(Map<String, Object> map) {
		int num = articleCommentAndReplyDao.addArticleComment(map);
		num = articleDao.updateArticleCommentCount((Integer)map.get("articleId"),1);
		return num;
	}

	@Override
	public int updateArticleComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return articleCommentAndReplyDao.updateArticleComment(map);
	}

	@Override
	@Transactional
	public int addCommentReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int num = articleCommentAndReplyDao.addCommentReply(map);
		num = articleCommentAndReplyDao.updateArticleComment(map);
		return num;
	}


}
