package com.tourInteraction.dao.article;

import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleRequestSubmit;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface ArticleDao{

	List<Article> getNowUserArticle(@Param("userId") int userId, @Param("limit") String limit,@Param("offset") String offset);

	Article getArticleById(int id);

	int writeArticle(Article article);

	int getNowUserArticleCount(int userId);

	List<Article> getArticles(@Param("limit") String limit,@Param("offset") String offset);

	int getArticleCount();

	Collection<? extends Article> getArticlesBySubjectId(@Param("subjectId") int subjectId, @Param("limit")int limit,@Param("offset") int offset);

	int getArticleCountBySubjectId(@Param("subjectId")int subjectId);

	Collection<? extends Article> getArticleAuthorBySubjectId(@Param("subjectId") int subjectId, @Param("limit")int limit,@Param("offset") int offset);

	int getArticleAuthorCountBySubjectId(@Param("subjectId")int subjectId);

	List<ArticleRequestSubmit> getArticleRequestSubmitNews(@Param("userId")int userId);

	int updateArticleRequestSubmit(Map<String, Object> map);

	int passSubmitArticle(Map<String, Object> map);

	int updateArticleCommentCount(@Param("articleId")int articleId, @Param("addValue")int addValue);

    int updateArticle(Map<String, Object> map);

	int isLoveThisArticle(Map<String, Object> map);

	int loveArticleToDel(Map<String, Object> map);

	int loveArticleToAdd(Map<String, Object> map);

	List<Article> getLovedArticles(Map<String, Object> mapParam);

    List<ArticleRequestSubmit> getArticleRequestSubmitNewsByType(@Param("type") String type);

    int delArticleById(@Param("articleId") int articleId);

	int updateArticleStatus(@Param("status") String status,@Param("articleId") int articleId);
}
