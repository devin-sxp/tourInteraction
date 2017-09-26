package com.tourInteraction.entity;

import java.util.Date;

import com.tourInteraction.entity.base.Base;

public class Home extends Base{

	private static final long serialVersionUID = 1L;
	public String title;
	public String content;
	public Date date;
	public String lable;
	public String url;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String lable) {
		this.lable = lable;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
