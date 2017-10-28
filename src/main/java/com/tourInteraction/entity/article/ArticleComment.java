package com.tourInteraction.entity.article;

import com.tourInteraction.entity.base.Base;

public class ArticleComment extends Base{

	private static final long serialVersionUID = 1L;
	private int articleId;
	private String commentContent;
	private int commentPraiseCount;
	private String userIconPath;
	private int commentReplyCount;
;


	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentPraiseCount() {
		return commentPraiseCount;
	}
	public void setCommentPraiseCount(int commentPraiseCount) {
		this.commentPraiseCount = commentPraiseCount;
	}
	public String getUserIconPath() {
		return userIconPath;
	}
	public void setUserIconPath(String userIconPath) {
		this.userIconPath = userIconPath;
	}
	public int getCommentReplyCount() {
		return commentReplyCount;
	}
	public void setCommentReplyCount(int commentReplyCount) {
		this.commentReplyCount = commentReplyCount;
	}
	
}
