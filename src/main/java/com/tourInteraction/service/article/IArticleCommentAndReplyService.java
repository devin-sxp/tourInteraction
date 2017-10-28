package com.tourInteraction.service.article;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.article.ArticleReply;

public interface IArticleCommentAndReplyService {

	Map<String, Object> getArticleComment(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("articleId") int articleId, String getMethod);
	List<ArticleReply> getArticleReply(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("commentId") int commentId);
	int addArticleComment(Map<String, Object> map);
	int updateArticleComment(Map<String, Object> map);
	int addCommentReply(Map<String, Object> map);

}
