package com.tourInteraction.entity;

import java.util.Date;

public class InteractionModel {
	private int id;
	private String moduleIcon;
	private String moduleName;
	private String moduleDiscription;
	private String moduleLabel;
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
	
	public String getModuleIcon() {
		return moduleIcon;
	}
	public void setModuleIcon(String moduleIcon) {
		this.moduleIcon = moduleIcon;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getModuleDiscription() {
		return moduleDiscription;
	}
	public void setModuleDiscription(String moduleDiscription) {
		this.moduleDiscription = moduleDiscription;
	}
	public String getModuleLabel() {
		return moduleLabel;
	}
	public void setModuleLabel(String moduleLabel) {
		this.moduleLabel = moduleLabel;
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
