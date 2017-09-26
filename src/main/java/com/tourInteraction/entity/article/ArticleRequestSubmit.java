package com.tourInteraction.entity.article;

import com.tourInteraction.entity.base.Base;

public class ArticleRequestSubmit extends Base{

	private static final long serialVersionUID = 7640629283467078611L;
	private int requestSubjectId;
	private int requestArticleId;
	private int isPass;


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
	
}
