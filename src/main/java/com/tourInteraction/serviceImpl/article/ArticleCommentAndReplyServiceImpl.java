package com.tourInteraction.serviceImpl.article;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.article.ArticleCommentAndReplyDao;
import com.tourInteraction.dao.article.ArticleDao;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;
import com.tourInteraction.service.article.IArticleCommentAndReplyService;
import com.tourInteraction.service.article.IArticleService;

@Service("articleCommentAndReplyServiceImpl")
public class ArticleCommentAndReplyServiceImpl implements IArticleCommentAndReplyService {

	@Resource
	private ArticleCommentAndReplyDao articleCommentAndReplyDao;

	@Override
	public List<ArticleComment> getArticleComment(String limit, String offset, int articleId) {
		// TODO Auto-generated method stub
		return articleCommentAndReplyDao.getArticleComment(limit, offset, articleId);
	}

	@Override
	public List<ArticleReply> getArticleReply(String limit, String offset, int commentId) {
		// TODO Auto-generated method stub
		return articleCommentAndReplyDao.getArticleReply(limit, offset, commentId);
	}


}
