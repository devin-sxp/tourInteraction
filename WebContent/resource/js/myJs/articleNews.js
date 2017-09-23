let articleId = getUrlParam("articleId");
var getArticles = (articleId) => {
	$.post(getRootPath()+"/article/getArticleById.do", {articleId:articleId}, function(data, textStatus, req) {
		data = eval("("+ data +")")
		$("#h_article_title").text(data.articleName);
		$("#img_article_icon").attr("src", getRootPath()+data.filePath);
		$("#div_article_content").append(data.articleContent);
	}, "json")
}

(()=>{
	getArticles(articleId);
})()

