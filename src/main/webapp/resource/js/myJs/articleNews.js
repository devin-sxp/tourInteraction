let articleId = getUrlParam("articleId");
let userId = $("#userId").val();
let articleCreateUserId = 0;
let currentPage = 1;
let pageSize = 6;
let CommentGetMethod = "praiseCount";
let isLookAuthor = false;

let replyHtml = "<div><form class=\"new-comment\">" +
    "<textarea id=\"textarea_reply_content\" name=\"textarea_reply_content\" placeholder=\"写下你的评论...\"></textarea>" +
    "<div class=\"write-function-block\">" +
    "<div class=\"emoji-modal-wrap\">" +
    "<a class=\"emoji\">" +
    "<i id=\"a-reply-emoji\" class=\"iconfont ic-comment-emotions\"></i>" +
    "</a> </div> <div class=\"hint\">Ctrl+Return 发表</div> " +
    "<a class=\"btn btn-send\">发送</a> <a class=\"cancel\" " +
    "onclick=\"$(this).parent().parent().parent().remove();\">取消</a></div></form> </div>";
/**
 * 获取文章
 */
let getArticles = (articleId) => {
    $.post(getRootPath()+"/article/getArticleById.do", {articleId:articleId}, function(data, textStatus, req) {
        data = eval("("+ data +")");
        // console.log(data);
        $("title").append("--"+data.articleName);
        $("#h_article_title").text(data.articleName);
        $("#input_hide_article_id").val(data.id);
        $("#img_article_icon").attr("src", getRootPath()+data.filePath);
        $("#div_article_content").append(data.articleContent);
        $("#a_create_user_name").text(data.createUserName).attr('href',getRootPath()+"/page/otherUserPage?lookUserId="+data.createUser);
        $("#i_user_icon").attr('src',getRootPath()+data.userIconPath).parent().attr("href",getRootPath()+"/page/otherUserPage?lookUserId="+data.createUser);
        $("#a_love_text").text(data.articleLoveCount).parent().parent().on('click',function(){
            var condition = {
                articleId:articleId
            };
            var $target = $("#i_icon_like");
            $.post(getRootPath()+"/article/loveArticle.do",condition,function (loveData,status) {
                loveData = eval("("+loveData+")");

                if(loveData.status == 'success'){
                    toastr.success(loveData.result);
                    if(loveData.type == 'cancer_love'){
                        $target.removeClass("ic-like-active");
                        $target.addClass("ic-like");

                        $("#a_love_text").text(parseInt($("#a_love_text").text().trim())-1);
                    }else{
                        $target.removeClass("ic-like");
                        $target.addClass("ic-like-active");
                        $("#a_love_text").text(parseInt($("#a_love_text").text().trim())+1);

                    }
                }else{
                    toastr.error(loveData.result);
                }
            },'json');
        });
        articleCreateUserId = data.createUser;
    }, "json")
}

/**
 * 增加评论
 */
let addArticleComment = function(data){
    $.post(getRootPath()+"/articleCommentAndReply/addArticleComment.do", data, function(data, textStatus, req) {
        if(textStatus == "success"){
            toastr.success(eval(data));
            $("#textarea_content").val("");
            currentPage = 1;
            var data = {
                limit:(currentPage-1)*pageSize,
                offset:currentPage*pageSize,
                getMethod:CommentGetMethod,
                articleId:articleId
            };
            getArticleComments(data,isLookAuthor);

        }else{
            toastr.error(eval(data));
        }
    })
}

/**
 * 获取评论
 */
