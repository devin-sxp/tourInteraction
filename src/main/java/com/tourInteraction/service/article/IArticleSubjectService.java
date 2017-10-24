package com.tourInteraction.service.article;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.article.ArticleSubject;

public interface IArticleSubjectService {

	List<ArticleSubject> getSubject(String limit, String offset);

	ArticleSubject getSubjectById(int id);

	int delSubjectById(int id);

	int updateSubject(Map<String, Object> mapParam);

	int addSubject(Map<String, Object> mapParam);

	List<ArticleSubject> getSubjectsByUserId(int userId);

	int getSubjectCount();

	int requestSubmitArticle(int userId, int subjectId, int subjectCreateUserId, int[] submitArticleIds);

}
