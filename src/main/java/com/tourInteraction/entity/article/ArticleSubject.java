package com.tourInteraction.entity.article;

import com.tourInteraction.entity.base.Base;

public class ArticleSubject extends Base{

	private static final long serialVersionUID = 1L;
	private String subjectTitle;
	private String subjectDescription;
	private String subjectIconPath;
	private String subjectTypeName;
	public String getSubjectTitle() {
		return subjectTitle;
	}
	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}
	public String getSubjectDescription() {
		return subjectDescription;
	}
	public void setSubjectDescription(String subjectDescription) {
		this.subjectDescription = subjectDescription;
	}

	public String getSubjectIconPath() {
		return subjectIconPath;
	}
	public void setSubjectIconPath(String subjectIconPath) {
		this.subjectIconPath = subjectIconPath;
	}
	public String getSubjectTypeName() {
		return subjectTypeName;
	}
	public void setSubjectTypeName(String subjectTypeName) {
		this.subjectTypeName = subjectTypeName;
	}
	
}
