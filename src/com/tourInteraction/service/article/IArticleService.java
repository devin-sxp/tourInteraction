package com.tourInteraction.service.article;

import java.util.List;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleSubject;

public interface IArticleService {

	List<Article> getArticle(String limit, String offset);

	Article getArticleById(int id);

	int writeArticle(Article article);

	Article getRequestSubmitNewsBySubjectId(int subjectId);

}
