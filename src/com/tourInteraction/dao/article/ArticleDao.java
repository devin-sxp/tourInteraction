package com.tourInteraction.dao.article;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.Article;

public interface ArticleDao{

	List<Article> getNowUserArticle(@Param("userId") int userId, @Param("limit") String limit,@Param("offset") String offset);

	Article getArticleById(int id);

	int writeArticle(Article article);

	Article getRequestSubmitNewsBySubjectId(int subjectId);

	int getNowUserArticleCount(int userId);
}
