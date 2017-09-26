package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class InteractionReply extends Base{

	private static final long serialVersionUID = 1L;
	private int commentId;
	private String replyContent;
	private int targetUser;
	private String targetUserName;

	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getTargetUser() {
		return targetUser;
	}
	public void setTargetUser(int targetUser) {
		this.targetUser = targetUser;
	}
	public String getTargetUserName() {
		return targetUserName;
	}
	public void setTargetUserName(String targetUserName) {
		this.targetUserName = targetUserName;
	}
	
}
