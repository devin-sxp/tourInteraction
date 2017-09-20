package com.tourInteraction.serviceImpl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.InteractionCommentDao;
import com.tourInteraction.entity.InteractionComment;
import com.tourInteraction.entity.InteractionReply;
import com.tourInteraction.service.IInteractionCommentService;


@Service("interactionCommentServiceImpl")
public class InteractionCommentServiceImpl implements IInteractionCommentService {

	@Resource
	private  InteractionCommentDao interactionCommentDao;

	@Override
	public int getCommentCount(Map<String, Object> mapParam) {

		return interactionCommentDao.getCommentCount(mapParam);
	}

	@Override
	public List<InteractionComment> getComment(Map<String, Object> mapParam) {

		return interactionCommentDao.getComment(mapParam);
	}

	@Override
	public int getReplyCountByCommentId(Map<String, Object> mapParam) {
		return interactionCommentDao.getReplyCountByCommentId(mapParam);
	}

	@Override
	public List<InteractionReply> getReplyByCommentId(Map<String, Object> mapParam) {
		return interactionCommentDao.getReplyByCommentId(mapParam);
	}

	@Override
	public int addComment(Map<String, Object> mapParam) {
		return interactionCommentDao.addComment(mapParam);
	}

	@Override
	public int addReply(Map<String, Object> mapParam) {
		return interactionCommentDao.addReply(mapParam);
	}

	
	

}
