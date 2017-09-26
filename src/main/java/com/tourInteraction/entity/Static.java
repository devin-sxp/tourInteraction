package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class Static extends Base{

	private static final long serialVersionUID = 1L;
	private String staticCode;
	private String staticName;
	private String staticType;

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
	
}
