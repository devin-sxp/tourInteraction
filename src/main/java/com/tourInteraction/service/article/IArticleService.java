package com.tourInteraction.service.article;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleRequestSubmit;

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

}
