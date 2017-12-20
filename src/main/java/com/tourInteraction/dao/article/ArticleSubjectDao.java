package com.tourInteraction.dao.article;

import com.tourInteraction.entity.article.ArticleSubject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ArticleSubjectDao{

	List<ArticleSubject> getSubject(@Param("limit") String limit,@Param("offset") String offset);

	List<ArticleSubject> getSubjectB(@Param("limit") String limit,@Param("offset") String offset);

	ArticleSubject getSubjectById(@Param("id")int id);

	ArticleSubject getSubjectByIdB(@Param("id")int id);

	int delSubjectById(@Param("id")int id);

	int updateSubject(Map<String, Object> mapParam);

	int addSubject(Map<String, Object> mapParam);

	List<ArticleSubject> getSubjectsByUserId(int userId);

	int getSubjectCount();

	int getSubjectCountB();

	int requestSubmitArticle(Map<String, Object> map);

}
