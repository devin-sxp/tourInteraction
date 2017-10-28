package com.tourInteraction.dao.article;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;

public interface ArticleCommentAndReplyDao{

	List<ArticleComment> getArticleComment(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("articleId") int articleId,@Param("getMethod") String getMethod);
	List<ArticleReply> getArticleReply(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("commentId") int commentId);
	int addArticleComment(Map<String, Object> map);
	int getArticleCommentCount(@Param("articleId")int articleId);
	int updateArticleComment(Map<String, Object> map);
	int addCommentReply(Map<String, Object> map);
	
}
