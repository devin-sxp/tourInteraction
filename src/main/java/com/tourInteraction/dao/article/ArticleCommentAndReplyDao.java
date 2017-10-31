package com.tourInteraction.dao.article;

import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ArticleCommentAndReplyDao{

	List<ArticleComment> getArticleComment(@Param("limit") String limit,
			@Param("offset") String offset,
			@Param("articleId") int articleId,@Param("getMethod") String getMethod);
	int addArticleComment(Map<String, Object> map);
	int getArticleCommentCount(@Param("articleId")int articleId);
	int updateArticleComment(Map<String, Object> map);
	int addCommentReply(Map<String, Object> map);

    int getArticleReplyCount(@Param("commentId") int commentId);

	List<ArticleReply> getArticleReply(Map<String, Object> mapCondition);
}
