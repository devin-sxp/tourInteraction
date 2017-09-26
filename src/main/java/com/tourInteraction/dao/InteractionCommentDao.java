package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.InteractionComment;
import com.tourInteraction.entity.InteractionReply;

public interface InteractionCommentDao {

	int getCommentCount(Map<String, Object> mapParam);

	List<InteractionComment> getComment(Map<String, Object> mapParam);

	int getReplyCountByCommentId(Map<String, Object> mapParam);

	List<InteractionReply> getReplyByCommentId(Map<String, Object> mapParam);

	int addComment(Map<String, Object> mapParam);

	int addReply(Map<String, Object> mapParam);


}
