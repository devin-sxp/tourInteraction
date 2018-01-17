package com.tourInteraction.entity.article;

import com.tourInteraction.entity.base.Base;

public class ArticleRequestSubmit extends Base{

	private static final long serialVersionUID = 7640629283467078611L;
	private int requestSubjectId;
	private int requestArticleId;
	private int isPass;
	private String articleName;
	private String articleContent;
	private String filePath;
	private String userIconPath;
	private String requestSubjectTitle;

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
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUserIconPath() {
		return userIconPath;
	}
	public void setUserIconPath(String userIconPath) {
		this.userIconPath = userIconPath;
	}

	public String getRequestSubjectTitle() {
		return requestSubjectTitle;
	}

	public void setRequestSubjectTitle(String requestSubjectTitle) {
		this.requestSubjectTitle = requestSubjectTitle;
	}
}
