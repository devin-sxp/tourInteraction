package com.tourInteraction.service.article;

import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleRequestSubmit;

import java.util.List;
import java.util.Map;

public interface IArticleService {

	List<Article> getNowUserArticle(int userId, String limit, String offset);

	Article getArticleById(int id);

	int writeArticle(Article article);

	int getNowUserArticleCount(int userId);

	List<Article> getArticles(String limit, String offset);

	int getArticleCount();

	Map<String, Object> getArticlesBySubjectId(int subjectId, int limit, int offset);

	Map<String, Object> getArticleAuthorBySubjectId(int subjectId, int limit, int offset);

	List<ArticleRequestSubmit> getArticleRequestSubmitNews(int userId);

	int dealArticleRequestSubmitNews(Map<String, Object> map);

    int updateArticle(Map<String, Object> map);

    String loveArticle(Map<String, Object> map);

    Boolean isLoveThisArticle(Map<String, Object> map);

	List<Article> getLovedArticles(Map<String, Object> mapParam);

    List<ArticleRequestSubmit> getArticleRequestSubmitNewsByType(String type);

	Boolean delArticleById(int articleId, int level, String opIdentity, String articleName, int targetUserId, int createUser);
}
