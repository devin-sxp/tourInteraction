package com.tourInteraction.service.article;

import com.tourInteraction.entity.article.ArticleSubject;

import java.util.List;
import java.util.Map;

public interface IArticleSubjectService {

	List<ArticleSubject> getSubject(String limit, String offset);

	ArticleSubject getSubjectById(int id);

	List<ArticleSubject> getSubjectB(String limit, String offset);

	ArticleSubject getSubjectByIdB(int id);

	int delSubjectById(int id);

	int updateSubject(Map<String, Object> mapParam);

	int addSubject(Map<String, Object> mapParam);

	List<ArticleSubject> getSubjectsByUserId(int userId);

	int getSubjectCount();

	int getSubjectCountB();

	int requestSubmitArticle(int userId, int subjectId, int subjectCreateUserId, int[] submitArticleIds);

}
