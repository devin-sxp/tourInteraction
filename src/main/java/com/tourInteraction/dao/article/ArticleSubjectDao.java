package com.tourInteraction.dao.article;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.ArticleSubject;

public interface ArticleSubjectDao{

	List<ArticleSubject> getSubject(@Param("limit") String limit,@Param("offset") String offset);

	ArticleSubject getSubjectById(@Param("id")int id);

	int delSubjectById(@Param("id")int id);

	int updateSubject(Map<String, Object> mapParam);

	int addSubject(Map<String, Object> mapParam);

	List<ArticleSubject> getSubjectsByUserId(int userId);

}
