package com.tourInteraction.entity.article;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8416485920329348802L;
	private int id;
	private int subjectId;
	private String subjectTitle;
	private String articleName;
	private String articleContent;
	private int articleIconId;
	private int articleLookCount;
	private int articleLoveCount;
	private int articleSupportCount;
	private int articleCommentCount;
	private String filePath;
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
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	
	public String getSubjectTitle() {
		return subjectTitle;
	}
	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public int getArticleIconId() {
		return articleIconId;
	}
	public void setArticleIconId(int articleIconId) {
		this.articleIconId = articleIconId;
	}
	public int getArticleLookCount() {
		return articleLookCount;
	}
	public void setArticleLookCount(int articleLookCount) {
		this.articleLookCount = articleLookCount;
	}
	public int getArticleLoveCount() {
		return articleLoveCount;
	}
	public void setArticleLoveCount(int articleLoveCount) {
		this.articleLoveCount = articleLoveCount;
	}
	public int getArticleSupportCount() {
		return articleSupportCount;
	}
	public void setArticleSupportCount(int articleSupportCount) {
		this.articleSupportCount = articleSupportCount;
	}
	
	public int getArticleCommentCount() {
		return articleCommentCount;
	}
	public void setArticleCommentCount(int articleCommentCount) {
		this.articleCommentCount = articleCommentCount;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
