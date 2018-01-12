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
					
				});
				$(".push-list").append(html);
				if(data.length>0){
                    $("#a_request").append("<div class=\"nav-noti-counter-2 nav-noti-counter-red\">"+data.length+"</div> ")
                }
			},'json')
		},
        getMessageRemind:function (condition) {
            $.post(getRootPath()+"/messageRemind/getMessageRemind.do",condition,function (data,status) {
                data = eval("("+data+")");
                $.each(data.count,function (index,obj) {
                    if(obj.type == "article"){
                        $("#a_article").append(" <div class=\"nav-noti-counter-2 nav-noti-counter-red\">"+obj.count+"</div> ");
                    }else if(obj.type == "news"){
                        $("#a_news").append(" <div class=\"nav-noti-counter-2 nav-noti-counter-red\">"+obj.count+"</div> ");
                    }
                });

                $.each(data.list,function (index,obj) {

                    if(obj.type == "article"){
                        var html = "<li class=\"\">" +
                            "<a href=\""+getRootPath()+"/page/otherUserPage?lookUserId="+obj.createUser+"\" class=\"avatar\">" +
                            "<img src=\""+getRootPath()+obj.userIconPath+"\">" +
                            "</a> <div class=\"info\"><div><a class=\"user\" href=\""+getRootPath()+"/page/otherUserPage?lookUserId="+obj.createUser+"\">"+obj.createUserName+"</a>" +
                            "<span class=\"comment-slogan\">在 </span><a href=\""+getRootPath()+"/page/articleNews?articleId="+obj.remindLinkId+"\">"+obj.remindLinkTitle+"</a>" +
                            "<span class=\"comment-slogan\">中回复了你</span></div> <div class=\"time\">"+stampToStandard(obj.createTime.time)+"</div></div>" +
							"<div class=\"meta\">" +
                            "    <a class=\"function-btn\" onclick='"+news_center.option.delMessageRemind(obj.id)+"'>" +
                            "        <i class=\"iconfont ic-delete\"></i>" +
                            "        <span>删除</span>" +
                            "    </a>" +
                            "    <a href=\""+getRootPath()+"/page/articleNews?articleId="+obj.remindLinkId+"&position="+obj.remindPosition+"\" class=\"function-btn\">" +
                            "        <i class=\"iconfont ic-go\"></i>" +
                            "        <span>查看对话</span>" +
                            "    </a> " +
                            "</div>"+
                            "</li>";
                        $("#ul_article_list").append(html);
                    }else if(obj.type == "news"){
                        var html = "<li class=\"\">" +
                            "<a href=\""+getRootPath()+"/page/otherUserPage?lookUserId="+obj.createUser+"\" class=\"avatar\">" +
                            "<img src=\""+getRootPath()+obj.userIconPath+"\">" +
                            "</a> <div class=\"info\"><div><a class=\"user\" href=\""+getRootPath()+"/page/otherUserPage?lookUserId="+obj.createUser+"\">"+obj.createUserName+"</a>" +
                            "<span class=\"comment-slogan\">在 </span><a href=\""+getRootPath()+"/page/interactionComment?newsId="+obj.remindLinkId+"\">"+obj.remindLinkTitle+"</a>" +
                            "<span class=\"comment-slogan\">中回复了你</span></div> <div class=\"time\">"+stampToStandard(obj.createTime.time)+"</div></div>" +
							"<div class=\"meta\">" +
                            "    <a class=\"function-btn\" onclick='news_center.option.delMessageRemind("+obj.id+")'>" +
                            "        <i class=\"iconfont ic-delete\"></i>" +
                            "        <span>删除</span>" +
                            "    </a>" +
                            "    <a href=\""+getRootPath()+"/page/interactionComment?newsId="+obj.remindLinkId+"&position="+obj.remindPosition+"\" class=\"function-btn\">" +
                            "        <i class=\"iconfont ic-go\"></i>" +
                            "        <span>查看对话</span>" +
                            "    </a> " +
                            "</div>"+
                            "</li>";
                        $("#ul_news_list").append(html);
                    }
                });
                console.log(data);
            },'json')
        },
		delMessageRemind:function (messageRemindId) {
			$.post(getRootPath()+"/messageRemind/delMessageRemind.do",{messageRemindId:messageRemindId},function (data,status) {
				data = eval(data);
				if(data == "success"){
					toastr.success("删除成功！");
					location.reload();
				}else {
					toastr.error("删除失败，请稍后再试！")
				}
            })
        },
		dealArticleRequestSubmitNews:function(requestId,requestArticleId,requestSubjectId,isPass){
			$.post(getRootPath()+"/article/dealArticleRequestSubmitNews.do", {
				requestId:requestId,requestArticleId:requestArticleId,
				requestSubjectId:requestSubjectId,
				isPass:isPass
			}, function(data, textStatus, req) {
				if(textStatus == "success"){
					toastr.success(eval(data));
					location.reload();
					// news_center.option.getArticleRequestSubmitNews();
				}else{
					toastr.error(eval(data));
				}
			})
		},
		loadClickEvent:function () {
			$("#ul_type_choice li").each(function () {
				$(this).click(function () {
                    $("#ul_type_choice li").each(function () {
                    	$(this).removeClass("active");
					});
                    $(this).addClass("active");
                    var showItem = $(this).attr("param");
                    $("#div_right_detail > div").each(function () {
						if($(this).attr("param") == showItem){
							$(this).removeClass("hidden");
						}else {
							$(this).addClass("hidden")
						}
                    })
                })
            });
        }
	},
	init:{
		method:function () {
            news_center.option.getArticleRequestSubmitNews();
            var condition = {
                limit:0,
                offset:999
            };
            news_center.option.getMessageRemind(condition);
            news_center.option.loadClickEvent();
        }
	}
	
};
$(function () {
	news_center.init.method();
});