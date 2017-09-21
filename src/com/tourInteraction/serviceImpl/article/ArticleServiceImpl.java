package com.tourInteraction.serviceImpl.article;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.tourInteraction.dao.article.ArticleDao;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.service.article.IArticleService;

@Service("articleServiceImpl")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	private ArticleDao articleDao;

	@Override
	public List<Article> getNowUserArticle(int userId, String limit, String offset) {
		// TODO Auto-generated method stub
		return articleDao.getNowUserArticle(userId, limit, offset);
	}

	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return articleDao.getArticleById(id);
	}

	@Override
	public int writeArticle(Article article) {
		// TODO Auto-generated method stub
		return articleDao.writeArticle(article);
	}

	@Override
	public Article getRequestSubmitNewsBySubjectId(int subjectId) {
		// TODO Auto-generated method stub
		return articleDao.getRequestSubmitNewsBySubjectId(subjectId);
	}

	@Override
	public int getNowUserArticleCount(int userId) {
		// TODO Auto-generated method stub
		return articleDao.getNowUserArticleCount(userId);
	}



	

}
