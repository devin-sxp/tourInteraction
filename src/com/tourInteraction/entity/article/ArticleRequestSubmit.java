package com.tourInteraction.entity.article;

import java.io.Serializable;
import java.util.Date;

public class ArticleRequestSubmit implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7640629283467078611L;
	private int id;
	private int requestSubjectId;
	private int requestArticleId;
	private int isPass;
	private Date createTime;
	private Date updateTime;
	private int createUser;
	private int updateUser;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRequestSubjectId() {
		return requestSubjectId;
	}
	public void setRequestSubjectId(int requestSubjectId) {
		this.requestSubjectId = requestSubjectId;
	}
	public int getRequestArticleId() {
		return requestArticleId;
	}
	public void setRequestArticleId(int requestArticleId) {
		this.requestArticleId = requestArticleId;
	}
	public int getIsPass() {
		return isPass;
	}
	public void setIsPass(int isPass) {
		this.isPass = isPass;
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
