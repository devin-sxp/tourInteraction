
var fileuploadedId = "";
var userId = $("#userId").val();

var page = 0;
var getCount = 5;
var articleCount = 0;

$(function(){
	$(".note-list").empty();
	getArticleCount();
	getArticles(page*getCount,getCount);
	getRecommendSubjects();
});
let getArticleCount = ()=> {
	$.post(getRootPath()+"/article/getArticleCount.do", function(data, textStatus, req) {
		if(textStatus == "success"){
			articleCount = eval(data);
			console.log(data)
		}else{
			toastr.error("获取文章数量失败！请稍后重试！");
		}
	})
}

let getArticles = (limit,offset) => {
	$.post(getRootPath()+"/article/getArticles.do", {limit:limit,offset:offset}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval("("+data+")");
			console.log(data)
			$.each(data.list, function(objIndex, article) {
				var html = "<li class=\"have-img\">"+
						"<a class=\"wrap-img\" href=\"\" target=\"_blank\"> "+
						"<img class=\"img-blur-done\" src=\""+ getRootPath()+article.filePath +"\" alt=\"120\">"+
						"</a><div class=\"content\"><div class=\"author\"><a class=\"avatar\" target=\"_blank\" href=\"\">"+
						"<img src=\""+getRootPath()+article.userIconPath+"\" alt=\"64\">"+
						"</a><div class=\"name\"><a class=\"blue-link\" target=\"_blank\" href=\"\">"+article.createUserName+"</a>"+
						"<span class=\"time\" data-shared-at=\"2017-09-09T01:08:56+08:00\">"+stampToStandard(article.createTime.time)+"</span></div>"+
						"</div><a class=\"title\" target=\"_blank\" href=\""+getRootPath()+"/page/articleNews?articleId="+article.id+"\">"+article.articleName+"</a>"+
						"<p class=\"abstract txt-limit-3\">&nbsp;&nbsp;&nbsp;&nbsp;"+article.articleContent.replace(/<[^>]+>/g,"")+"</p>"+
						"<div class=\"meta\"><a class=\"collection-tag\" target=\"_blank\" href=\"\">"+article.subjectTitle+"</a>"+
						"<a target=\"_blank\" href=\"\"><i class=\"iconfont ic-list-read\"></i>"+article.articleLookCount+"</a>"+
						"<a target=\"_blank\" href=\"\"><i class=\"iconfont ic-list-comments\"></i>"+article.articleCommentCount+"</a>"+
						"<span><i class=\"iconfont ic-list-like\"></i> "+article.articleLoveCount+"</span>" +
						"<span><i class=\"iconfont ic-list-money\"></i>"+article.articleSupportCount+"</span></div></div></li>";
				$(".note-list").append(html);
			})
		}else{
			toastr.error("获取文章失败！请稍后重试！");
		}
	}, "json")
}


/**
 * 写文章
 */
$("#btn_write_article").click(function() {
	if(userId == null || userId =="" ){
		toastr.warning("请先登录！");
		return;
	}
	writeArticle();
	var uploadUrl = getRootPath() + "/fileManage/uploadFile.do";
	var data = {
		fileUse : 'article_subject_icon',
		inputFile : 'input_file' //input file标签的name值传到后台，用于后台获取file
	}
	upLoadFileInput("input_file", uploadUrl, data);
})

$("#btn_news_write_article_sure").on('click',function(){
	if(returnUploadedData != "" && returnUploadedData != null && returnUploadedData != "undefine"){
		fileuploadedId = returnUploadedData;
		console.log(fileuploadedId);
	}else{
		toastr.info("上传未完毕或返回数据为空");
		return;
	}
	
	var articleName = $("#input_article_title").val();
	var articleContent = editor.$txt.html();
	var articleIconId = fileuploadedId;
	
	$.post(getRootPath()+"/article/addArticle.do", {articleName:articleName,articleContent:articleContent,
		articleIconId:articleIconId}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval(data);
			toastr.success(data);
			closepop();
		}else{
			toastr.error(data);
		}
	})
})


$(".load-more").on('click',function(){
	page++;
	if(page*getCount > articleCount){
		toastr.info("没有更多了");
		return;
	}
	getArticles(page*getCount,getCount);
})

let getRecommendSubjects = function(){
	$.post(getRootPath()+"/articleSubject/getSubject.do", {offset:7,limit:0}, function(data, textStatus, req) {
		data = eval("("+data+")");
		$(".more-hot-collection").html(data.count+"个热门专题<i class=\"iconfont ic-link\"></i>");
		$.each(data.list, function(i, subject) {
			var html = "<a class=\"collection\""+
			"href=\""+getRootPath()+"/page/subject?sid="+subject.id+"\"><img src=\""+getRootPath()+subject.subjectIconPath+"\"alt=\"64\">" +
			"<div class=\"name\">"+subject.subjectTitle+"</div>";
			$(".recommend-collection").append(html);
		})
	},'json');
}