let getArticleComments = function(data1,isLookAuthor){
    $.post(getRootPath()+"/articleCommentAndReply/getArticleComments.do", data1, function(data, textStatus, req) {
        if(textStatus == "success"){
            data = eval("("+data+")")
            // console.log(data);
            $("#s_article_comment_count").text(data.count+" 条评论");
            $("#comment-lists").empty();
            if(data1.loadMore == true){
                if (data.count < data1.offset){
                    toastr.info("评论加载完了");
                }
            }
            $.each(data.list, function(i, comment) {
                if(isLookAuthor == true){
                    if(articleCreateUserId == comment.createUser){
                        var html="<div class=\"comment\" param-id=\""+comment.id+"\">"+
                            "<div>"+
                            "<div class=\"author\">"+
                            "<a href=\""+comment.createUser+"\"	target=\"_blank\" class=\"avatar\"><img src=\""+getRootPath()+comment.userIconPath+"\"></a>"+
                            "<div class=\"info\">"+
                            "<a href=\"\" target=\"_blank\" class=\"name\">"+comment.createUserName+"</a> ";
                        if(articleCreateUserId == comment.createUser){
                            html = html+ "<span class=\"author-tag\">作者</span>"
                        }

                        html = html + "<div class=\"meta\"><span>"+(i+1)+"楼 · "+stampToStandard(comment.createTime.time)+"</span></div>"+
                            "</div>"+
                            "</div>"+
                            "<div class=\"comment-wrap\">"+
                            "<p>"+comment.commentContent+"</p>"+
                            "<div class=\"tool-group\">"+
                            "<a class=\"\"><i class=\"iconfont ic-zan\"></i> <span>"+comment.commentPraiseCount+"人赞</span></a>"+
                            "<a class=\"a-to-reply\" param-comment-id=\""+comment.id+"\" param-user-id=\""+comment.createUser+"\">" +
                            "<i class=\"iconfont ic-comment\"></i> <span>回复</span></a>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "<div class=\"sub-comment-list\">" +
                            "<div class=\"sub-comment more-comment\">" +
                            "<a class=\"add-comment-btn\" param-comment-id=\""+comment.id+"\" param-user-id=\""+comment.createUser+"\">" +
                            "<i class=\"iconfont ic-subcomment\"></i> <span>添加新评论</span></a>" +
                            "<span class=\"line-warp\"><b>有"+comment.commentReplyCount+"条回复</b><a is-expland=\"false\" param-comment-id=\""+comment.id+"\"> 展开</a></span></div></div>"+
                            "</div>";
                        $("#comment-lists").append(html);
                    }
                }else{
                    var html="<div id='article_comment_"+comment.id+"' class=\"comment\" param-id=\""+comment.id+"\">"+
                        "<div>"+
                        "<div class=\"author\">"+
                        "<a href=\""+comment.createUser+"\"	target=\"_blank\" class=\"avatar\"><img src=\""+getRootPath()+comment.userIconPath+"\"></a>"+
                        "<div class=\"info\">"+
                        "<a href=\"\" target=\"_blank\" class=\"name\">"+comment.createUserName+"</a> ";
                    if(articleCreateUserId == comment.createUser){
                        html = html+ "<span class=\"author-tag\">作者</span>"
                    }

                    html = html + "<div class=\"meta\"><span>"+(i+1)+"楼 · "+stampToStandard(comment.createTime.time)+"</span></div>"+
                        "</div>"+
                        "</div>"+
                        "<div class=\"comment-wrap\">"+
                        "<p>"+comment.commentContent+"</p>"+
                        "<div class=\"tool-group\">"+
                        "<a class=\"\"><i class=\"iconfont ic-zan\"></i> <span>"+comment.commentPraiseCount+"人赞</span></a>"+
                        "<a class=\"a-to-reply\" param-comment-id=\""+comment.id+"\" param-user-id=\""+comment.createUser+"\">" +
                        "<i class=\"iconfont ic-comment\"></i> <span>回复</span></a>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "<div class=\"sub-comment-list\">" +
                        "<div class=\"sub-comment more-comment\">" +
                        "<a class=\"add-comment-btn\" param-comment-id=\""+comment.id+"\" param-user-id=\""+comment.createUser+"\">" +
                        "<i class=\"iconfont ic-subcomment\"></i> <span>添加新评论</span></a>" +
                        "<span class=\"line-warp\"><b>有"+comment.commentReplyCount+"条回复</b><a is-expland=\"false\" param-comment-id=\""+comment.id+"\"> 展开</a></span></div></div>"+
                        "</div>";
                    $("#comment-lists").append(html);
                }

            });
            getArticleAfterLoad();

        }else{
            toastr.error("出错了");
        }
    },'json')
};
let getReply = function (condition,target,$position) {
    $.post(getRootPath()+"/articleCommentAndReply/getArticleReply.do",condition,function (data,status,req) {
        data = eval('('+data+')');
        console.log(data);
        $position.parent().children("div[item='reply']").remove();
        var html="";
        $.each(data.list,function (i,reply) {
            html = html + "<div item=\"reply\" class=\"sub-comment\">" +
                "<p>" +
                "<a href=\""+reply.createUser+"\"" +
                "target=\"_blank\">"+reply.createUserName+"</a>： <span> <a " +
                "href=\""+reply.targetUser+"\"" +
                ">@"+reply.targetUserName+"</a>: <p control=\"reply-emoji\">"+reply.replyContent +
                "</p></span>" +
                "</p>" +
                "<div class=\"sub-tool-group\">" +
                "<span>"+stampToStandard(reply.createTime.time)+"</span> <a class=\"\"><i" +
                "class=\"iconfont ic-comment\"></i> <span control=\"reply\" param-comment-id=\""+reply.commentId+
                "\" param-user-id=\""+reply.createUser+"\" param-user-name=\""+reply.createUserName+"\">回复</span></a>" +
                "</div>" +
                "</div>";
        });
        $position.before(html);
        parseEmoji("p[control='reply-emoji']");
        $("span[control='reply']").on("click",function () {
            var commentId = $(this).attr("param-comment-id");
            var targetUserId = $(this).attr("param-user-id");
            var targetUserName = $(this).attr("param-user-name");
            var $replyBtn = $(this).parents(".sub-comment-list").find(".line-warp a");
            var condition = {
                commentId:commentId,
                targetUserId:targetUserId,
                articleId:articleId
            };
            $(this).parents(".sub-comment-list").find("form").parent().remove();
            $(this).parents(".sub-comment-list").append(replyHtml);
            $(this).parents(".sub-comment-list").find("textarea").attr("placeHolder","@"+targetUserName+":")
            /**
             * 加载emoji表情
             */
            var $a_reply_emoji = $(this).parents(".sub-comment-list").find("#a-reply-emoji");
            $a_reply_emoji.on('click', function() {
                $a_reply_emoji.off();
                var $textarea_reply_content = $(this).parent().parent().parent().prev();
                var newId = "textarea_reply_content_"+new Date().getTime();
                $textarea_reply_content.attr("id",newId)
                loadEmoji("#"+newId,this);
            });

            var $replyCount = $(this).parents(".sub-comment-list").find(".more-comment b");
            var $btn_send = $(this).parents(".sub-comment-list").find(".btn-send");
            $btn_send.on('click', function () {
                if (userId == null || userId == "") {
                    toastr.warning("请先登录！");
                    return;
                }
                var $form = $(this).parent().parent();
                $form.ajaxSubmit({
                    type: "post",  //提交方式
                    dataType: "json", //数据类型
                    data: condition,
                    url: getRootPath() + "/articleCommentAndReply/addCommentReply.do", //请求url
                    success: function (data, status) { //提交成功的回调函数
                        toastr.success(data);
                        if (status == "success") {
                            //成功信息重置
                            $form.resetForm();
                        }
                        if(target == ""){
                            target = $replyBtn;
						}
                        target.attr("is-expland","false");
                        replyMain(target);
                    }
                });
                var replyCount = $replyCount.text().replace(/[^0-9]/ig,"");
                $replyCount.text("有"+(parseInt(replyCount)+1)+"条回复");
                $(this).parent().parent().parent().remove();
                return false; //不刷新页面
            });
        });
    },'json');

};
let replyMain = function ($this) {
    commentId = $this.attr("param-comment-id");
    $position = $this.parent().parent();
	if($this.attr("is-expland")=="false"){
        $this.attr("is-expland","true");
        $this.text("收起");
	}else{
        $this.attr("is-expland","false");
        $this.text("展开");
        $position.parent().children("div[item='reply']").remove();
        return
    }

    var condition = {
        commentId:commentId
    };
    getReply(condition,$this,$position);
};
let getArticleAfterLoad = function(){
    /**
     * 解析emoji表情
     */
    parseEmoji(".comment-wrap");

    /**
     * 增加赞
     */
    $(".ic-zan").on('click',function(){
        if(userId == null || userId ==""){
            toastr.warning("请先登录！");
            return;
        }
        var $this = $(this);
        $this.off();
        var commentId = $(this).parent().parent().parent().parent().parent().attr("param-id");
        $.post(getRootPath()+"/articleCommentAndReply/updateArticleComment.do", {commentId:commentId}, function(data, textStatus, req) {

            var praise = $this.next().text().replace(/[^0-9]/ig,"");
            $this.next().text((parseInt(praise)+1)+"人赞")
            $this.removeClass("ic-zan");
            $this.addClass("ic-zan-active");
        },'json');
    });

    /**
     * 显示回复框
     */
    $(".add-comment-btn").on('click', function() {
        var $this = $(this);
        $this.parent().next().remove();
        $this.parent().after(replyHtml);
        var $replyCount = $(this).next().find("b");
        var commentId = $(this).attr("param-comment-id");
        var targetUserId = $(this).attr("param-user-id");

        var condition = {
            commentId:commentId,
            targetUserId:targetUserId,
            articleId:articleId
        };

        /**
         * 加载emoji表情
         */
        var $a_reply_emoji = $(this).parent().parent().find("#a-reply-emoji");
        var $btn_send = $(this).parent().parent().find(".btn-send");
        $a_reply_emoji.on('click', function() {
            $a_reply_emoji.off();
            var $textarea_reply_content = $(this).parent().parent().parent().prev();
            var newId = "textarea_reply_content_"+new Date().getTime();
            $textarea_reply_content.attr("id",newId)
            loadEmoji("#"+newId,this);
        });

        $btn_send.on('click', function() {
            if(userId == null || userId ==""){
                toastr.warning("请先登录！");
                return;
            }
            var $form = $(this).parent().parent();
            $form.ajaxSubmit({
                type:"post",  //提交方式
                dataType:"json", //数据类型
                data:condition,
                url:getRootPath()+"/articleCommentAndReply/addCommentReply.do", //请求url
                success:function(data,status){ //提交成功的回调函数
                    toastr.success(data);
                    if (status == "success") {
                        //成功信息重置
                        $form.resetForm();
                    }
                    getReply(condition,'',$this.parent());
                }
            });
            var replyCount = $replyCount.text().replace(/[^0-9]/ig,"");
            $replyCount.text("有"+(parseInt(replyCount)+1)+"条回复");
            $this.parent().next().remove();

            return false; //不刷新页面
        });
    });

    $(".a-to-reply").on('click', function() {
        var $div = $(this).parents(".comment")
        $div.find(".more-comment").next().remove();
        $div.find(".more-comment").after(replyHtml);
        var $replyCount = $(this).parent().parent().parent().next().find("b");
        var commentId = $(this).attr("param-comment-id");
        var targetUserId = $(this).attr("param-user-id");
        var condition = {
            commentId:commentId,
            targetUserId:targetUserId,
            articleId:articleId
        };
        /**
         * 加载emoji表情
         */
        var $a_reply_emoji = $(this).parent().parent().parent().next().find("#a-reply-emoji");
        var $btn_send = $(this).parent().parent().parent().next().find(".btn-send");
        $a_reply_emoji.on('click', function() {
            $a_reply_emoji.off();
            var $textarea_reply_content = $(this).parent().parent().parent().prev();
            var newId = "textarea_reply_content_"+new Date().getTime();
            $textarea_reply_content.attr("id",newId)
            loadEmoji("#"+newId,this);
        });

        $btn_send.on('click', function() {
            if(userId == null || userId ==""){
                toastr.warning("请先登录！");
                return;
            }
            var $form = $(this).parent().parent();
            $form.ajaxSubmit({
                type:"post",  //提交方式
                dataType:"json", //数据类型
                data:condition,
                url:getRootPath()+"/articleCommentAndReply/addCommentReply.do", //请求url
                success:function(data,status){ //提交成功的回调函数
                    toastr.success(data);
                    if (status == "success") {
                        //成功信息重置
                        $form.resetForm();
                    }
                    getReply(condition,'',$div.find(".more-comment"));
                }
            });
            var replyCount = $replyCount.text().replace(/[^0-9]/ig,"");
            $replyCount.text("有"+(parseInt(replyCount)+1)+"条回复");
            $div.find(".more-comment").next().remove();
            return false; //不刷新页面
        });
    });

    $(".line-warp a").on("click",function () {
  		replyMain($(this));
    })
};

