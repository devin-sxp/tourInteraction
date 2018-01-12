<%@page import="com.tourInteraction.entity.User"%>
<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>文章</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- //Custom Theme files -->
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/web.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/entry.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/jquery-emoji/jquery.emoji.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/jquery-emoji/jquery.mCustomScrollbar.min.css">

<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#li_article").addClass("active");

		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto',
			fit : true
		});
	});

    addEventListener("load", function() {
        setTimeout(goToPosition, 0);
    }, false);
    function goToPosition(){
        //如果需要跳到位置就跳到指定位置
        let position = getUrlParam("position").trim();
//        if(position != undefined && position != null && position != "" && location.hash == ""){
//                location.hash=position;
//        };
        if(position != undefined && position != null && position != ""){
            document.getElementById(position).scrollIntoView(true);
        };
    }
</script>

</head>
<body class="reader-black-font">

	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--//header-->

	<!-- banner -->
	<jsp:include page="common/banner.jsp"></jsp:include>
	<!-- banner -->

	<!-- banner-bottom -->
	<div class="banner-bottom" style="padding: 1em 0 0 0">
		<!-- container -->
		<div class="note">
			<div class="post">
				<div class="article">
					<h1 id="h_article_title" class="title" style="margin: 30px 0 40px;">《耕堂读书记》</h1>

					<!-- 文章内容 -->
					<div id="div_article_content" data-note-content=""
						class="show-content">
						<div class="image-package">
							<img id="img_article_icon" src=""
								style="cursor: zoom-in;width:50%"><br>
							<div class="image-caption">图片来自tourInteraction</div>
						</div>

					</div>
					<!--  -->

					<div class="show-foot">
						<a class="notebook" href="http://www.jianshu.com/nb/5588115">
							<i class="iconfont ic-search-notebook"></i> <span>书评</span>
						</a>
						<div class="copyright" data-toggle="tooltip" data-html="true"
							data-original-title="转载请联系作者获得授权，并标注“tour作者”。">© 著作权归作者所有</div>
						<div class="modal-wrap" data-report-note="">
							<a id="report-modal">举报文章</a>
						</div>
					</div>
				</div>

				<!-- 文章底部作者信息 -->
				<div class="follow-detail">
					<div class="info">
						<a class="avatar" href="http://www.jianshu.com/u/74307f7c1d61">
							<img id="i_user_icon" src="" alt="96">
						</a> <a class="btn btn-success follow"><i
							class="iconfont ic-follow"></i><span>关注</span></a> <a
							id="a_create_user_name" class="title" href=""></a> <span
							class="tag">签约作者</span>
						<p>写了 207145 字，被 15203 人关注，获得了 4162 个喜欢</p>
					</div>
					<div class="signature">
						文字爱好者。喜欢简单的生活，随心所欲的写作。我已委托“维权骑士”进行维权行动。</div>
				</div>

				<div class="support-author">
					<p>如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作！</p>
					<div class="btn btn-pay">赞赏支持</div>
					<div class="supporter">
						<ul class="support-list">
							<li><a target="_blank"
								href="http://www.jianshu.com/u/3af883c062b8" class="avatar"><img
									src="./2.jpg"></a></li>
							<li><a target="_blank"
								href="http://www.jianshu.com/u/52a83ed92114" class="avatar"><img
									src="./1.jpg"></a></li>
							<li><a target="_blank"
								href="http://www.jianshu.com/u/d01b3920e685" class="avatar"><img
									src="./2.jpg"></a></li>
						</ul>
						<!---->
					</div>
					<!---->
					<!---->
				</div>

				<div class="meta-bottom">
					<div class="like">
						<div class="btn like-group">
							<div class="btn-like">
								<a><i id="i_icon_like" class="iconfont ic-like"></i>喜欢</a>
							</div>
							<div class="modal-wrap">
								<a id="a_love_text">0</a>
							</div>
						</div>
						<!---->
					</div>
					<div class="share-group">
						<a class="share-circle" data-action="weixin-share"
							data-toggle="tooltip" data-original-title="分享到微信"> <i
							class="iconfont ic-wechat"></i>
						</a> <a class="share-circle" data-action="weibo-share"
							data-toggle="tooltip" href="" data-original-title="分享到微博"> <i
							class="iconfont ic-weibo"></i>
						</a> <a class="share-circle" data-toggle="tooltip"> <i
							class="iconfont ic-picture"></i>
						</a> <a class="share-circle more-share" tabindex="0"
							>更多分享</a>
					</div>
				</div>
				<div>
					<div id="comment-list" class="comment-list">
						<div>
							<form class="new-comment">
								<a class="avatar"><img id="img-comment-user-icon"
									src=""></a>
								<textarea id="textarea_content" name="textarea_content" placeholder="写下你的评论..."></textarea>
								<div class="write-function-block hidden">
									<div class="emoji-modal-wrap">
										<a class="emoji"> <i id="a-emoji"
											class="iconfont ic-comment-emotions"></i>
										</a>
									</div>
									<!-- <div class="hint">Ctrl+Return 发表</div> -->
									<a class="btn btn-send" id="a_comment_send">发送</a> <a class="cancel">取消</a>
								</div>
							</form>
						</div>
						<div id="normal-comment-list" class="normal-comment-list">
							<div>
								<div class="top">
									<span id="s_article_comment_count">未知评论</span> <a
										class="author-only">只看作者</a> <a class="close-btn"
										style="display: none;">关闭评论</a>
									<div class="pull-right">
										<a class="active sort-method" param-method="praiseCount">按被赞排序</a>
										<a class="sort-method" param-method="timeAsc">按时间正序</a>
										<a class="sort-method" param-method="timeDesc">按时间倒序</a>
									</div>
								</div>
							</div>
							<!---->
							<!---->
							<div id="comment-lists">
							</div>
							<a class="btn btn-danger load-more-btn" data-next-page="2" style="width: 10%;border-radius: 100px;">加载更多</a>						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->

	<!-- popular-grids -->
	<jsp:include page="common/popularPlace.jsp"></jsp:include>
	<!-- popular-grids -->

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- footer -->

	<script src="<%=contextPath%>/resource/js/jquery-emoji/jquery.emoji.js"></script>
	<script src="<%=contextPath%>/resource/js/jquery-emoji/jquery.mCustomScrollbar.min.js"></script>
	<script src="<%=contextPath%>/resource/js/jquery-emoji/jquery.mousewheel-3.0.6.min.js"></script>
	<script src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
	<script src="<%=contextPath%>/resource/js/common/emoji.js"></script>

	<script src="<%=contextPath%>/resource/js/myJs/articleNews.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
		
	<script type="text/javascript">
		if (isPhone()) {
			$(".note .post").css({
				'width' : "96%"
			})
		}
		
		<%User user = new User();
			user = (User) session.getAttribute("user");%>
	
	if("<%if (user != null)
				out.print(user.getUserName());%>".trim() != "" && "<%if (user != null)
				out.print(user.getUserName());%>".trim() != null) {

 		$("#img-comment-user-icon").attr('src','<%if (user != null) out.print(contextPath+user.getUserIconPath());%>'.trim());
 		
	}

	</script>
</body>
</html>