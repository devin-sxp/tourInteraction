package com.tourInteraction.service.article;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface IArticleCommentAndReplyService {

	Map<String, Object> getArticleComment(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("articleId") int articleId, String getMethod);
	Map<String, Object> getArticleReply(Map<String,Object> map);
	int addArticleComment(Map<String, Object> map);
	int updateArticleComment(Map<String, Object> map);
	int addCommentReply(Map<String, Object> map);

}
