var subject = {
	data:{
		subjectId:getUrlParam("sid"),
		currentPage:1,
		pagesize:15,
		authorCurrentPage:1,
		authorPagesize:10,
		isFlag:true,
		subjectCreateUserId:0
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
				subject.data.subjectCreateUserId = data.createUser;
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
		},
		getArticleAuthorBySubjectId:function(data){
			$.post(getRootPath()+"/article/getArticleAuthorBySubjectId.do", data, function(data, textStatus, req) {
				data = eval("("+data+")");
//				console.log(data)
				$("#p_author_name").text("共"+data.count+"位作者")
				if(data.list.length == 0){
					return toastr.info("没有更多了");
				}
				$.each(data.list, function(i, articleAuthor) {
					var html = "<li><a href=\""+articleAuthor.createUser+"\"" +
					"class=\"avatar\"><img src=\""+getRootPath()+articleAuthor.userIconPath+"\"></a> " +
							"<a href=\"\" target=\"_blank\""+
					"class=\"name\">"+articleAuthor.createUserName+"</a> " +
					"<span class=\"tag\">作者</span></li>";	
					$(".collection-editor").append(html);
				})
			},'json');
		},
		getNowUserArticle:function (limit,offset){

			$.post(getRootPath()+"/article/getNowUserArticle.do",{limit:limit,offset:offset}, function(data, textStatus, req) {
				if(textStatus == "success"){
					data = eval("("+data+")");
					console.log(data)
					$.each(data.list, function(objIndex, article) {
						if(article.subjectId == 0 || article.subjectId =='' || article.subjectId ==null){
							var html = "<li class=\"list-group-item\">"+
							"<label  class=\"checkbox-article\">"+
		            		"<input  type=\"checkbox\" value=\""+article.id+"\"> <span>"+article.articleName+"</span>"+
		       			 	"</label></li>"
							$("#ul_my_article").append(html);
						}
						
					})
					
				}else{
					toastr.error("获取文章失败！");
				}
			},'json')
		},
		requestSubmitArticle:function(submitArticleIds,subjectId,subjectCreateUserId){
			$.post(getRootPath()+"/articleSubject/requestSubmitArticle.do", {submitArticleIds:submitArticleIds,subjectId:subjectId,
				subjectCreateUserId:subjectCreateUserId}, function(data, textStatus, req) {
				if(textStatus == "success"){
					toastr.success(eval(data));

				}else{
					toastr.error(eval(data));

				}
			})
		}
	},
	init:function(){
		let pagesize = subject.data.pagesize;
		let currentPage = subject.data.currentPage;
		let authorCurrentPage = subject.data.authorCurrentPage;
		let authorPagesize = subject.data.authorPagesize;
		subject.option.getSubjectById(subject.data.subjectId);
		subject.option.getNowUserArticle('','');
		subject.option.getArticlesBySubjectId(subject.data.subjectId,(currentPage-1)*pagesize,pagesize);
		var data = {
			subjectId:subject.data.subjectId,
			limit:(authorCurrentPage-1)*authorCurrentPage,
			offset:authorPagesize
		}
		subject.option.getArticleAuthorBySubjectId(data);
		$(".load-more-btn").bind('click', function() {
			let nextPage = parseInt($(this).attr("data-next-page"))
			subject.option.getArticlesBySubjectId(subject.data.subjectId,(nextPage-1)*pagesize,pagesize);
			subject.data.currentPage = nextPage;
			$(this).attr("data-next-page",nextPage+1);
		})
		
		$("#load-more-author").bind('click', function() {
			let nextPage = parseInt($(this).attr("data-next-page"))
			var data = {
				subjectId:subject.data.subjectId,
				limit:(nextPage-1)*authorPagesize,
				offset:authorPagesize
			}
			subject.option.getArticleAuthorBySubjectId(data);
			subject.data.authorCurrentPage = nextPage;
			$(this).attr("data-next-page",nextPage+1);
		});
		
		$(".js-contribute-button").bind('click',function(){
			submitArticle();
		});
		
		$("#btn_submit_article_sure").on('click',function(){
			var submitArticleIds = new Array();
			$.each($("input[type=checkbox]:checked"), function(i, elt) {
				submitArticleIds.push($(this).val());
			});
			if(submitArticleIds.length <= 0){
				toastr.info("请选择投稿文章!");
				return
			}
			subject.option.requestSubmitArticle(submitArticleIds,subject.data.subjectId,subject.data.subjectCreateUserId);
			submitArticleIds = [];
			closepop();
		});
	}
}
$(function(){
	subject.init();
});