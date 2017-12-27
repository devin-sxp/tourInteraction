var userId = $("#userId").val();
var lookUserId = parseInt(getUrlParam("lookUserId").trim());
var articleWordsCount = 0;
var page = 0;
var getCount = 5;
var articleCount = 0;
$(function() {
	if (lookUserId == null || isNaN(lookUserId)){
		return;
	}
	getUserArticleCount(lookUserId);
	getUserArticle(page*getCount,getCount,lookUserId);
	getSubjectsByUserId(lookUserId);
	getUserData(lookUserId);
});

var getUserData =  function (lookUserId){

    $.post(getRootPath()+"/userManage/getUserById.do",{userId:lookUserId}, function(data, textStatus, req) {
        if(textStatus == "success"){
            data = eval("("+data+")");
            console.log(data)
            $(".js-intro").text(data.userDescription);
            $("#a_create_user_name").text(data.createUserName).attr('href',getRootPath()+"/page/otherUserPage?lookUserId="+data.id);
            $("#i_user_icon").attr('src',getRootPath()+data.userIconPath).parent().attr("href",getRootPath()+"/page/otherUserPage?lookUserId="+data.id);

        }else{
            toastr.error("用户数据失败！");
        }
    },'json')
};

var getUserArticleCount =  function (lookUserId){

	$.post(getRootPath()+"/article/getNowUserArticleCount.do",{lookUserId:lookUserId}, function(data, textStatus, req) {
		if(textStatus == "success"){
			articleCount = eval(data);
			$("#my_article_count").text(articleCount);
		}else{
			toastr.error("获取文章数量失败！请稍后重试！");
		}
	})
};

var getUserArticle =  function (limit,offset,lookUserId){

	$.post(getRootPath()+"/article/getNowUserArticle.do",{limit:limit,offset:offset,lookUserId:lookUserId}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval("("+data+")");
			// console.log(data)
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

var getSubjectsByUserId = function(lookUserId){
	$.post(getRootPath()+"/articleSubject/getSubjectsByUserId.do",{userId:lookUserId}, function(data, textStatus, req) {
		data = eval(data);
		$.each(data, function(objIndex, subject) {
			var html = "<li>"+
					"<a href=\""+getRootPath()+"/page/subject?sid="+subject.id+"\" target=\"_blank\" class=\"avatar-collection\">"+
					"<img style=\"width:32px;height:32px;\" src=\""+getRootPath()+subject.subjectIconPath+"\">"+
					"</a><a href=\""+getRootPath()+"/page/subject?sid="+subject.id+"\" target=\"_blank\" class=\"name\">"+subject.subjectTitle+"</a></li>";
			$(".my_subject_list").append(html);
		})
	},'json');
};

$(".load-more").on('click',function(){
    page++;
    var activedId = 0;
    $(".trigger-menu li").each(function () {
        if($(this).attr("class") != null && $(this).attr("class") != ""){
            activedId = $(this).attr("id");
            return;
        }
    });
    if(activedId == "li_user_article"){
        if(page*getCount > articleCount){
            toastr.info("没有更多了");
            return;
        }
        getUserArticle(page*getCount,getCount,lookUserId);
    }else if(activedId == "li_liked_article"){
        var data = {limit:page*getCount,offset:getCount,userId:lookUserId};
        getLovedArticles(data);
    }
});

var getLovedArticles = function (data) {
    $.post(getRootPath()+"/article/getLovedArticles.do", data, function(data, textStatus, req) {
        if(textStatus =='success'){
            data = eval("("+data+")");
            console.log(data);
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
        }
    },'json');
}

$("#li_liked_article").click(function () {
    $(".note-list").empty();
    page=0;
    var data = {limit:0,offset:getCount,userId:lookUserId};
    getLovedArticles(data);
});

$("#li_user_article").click(function () {
    $(".note-list").empty();
    page=0;
    getUserArticle(page*getCount,getCount,lookUserId);
});

$("#a_my_liked_article").click(function () {
    $(".trigger-menu li").each(function () {
        $(this).removeClass("active")
    });
    $("#li_liked_article").addClass("active")
    $(".note-list").empty();
    page=0;
    var data = {limit:0,offset:getCount,userId:lookUserId};
    getLovedArticles(data);
})