$("#textarea_content").focusin(function() {
    $(".write-function-block").removeClass("hidden");
});

/**
 * 加载emoji表情
 */
$("#a-emoji").bind('click', function() {
    $("#a-emoji").unbind();
    loadEmoji("#textarea_content",this);
})

/**
 * 取消排序
 */
$(".cancel").on('click',function(){
    $(".write-function-block").addClass("hidden");
    $("#textarea_content").val("");
});


/**
 * 发送文章评论
 */
$("#a_comment_send").on('click',function(){
    if(userId == null || userId ==""){
        toastr.warning("请先登录！");
        return;
    }
    if($("#textarea_content").val() == undefined || $("#textarea_content").val().trim() == ""){
        return toastr.warning("请输入内容！");
    }
    var data = {
        commentContent:$("#textarea_content").val(),
        articleId:articleId,
        articleCreateUserId:articleCreateUserId
    };
    addArticleComment(data);
});

/**
 * 排序方式
 */
$(".sort-method").on('click', function() {
    CommentGetMethod = $(this).attr("param-method");
    currentPage = 1;
    var data = {
        limit:(currentPage-1)*pageSize,
        offset:currentPage*pageSize,
        getMethod:CommentGetMethod,
        articleId:articleId
    }
    getArticleComments(data,isLookAuthor);
    $(".sort-method").removeClass("active");
    $(this).addClass("active");
});

