package com.tourInteraction.serviceImpl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.dao.MessageRemindDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tourInteraction.dao.InteractionCommentDao;
import com.tourInteraction.entity.InteractionComment;
import com.tourInteraction.entity.InteractionReply;
import com.tourInteraction.service.IInteractionCommentService;


@Service("interactionCommentServiceImpl")
public class InteractionCommentServiceImpl implements IInteractionCommentService {

	@Resource
	private  InteractionCommentDao interactionCommentDao;

	@Autowired
	private MessageRemindDao messageRemindDao;
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
		int num = interactionCommentDao.addComment(mapParam);
		mapParam.put("type","news");
		mapParam.put("remindLinkId",mapParam.get("newsId"));
		mapParam.put("remindPosition", GlobalConstantKey.MESSAGE_REMIND_PRE_NEWS+mapParam.get("id"));
		num = messageRemindDao.insertMessageRemind(mapParam);
		return num;
	}

	@Override
	public int addReply(Map<String, Object> mapParam) {
		int num = interactionCommentDao.addReply(mapParam);
		mapParam.put("type","news");
		mapParam.put("remindLinkId",mapParam.get("newsId"));
		mapParam.put("remindPosition", GlobalConstantKey.MESSAGE_REMIND_PRE_NEWS+mapParam.get("commentId"));
		num = messageRemindDao.insertMessageRemind(mapParam);
		return  num;
	}

	
	

}
