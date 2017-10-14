package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class Privilege extends Base {

	private static final long serialVersionUID = 1L;
	
	private int parentId;
	private String privilegeName;
	private String privilegeValue;
	private boolean checked;

	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getPrivilegeName() {
		return privilegeName;
	}
	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}
	public String getPrivilegeValue() {
		return privilegeValue;
	}
	public void setPrivilegeValue(String privilegeValue) {
		this.privilegeValue = privilegeValue;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}
