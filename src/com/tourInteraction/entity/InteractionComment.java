package com.tourInteraction.entity;

import java.util.Date;

public class InteractionComment {
	private int id;
	private int newsId;
	private String commentContent;
	private Date createTime;
	private Date updateTime;
	private int createUser;
	private String createUserName;
	private int updateUser;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public int getCreateUser() {
		return createUser;
	}
	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public int getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(int updateUser) {
		this.updateUser = updateUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
