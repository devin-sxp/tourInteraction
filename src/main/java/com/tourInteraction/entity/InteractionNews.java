package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class InteractionNews extends Base{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int moduleId;
	private String moduleName;
	private String newsTitle;
	private String newsContent;
	private String newsLabel;
	private String newsAddress;
	
	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsLabel() {
		return newsLabel;
	}
	public void setNewsLabel(String newsLabel) {
		this.newsLabel = newsLabel;
	}
	public String getNewsAddress() {
		return newsAddress;
	}
	public void setNewsAddress(String newsAddress) {
		this.newsAddress = newsAddress;
	}
	
	
}
