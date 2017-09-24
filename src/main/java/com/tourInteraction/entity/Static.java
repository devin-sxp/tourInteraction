package com.tourInteraction.entity;

import java.util.Date;

public class Static {
	private long id;
	private String staticCode;
	private String staticName;
	private String staticType;
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
	public String getStaticCode() {
		return staticCode;
	}
	public void setStaticCode(String staticCode) {
		this.staticCode = staticCode;
	}
	public String getStaticName() {
		return staticName;
	}
	public void setStaticName(String staticName) {
		this.staticName = staticName;
	}
	public String getStaticType() {
		return staticType;
	}
	public void setStaticType(String staticType) {
		this.staticType = staticType;
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
