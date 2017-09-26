package com.tourInteraction.entity;
import com.tourInteraction.entity.base.Base;

public class Files extends Base{
	private static final long serialVersionUID = 1L;
	private String fileName;
	private String filePath;
	private String fileType;
	private String fileUse;


	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileUse() {
		return fileUse;
	}
	public void setFileUse(String fileUse) {
		this.fileUse = fileUse;
	}
	
	
	
	
}
