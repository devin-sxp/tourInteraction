/**
 * 
 */
var userId = $("#userId").val();
$(function() {
	newsId = getUrlParam("newsId");
	getNews(newsId);
	if(userId != null && userId != ""){
		addIntegration(2);
	}
});

/**
 * 获取news
 * @param condition
 */
var getNews = function(newsId) {

    $.ajax({
        url:"../interactionNews/getNewsById.do",
        type: 'post',
        data: {newsId:newsId},
        dataType: 'json',
        async:false,

        error: function (obj, msg) {
            //还得先清空所有行
            $("#tbody_interaction").empty();
            var txt = "没有查询到符合条件的信息!";
            toastr.error(txt);
            return;
        },
        complete: function () {

        },
        success: function (result) {
           console.log(result)
           result = eval("("+result+")");
            //清空已有记录
            $("#tbody_interaction").empty();
            var html_tr = appendInteractionNewsNode(result);
            $("#tbody_interaction").append(html_tr);
        
            getInteractionComment(result.id);

        }
    });
};

/**
 * 获取评论
 * @param condition
 */
var getInteractionComment = function(newsId) {

    $.ajax({
        url:"../interactionComment/getCommentByNewsId.do",
        type: 'post',
        data: {newsId:newsId},
        dataType: 'json',
        async:false,
        error: function (obj, msg) {
            var txt = "没有查询到符合条件的信息!";
            toastr.error(txt);
            return;
        },
        complete: function () {

        },
        success: function (result) {
        	result = eval("("+result+")");
            $.each(result.list, function (objIndex, interactionComment) {
                var html_tr = appendInteractionCommentNode(interactionComment);
         
                getInteractionReply(interactionComment.id,html_tr,interactionComment);

            });

        }
    });
};

/**
 * 获取回复
 * @param condition
 */
var getInteractionReply = function(commentId,htmlComment,interactionComment) {
    $("#tbody_interaction").append(htmlComment);
    var html_reply="";
    $.ajax({
        url:"../interactionComment/getReplyByCommentId.do",
        type: 'post',
        data: {commentId:commentId},
        dataType: 'json',
        async:false,
        error: function (obj, msg) {
 
            var txt = "没有查询到符合条件的信息!";
            toastr.error(txt);
            return;
        },
        complete: function () {
            var htmlAll = html_reply + "</div></td>" +
                "<button type=\"button\" class=\"btn btn-link blue reply\" style=\"color:indigo;\" onclick=\"javascript:void(0);\">回复</button>" +
                "<input type=\"hidden\" name=\"comment_id\" value=\""+interactionComment.id+"\">"+
                "<input type=\"hidden\" name=\"target_user_id\" value=\""+interactionComment.createUser+"\">";
            $("#tbody_interaction").append(htmlAll);
        },
        success: function (result) {
        	result = eval("("+result+")");
            $.each(result.list, function (objIndex, InteractionReply) {
                var html_tr = appendInteractionReplyNode(InteractionReply);
                html_reply=html_reply+html_tr
            });
        }
    });
};

/**
 * 回复和评论
 * @type {null}
 */
var news_id=null;
var comment_id=null;
var replyuser_id=null;
var target_user_id =null;
$(".reply").live('click',function () {
	if(userId == null || userId =="" ){
		toastr.warning("请先登录！");
		return;
	}
    editor.$txt.html('<p><br></p>');
    var title = $('.wangEditor-txt'); //根据class获取元素
    title.bind('keyup', function(e) {  //绑定设置 获取焦点 事件
        if($(e.target).html().length>=500){       //判断节点内html>500
            var t = editor.$txt.html().substring(0,500);
            editor.$txt.html(t);
        }
    });
    news_id=null;
    comment_id=null;
    target_user_id=null;
    news_id =  $(this).nextAll("input[name='news_id']").val();
    comment_id =  $(this).nextAll("input[name='comment_id']").val();
    target_user_id =  $(this).nextAll("input[name='target_user_id']").val();
    edit_text();
});

/**
 * 确定回复或评论
 */
$("#reply_sure").click(function () {
//获取富文本框内容
    var commentContent = editor.$txt.html();
    if(editor.$txt.html().length>=500){
        toastr.warning("输入内容过多！");
        editor.$txt.html(editor.$txt.html().substring(0,500));
        return;
    }
    if(isNull(commentContent)){
        toastr.warning('不能为空');
    }else {
        var condition={
            newsId:news_id,
            commentId:comment_id,
            targetUser:target_user_id,
            commentContent:commentContent
        };
        addCommentAndReply(condition);
        closepop();
//        var data = {
//            integration:"1"
//        };
//        data = JSON.stringify(data);
//        addIntegration(data);
    }
});

