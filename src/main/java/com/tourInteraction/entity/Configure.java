package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class Configure extends Base {

	private static final long serialVersionUID = 1L;
	private String staticCodeConfigure;
	private String staticCodeUse;
	private String title;
	private String description;
	private String file;
	private String configureName;
	private String configureUse;

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
	
	
}