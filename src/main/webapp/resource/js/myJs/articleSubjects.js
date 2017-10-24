var article_subjects = {
	data:{
		currentPage:1,
		pagesize:15,
		subjectId:0,
		subjectCreateUserId:0
	},
	option:{
		getSubjects:function(limit,offset){
			$.post(getRootPath()+"/articleSubject/getSubject.do", {offset:offset,limit:limit}, function(data, textStatus, req) {
				data = eval("("+data+")");
				console.log(data)
				if(data.list.length == 0){
					return toastr.info("没有更多了");
				}
				$.each(data.list, function(i, subject) {
					var html = "<div class=\"col-xs-8\">"+
						"<div class=\"collection-wrap\">"+
						"<a target=\"_blank\" href=\""+getRootPath()+"/page/subject?sid="+subject.id+"\">"+
						"<img class=\"avatar-collection\""+
						"src=\""+getRootPath()+subject.subjectIconPath+"\" alt=\"img\">"+
						"<h4 class=\"name\">"+subject.subjectTitle+"</h4>"+
						"<p class=\"collection-description\">"+subject.subjectDescription+"</p>"+
						"</a><a class=\"btn btn-success follow btn-request-submit\"><i"+
						"class=\"iconfont ic-follow\"></i><span>投稿</span></a>"+
						"<input type='hidden' value='"+subject.id+"'>"+
						"<input type='hidden' value='"+subject.createUser+"'>"+
						"<hr><div class=\"count\">创建者 · <a>"+
						subject.createUserName+"</a></div></div></div>"
					$("#list-container").append(html);
				})
				
				$(".btn-request-submit").bind('click',function(){
					submitArticle();
					article_subjects.data.subjectId = $(this).next().val();
					article_subjects.data.subjectCreateUserId = $(this).next().next().val();
				});
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
		let pagesize = article_subjects.data.pagesize;
		let currentPage = article_subjects.data.currentPage;
		article_subjects.option.getSubjects((currentPage-1)*pagesize,pagesize);
		article_subjects.option.getNowUserArticle('','');
		$(".load-more-btn").bind('click', function() {
			let nextPage = $(this).attr("data-next-page")
			article_subjects.option.getSubjects((nextPage-1)*pagesize,pagesize);
			article_subjects.data.currentPage = nextPage;
			$(this).attr("data-next-page",parseInt(nextPage)+1);
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
			var subjectId = article_subjects.data.subjectId;
			var subjectCreateUserId = article_subjects.data.subjectCreateUserId;
			article_subjects.option.requestSubmitArticle(submitArticleIds,subjectId,subjectCreateUserId);
			submitArticleIds = [];
			closepop();
		});
	}
}
$(function(){
	article_subjects.init();
});