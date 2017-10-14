var subject = {
	data:{
		subjectId:getUrlParam("sid"),
		currentPage:1,
		pagesize:15,
		isFlag:true
	},
	option:{
		getSubjectById:function(subjectId){
			$.post(getRootPath()+"/articleSubject/getSubjectById.do", {id:subjectId}, function(data, textStatus, req) {
				data = eval("("+data+")");
//				console.log(data)
				$("#img_subject_icon").attr("src",getRootPath()+ data.subjectIconPath);
				$("#a_subject_title").text(data.subjectTitle);
				$("#div_create_info").html("被<a style=\"color:#3444ee\">"+data.createUserName+"</a>创建于"+stampToStandard(data.createTime.time));
				$(".js-description").html(data.subjectDescription);
			},'json');
		},
		getArticlesBySubjectId:function(subjectId,limit,offset){
			$.post(getRootPath()+"/article/getArticlesBySubjectId.do", {subjectId:subjectId,limit:limit,
					offset:offset}, function(data, textStatus, req) {
				data = eval("("+data+")");
//				console.log(data)
				if(data.list.length == 0 && !subject.data.isFlag){
					return toastr.info("没有更多了")
				}
				if(subject.data.isFlag){
					$("#div_create_info").append("&nbsp;&nbsp;共"+data.count+"篇")
					subject.data.isFlag = false;
				}
				$.each(data.list, function(i, article) {
					var html = "<li><div class=\"content\"><div class=\"author\">"+
								"<a class=\"avatar\"><img src=\""+getRootPath()+article.userIconPath+"\"alt=\"64\"></a>"+
								"<div class=\"name\"><a class=\"blue-link\">"+article.createUserName+"</a>"+
							   "<span class=\"time\">"+stampToStandard(article.createTime.time)+"</span></div></div>"+
							   "<a class=\"title\" target=\"_blank\" href=\""+getRootPath()+"/page/articleNews?articleId="+ article.id +"\">"+article.articleName.replace(/<[^>]+>/g,"")+"</a>"+
							   "<div class=\"abstract txt-limit-2\">"+article.articleContent.replace(/<[^>]+>/g,"")+"</div>"+
							   "<div class=\"meta\"><a><i class=\"iconfont ic-list-read\"></i>"+article.articleLookCount+
							   "</a><a><i class=\"iconfont ic-list-comments\"></i>"+article.articleCommentCount+
							   "</a><span><i class=\"iconfont ic-list-like\"></i>"+article.articleLoveCount+
							   "</span></div></div></li>"
					$(".note-list").append(html);
				})
			},'json');
		}
	},
	init:function(){
		let pagesize = subject.data.pagesize;
		let currentPage = subject.data.currentPage;
		subject.option.getSubjectById(subject.data.subjectId);
		subject.option.getArticlesBySubjectId(subject.data.subjectId,(currentPage-1)*pagesize,pagesize);
		
		$(".load-more-btn").bind('click', function() {
			let nextPage = $(this).attr("data-next-page")
			subject.option.getArticlesBySubjectId(subject.data.subjectId,(nextPage-1)*pagesize,pagesize);
			subject.data.currentPage = nextPage;
			$(this).attr("data-next-page",parseInt(nextPage)+1);
		})
	}
}
$(function(){
	subject.init();
});