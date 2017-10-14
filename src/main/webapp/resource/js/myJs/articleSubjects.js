var article_subjects = {
	data:{
		currentPage:1,
		pagesize:15
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
						"</a><a class=\"btn btn-success follow\"><i"+
						"class=\"iconfont ic-follow\"></i><span>投稿</span></a>"+
						"<hr><div class=\"count\">创建者 · <a>"+
						subject.createUserName+"</a></div></div></div>"
					$("#list-container").append(html);
				})
			},'json');
		}
	},
	init:function(){
		let pagesize = article_subjects.data.pagesize;
		let currentPage = article_subjects.data.currentPage;
		article_subjects.option.getSubjects((currentPage-1)*pagesize,pagesize);
		$(".load-more-btn").bind('click', function() {
			let nextPage = $(this).attr("data-next-page")
			article_subjects.option.getSubjects((nextPage-1)*pagesize,pagesize);
			article_subjects.data.currentPage = nextPage;
			$(this).attr("data-next-page",parseInt(nextPage)+1);
		})
	}
}
$(function(){
	article_subjects.init();
});