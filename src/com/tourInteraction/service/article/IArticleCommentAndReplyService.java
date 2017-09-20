package com.tourInteraction.service.article;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;

public interface IArticleCommentAndReplyService {

	List<ArticleComment> getArticleComment(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("articleId") int articleId);
	List<ArticleReply> getArticleReply(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("commentId") int commentId);

}
