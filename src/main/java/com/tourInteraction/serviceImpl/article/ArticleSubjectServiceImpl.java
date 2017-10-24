package com.tourInteraction.serviceImpl.article;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int getSubjectCount() {
		// TODO Auto-generated method stub
		return articleSubjectDao.getSubjectCount();
	}

	@Override
	@Transactional
	public int requestSubmitArticle(int userId, int subjectId,int subjectCreateUserId, int[] submitArticleIds) {
		int num = 0;
		for (int articleId : submitArticleIds) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("createUser", userId);
			map.put("subjectId", subjectId);
			map.put("articleId", articleId);
			map.put("subjectCreateUserId", subjectCreateUserId);
			map.put("status", "1");
			map.put("createTime", new Date());
			num = articleSubjectDao.requestSubmitArticle(map);
		}
		return num;
	}

	

}
