package com.tourInteraction.serviceImpl.article;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<Article> getArticles(String limit, String offset) {
		// TODO Auto-generated method stub
		return articleDao.getArticles(limit,offset);
	}

	@Override
	public int getArticleCount() {
		return articleDao.getArticleCount();
	}

	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> getArticlesBySubjectId(int subjectId,int limit,int offset) {
		ArrayList<Article> list = new ArrayList<Article>(articleDao.getArticlesBySubjectId(subjectId,limit,offset));
		int count = articleDao.getArticleCountBySubjectId(subjectId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	@Override
	public Map<String, Object> getArticleAuthorBySubjectId(int subjectId, int limit, int offset) {
		ArrayList<Article> list = new ArrayList<Article>(articleDao.getArticleAuthorBySubjectId(subjectId,limit,offset));
		int count = articleDao.getArticleAuthorCountBySubjectId(subjectId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("count", count);
		map.put("list", list);
		return map;
	}



	

}
