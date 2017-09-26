package com.tourInteraction.entity.article;
import com.tourInteraction.entity.base.Base;

public class Article extends Base{

	private static final long serialVersionUID = 1L;
	private int subjectId;
	private String subjectTitle;
	private String articleName;
	private String articleContent;
	private int articleIconId;
	private int articleLookCount;
	private int articleLoveCount;
	private int articleSupportCount;
	private int articleCommentCount;
	private String filePath;
	private String userIconPath;
	
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	
	public String getSubjectTitle() {
		return subjectTitle;
	}
	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public int getArticleIconId() {
		return articleIconId;
	}
	public void setArticleIconId(int articleIconId) {
		this.articleIconId = articleIconId;
	}
	public int getArticleLookCount() {
		return articleLookCount;
	}
	public void setArticleLookCount(int articleLookCount) {
		this.articleLookCount = articleLookCount;
	}
	public int getArticleLoveCount() {
		return articleLoveCount;
	}
	public void setArticleLoveCount(int articleLoveCount) {
		this.articleLoveCount = articleLoveCount;
	}
	public int getArticleSupportCount() {
		return articleSupportCount;
	}
	public void setArticleSupportCount(int articleSupportCount) {
		this.articleSupportCount = articleSupportCount;
	}
	
	public int getArticleCommentCount() {
		return articleCommentCount;
	}
	public void setArticleCommentCount(int articleCommentCount) {
		this.articleCommentCount = articleCommentCount;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getUserIconPath() {
		return userIconPath;
	}
	public void setUserIconPath(String userIconPath) {
		this.userIconPath = userIconPath;
	}
	
}