/**
 * 存入回复或评论
 * @param condition
 * @param knowledge_id
 */
var addCommentAndReply = function (condition) {
    $.ajax({
        url:"../interactionComment/addCommentAndReply.do" ,
        type:'post',
        async:true,
        data:condition,      
        dataType : 'html',
        error : function(obj, msg) {
            toastr.error("回复出现了问题");
            return;
        },
        complete : function() {
        	newsId = getUrlParam("newsId");
        	getNews(newsId);
    		addIntegration(8);
        	
        },
        success : function(result) {       
        	console.log(result)
            return;

        }
    });
};

/**
 * 加积分
 * @param data
 */
var addIntegration =function (integration) {
    $.ajax({
        url: "../integration/addIntegration.do",
        type : 'post',
        data : {
            integration:integration
        },
        async: true,
        dataType : 'html',
        error : function(obj, msg) {
            return;
        },
        complete : function() {

        },
        success : function(result) {
            console.log(result)

        }
    });
};

/**
 * 信息节点
 * @param knowledgeInteractionKnowledge
 * @returns {string}
 */
var appendInteractionNewsNode = function (interactionNews) {
    var html_main = "<div class=\"panel-heading\"><h3 class=\"panel-title\"><span style=\"color: yellow;\">" + interactionNews.createUserName + "</span>&nbsp;发表于&nbsp;" + stampToStandard(interactionNews.createTime.time) +
        "</h3></div> <h3 align=\"center\">" + interactionNews.newsTitle + "</h3><div style='margin: 0 1% 0 1%;'>" + interactionNews.newsContent +
        "</div></div>" +
        "<button type=\"button\" class=\"btn btn-link blue reply\" style=\"color:indigo;\" onclick=\"javascript:void(0);\">评论</button>"+
        "<input type=\"hidden\" name=\"news_id\" value=\""+interactionNews.id+"\">";
  
    return html_main
};

/**
 * 评论节点
 * @param knowledgeInteraction
 * @returns {*}
 */
var appendInteractionCommentNode = function (interactionComment) {
    var html_comment=null;
        html_comment =
            "<tr><td style=\"vertical-align: top; text-align: left; \"><span style=\"color: red;\">"+interactionComment.createUserName+"</span>&nbsp; 评论于&nbsp; "+stampToStandard(interactionComment.createTime.time)+
            "</td></tr>" +
            "<tr><td colspan=\"2\" style=\"word-break: break-all;vertical-align: 20px; text-align: left; padding-left: 5px; padding-top: 10px; margin-left: 5px;\">"+
            "</span><p>"+interactionComment.commentContent+"</p><div style=\"margin-left:3%; margin-right: 20px\" data-1=\"5482918\" id=\"reply_area\">";

    return html_comment;
};

/**
 * 回复节点
 * @param knowledgeInteractionReply
 * @returns {string}
 */
var appendInteractionReplyNode = function (interactionReply) {
    var   html_reply=
                "<div style=\"width: 90%; background-color: #F7F7F7; border: 1px #d7d7d7 dotted; margin-left:5%\"> <div style=\"text-align: left; padding-top: 5px; padding-left: 5px; \">"+
                "<div style=\"font-size:13px \"> <p>@"+interactionReply.createUserName+" &nbsp;回复:&nbsp; @"+interactionReply.targetUserName+"</p>"+interactionReply.replyContent+"</div><div style=\"font-size:14px\">"+stampToStandard(interactionReply.createTime.time)+
                "<button type=\"button\" class=\"btn btn-link blue reply\" style=\"color:indigo;\" onclick=\"javascript:void(0);\">回复</button>"+
                "<input type=\"hidden\" name=\"comment_id\" value=\""+interactionReply.commentId+"\">"+
                "<input type=\"hidden\" name=\"target_user_id\" value=\""+interactionReply.createUser+"\">"+
                "<div style=\"float:right;\"></div></div></div></div>";

    return html_reply;
};

/**
 * 判断富文本编辑框输入字符串是否为空或者全部都是空格
 * @param str
 * @returns {boolean}
 */
function isNull( str ){
    if ( str == "<p><br></p>" ){
        return true;
    }
    var regu = "<p>[&nbsp; ]+</p>";
    var re = new RegExp(regu);
    return re.test(str);
}