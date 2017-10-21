package com.tourInteraction.dao.article;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.Article;

public interface ArticleDao{

	List<Article> getNowUserArticle(@Param("userId") int userId, @Param("limit") String limit,@Param("offset") String offset);

	Article getArticleById(int id);

	int writeArticle(Article article);

	Article getRequestSubmitNewsBySubjectId(int subjectId);

	int getNowUserArticleCount(int userId);

	List<Article> getArticles(@Param("limit") String limit,@Param("offset") String offset);

	int getArticleCount();

	Collection<? extends Article> getArticlesBySubjectId(@Param("subjectId") int subjectId, @Param("limit")int limit,@Param("offset") int offset);

	int getArticleCountBySubjectId(@Param("subjectId")int subjectId);

	Collection<? extends Article> getArticleAuthorBySubjectId(@Param("subjectId") int subjectId, @Param("limit")int limit,@Param("offset") int offset);

	int getArticleAuthorCountBySubjectId(@Param("subjectId")int subjectId);
}
