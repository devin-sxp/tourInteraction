var news_center = {
	data:{
		
	},
	option:{
		getArticleRequestSubmitNews:function(){
			$.post(getRootPath()+"/article/getArticleRequestSubmitNews.do", {}, function(data, textStatus, req) {
				data = eval("("+data+")");
				console.log(data)
				$(".push-list").empty();
				var html=" <li><a><div class=\"all-push\"><i class=\"iconfont ic-requests\"></i></div><div class=\"name\">全部未处理请求</div></a></li>";
				$.each(data, function(i, articleRequest) {
					html=html+" <li><a href=\""+getRootPath()+"/page/articleNews?articleId="+articleRequest.requestArticleId+"\">"+
					"<div class=\"avatar-collection\">"+
					"<img style=\"width: 48px;height:48px\" src=\""+getRootPath()+articleRequest.filePath+"\">"+
					"</div><div class=\"name\">"+articleRequest.articleName+"</div>"+
					"</a><button class=\"btn-news pull-right btn btn-default\" onclick=\"news_center.option.dealArticleRequestSubmitNews("+
					articleRequest.id+",0,0,0)\">不通过</button>"+
					"<button class=\"btn-news pull-right btn btn-success\" onclick=\"news_center.option.dealArticleRequestSubmitNews("+
					articleRequest.id+","+articleRequest.requestArticleId+","+articleRequest.requestSubjectId+",1)\">通过</button></li>"
					
				})
				$(".push-list").append(html);
			},'json')
		},
		dealArticleRequestSubmitNews:function(requestId,requestArticleId,requestSubjectId,isPass){
			$.post(getRootPath()+"/article/dealArticleRequestSubmitNews.do", {
				requestId:requestId,requestArticleId:requestArticleId,
				requestSubjectId:requestSubjectId,
				isPass:isPass
			}, function(data, textStatus, req) {
				if(textStatus == "success"){
					toastr.success(eval(data));
					news_center.option.getArticleRequestSubmitNews();
				}else{
					toastr.error(eval(data));
				}
			})
		}
	},
	init:{
		
	}
	
};
$(function () {
	news_center.option.getArticleRequestSubmitNews();
})