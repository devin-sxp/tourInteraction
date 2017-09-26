package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class InteractionComment extends Base{

	private static final long serialVersionUID = 1L;
	private int newsId;
	private String commentContent;
	
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	
}