/**
 * 只看作者/看所有
 */
$(".author-only").on('click', function() {
    if(isLookAuthor == false){
        isLookAuthor = true;
        $(this).text("看所有");
    }else{
        isLookAuthor = false;
        $(this).text("只看作者");

    }
    currentPage = 1;
    var data = {
        limit:(currentPage-1)*pageSize,
        offset:currentPage*pageSize,
        getMethod:CommentGetMethod,
        articleId:articleId
    };
    getArticleComments(data,isLookAuthor);
});

/**
 * 加载更多
 */
$(".load-more-btn").click(function () {
    currentPage = parseInt($(this).attr("data-next-page"))
    var data = {
        limit:0,
        offset:currentPage*pageSize,
        getMethod:CommentGetMethod,
        articleId:articleId,
        loadMore:true
    };
    getArticleComments(data,isLookAuthor);
    $(this).attr("data-next-page",currentPage+1)
});

/**
 * 浏览文章增加观看数
 */
let watchArticleAddCount = function (data) {
    $.post(getRootPath()+"/article/updateArticle.do",data,function (data,status) {

    },'json');
};

/**
 * 检查该文章是否已经喜欢
 */
let isLoveThisArticle = function (data) {
    $.post(getRootPath()+"/article/isLoveThisArticle.do",data,function (data,status) {
        if(data == "true"){
            $("#i_icon_like").removeClass("ic-like");
            $("#i_icon_like").addClass("ic-like-active");
        }
    });
};

$(()=>{
    getArticles(articleId);
	var data = {
		limit:(currentPage-1)*pageSize,
		offset:currentPage*pageSize,
		getMethod:CommentGetMethod,
		articleId:articleId
	};
	getArticleComments(data,isLookAuthor);

	var condition = {
        needArticleLookCountAdd:"true",
        articleId:articleId
    };
    watchArticleAddCount(condition);

    var condition1 = {
        articleId:articleId
    };
    isLoveThisArticle(condition1);

});

