package com.tourInteraction.entity;

import java.io.Serializable;
import java.util.Date;

public class Configure implements Serializable {
	private long id;
	private String staticCodeConfigure;
	private String staticCodeUse;
	private String title;
	private String description;
	private String file;
	private String configureName;
	private String configureUse;
	private Date createTime;
	private Long createUser;
	private Date updateTime;
	private Long updateUser;
	private String status;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getStaticCodeConfigure() {
		return staticCodeConfigure;
	}
	public void setStaticCodeConfigure(String staticCodeConfigure) {
		this.staticCodeConfigure = staticCodeConfigure;
	}
	public String getStaticCodeUse() {
		return staticCodeUse;
	}
	public void setStaticCodeUse(String staticCodeUse) {
		this.staticCodeUse = staticCodeUse;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	public String getConfigureName() {
		return configureName;
	}
	public void setConfigureName(String configureName) {
		this.configureName = configureName;
	}
	public String getConfigureUse() {
		return configureUse;
	}
	public void setConfigureUse(String configureUse) {
		this.configureUse = configureUse;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Long getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}