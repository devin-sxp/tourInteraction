let articleId = getUrlParam("articleId");
let getArticles = (articleId) => {
	$.post(getRootPath()+"/article/getArticleById.do", {articleId:articleId}, function(data, textStatus, req) {
		data = eval("("+ data +")")
		$("#h_article_title").text(data.articleName);
		$("#img_article_icon").attr("src", getRootPath()+data.filePath);
		$("#div_article_content").append(data.articleContent);
		$("#a_create_user_name").text(data.createUserName);
		$("#i_user_icon").attr('src',getRootPath()+data.userIconPath);
		$("#s_article_comment_count").text(data.articleCommentCount+"条评论")
	}, "json")
}

(()=>{
	getArticles(articleId);
})()

