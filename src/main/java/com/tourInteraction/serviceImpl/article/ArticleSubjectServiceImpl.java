package com.tourInteraction.serviceImpl.article;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.article.ArticleSubjectDao;
import com.tourInteraction.entity.article.ArticleSubject;
import com.tourInteraction.service.article.IArticleSubjectService;

@Service("articleSubjectServiceImpl")
public class ArticleSubjectServiceImpl implements IArticleSubjectService {

	@Resource
	private ArticleSubjectDao articleSubjectDao;

	@Override
	public List<ArticleSubject> getSubject(String limit, String offset) {
		// TODO Auto-generated method stub
		return articleSubjectDao.getSubject(limit, offset);
	}

	@Override
	public ArticleSubject getSubjectById(int id) {
		// TODO Auto-generated method stub
		return articleSubjectDao.getSubjectById(id);
	}

	@Override
	public int delSubjectById(int id) {
		// TODO Auto-generated method stub
		return articleSubjectDao.delSubjectById(id);
	}

	@Override
	public int updateSubject(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return articleSubjectDao.updateSubject(mapParam);
	}

	@Override
	public int addSubject(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return articleSubjectDao.addSubject(mapParam);
	}

	@Override
	public List<ArticleSubject> getSubjectsByUserId(int userId) {
		// TODO Auto-generated method stub
		return articleSubjectDao.getSubjectsByUserId(userId);
	}

	

}
