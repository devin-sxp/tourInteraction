package com.tourInteraction.dao.article;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.Article;

public interface ArticleDao{

	List<Article> getArticle(@Param("limit") String limit,@Param("offset") String offset);

	Article getArticleById(@Param("id")int id);

	int writeArticle(Article article);

	Article getRequestSubmitNewsBySubjectId(int subjectId);

}
