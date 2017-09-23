var articleWordsCount = 0;
var page = 0;
var getCount = 5;
var articleCount = 0;
$(function() {
	getNowUserArticleCount();
	getNowUserArticle(page*getCount,getCount);
})


var getNowUserArticleCount =  function (){

	$.post(getRootPath()+"/article/getNowUserArticleCount.do", function(data, textStatus, req) {
		if(textStatus == "success"){
			articleCount = eval(data);
			$("#my_article_count").text(articleCount);
		}else{
			toastr.error("获取文章数量失败！请稍后重试！");
		}
	})
};

var getNowUserArticle =  function (limit,offset){

	$.post(getRootPath()+"/article/getNowUserArticle.do",{limit:limit,offset:offset}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval("("+data+")");
			console.log(data)
			$.each(data.list, function(objIndex, article) {
				var html = "<li><div class=\"content\"><div class=\"author\">"+
						   "<span class=\"time\">"+stampToStandard(article.createTime.time)+"</span></div>"+
						   "<a class=\"title\" target=\"_blank\" href=\""+getRootPath()+"/page/articleNews?articleId="+ article.id +"\">"+article.articleName.replace(/<[^>]+>/g,"")+"</a>"+
						   "<div class=\"abstract txt-limit-2\">"+article.articleContent.replace(/<[^>]+>/g,"")+"</div>"+
						   "<div class=\"meta\"><a><i class=\"iconfont ic-list-read\"></i>"+article.articleLookCount+
						   "</a><a><i class=\"iconfont ic-list-comments\"></i>"+article.articleCommentCount+
						   "</a><span><i class=\"iconfont ic-list-like\"></i>"+article.articleLoveCount+
						   "</span></div></div></li>"
				$(".note-list").append(html);
				articleWordsCount = articleWordsCount + article.articleName.replace(/<[^>]+>/g,"").length + article.articleContent.replace(/<[^>]+>/g,"").length;
			})
			$("#my_article_words_count").text(articleWordsCount);
		}else{
			toastr.error("获取文章失败！请稍后重试！");
		}
	},'json')
};

$(".load-more").on('click',function(){
	page++;
	if(page*getCount > articleCount){
		toastr.info("没有更多了");
		return;
	}
	getNowUserArticle(page*getCount,getCount);
})



