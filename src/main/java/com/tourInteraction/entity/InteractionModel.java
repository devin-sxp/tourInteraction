package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class InteractionModel extends Base{

	private static final long serialVersionUID = 1L;
	private String moduleIcon;
	private String moduleName;
	private String moduleDiscription;
	private String moduleLabel;

	
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
	

	
	
}
