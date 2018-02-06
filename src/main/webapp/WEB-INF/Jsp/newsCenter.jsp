<%@page import="com.tourInteraction.entity.User"%>
<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
	User user = new User();
	user = (User) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>消息中心</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- //Custom Theme files -->
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
	rel="stylesheet" media="all"/>
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all"/>
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/entry-news.css"/>
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#li_article").addClass("active");

		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>

<style type="text/css">
	.btn-news {
		margin-right:20px;
		width: 100px;
		margin: 5px;
	}
</style>
</head>
<body class="reader-black-font">

	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--//header-->

	<!-- banner-bottom -->
	<div class="banner-bottom" style="padding: 1em 0 0 0">
		<!-- container -->
		<div class="container notification">
		    <div class="row">
		        <div class="aside">
		            <ul id="ul_type_choice">
						<li class="active" param="requests">
							<a href="#requests" class="nav-noti-link" id="a_request"><i class="iconfont ic-requests"></i> <span>投稿请求</span>
                                <%--<div class="nav-noti-counter-2 nav-noti-counter-red">41</div> --%>
                            </a>
						</li>
						<li class="" param="chats">
							<a href="#chats" class="nav-noti-link" id="a_news"><i class="iconfont ic-comments"></i> <span>互动消息</span> <!----></a>
						</li>
		                <li class="" param="comments">
							<a href="#comments" class="nav-noti-link" id="a_article"><i class="iconfont ic-chats"></i> <span>知识消息</span> <!----></a>
						</li>
						<li class="" param="notify">
							<a href="#notify" class="nav-noti-link" id="a_notify"><i class="iconfont ic-info"></i> <span>系统通知</span> <!----></a>
						</li>
		                <li class="" param="likes">
							<a href="#likes" class="nav-noti-link"><i class="iconfont ic-likes"></i> <span>喜欢和赞</span> <!----></a>
						</li>
		                <li class="" param="follows">
							<a href="#follows" class="nav-noti-link"><i class="iconfont ic-follows"></i> <span>关注</span> <!----></a>
						</li>
		                <li class="" param="money">
							<a href="#money" class="nav-noti-link"><i class="iconfont ic-money"></i> <span>赞赏</span> <!----></a>
						</li>
		                <li class="" param="others">
							<a href="#others" class="nav-noti-link"><i class="iconfont ic-others"></i> <span>其他消息</span> <!----></a>
						</li>
		            </ul>
		        </div>
		        <div class="col-xs-16 col-xs-offset-4 main" id="div_right_detail">
		            <div param="requests">
		                <div class="menu">全部投稿请求
		                   
		                </div>
		                <ul class="push-list">
		  					<!-- <li>
		                        <a>
		                            <div class="all-push"><i class="iconfont ic-requests"></i></div>
		                            <div class="name">全部未处理请求</div>
		                        </a>
		                    </li> -->
		                  <!--   <li>
		                        <a href="" class="">
		                            <div class="avatar-collection">
		                            <img style="width: 48px;height:48px" src="//upload.jianshu.io/collections/images/544585/70898-106.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/144/h/144">
		                            </div>
		                            <div class="name">
		                                Django
		                            </div>
		                        </a>
		                        <button class="btn-news pull-right btn btn-default">不通过</button>
		                        <button class="btn-news pull-right btn btn-success">通过</button>
		                    </li> -->
		                    
		                </ul>
		            </div>

					<div param="chats" class="hidden">
						<div class="menu">收到的互动消息</div>
						<ul class="comment-list" id="ul_news_list">

						</ul>

					</div>

					<div param="comments" class="hidden">
						<div class="menu">收到的知识消息</div>
						<ul class="comment-list" id="ul_article_list">
						<%--	<li class="">
								<a href="" class="avatar">
									<img src="">
								</a>
								<div class="info"><div><a class="user" href="">凉亦歌</a>
								<span class="comment-slogan">在文章</span><a href="">《如果没人护你周全，那就酷到没有软肋》</a>
								<span class="comment-slogan">中写了一条新评论</span></div> <div class="time">2017.10.27 12:17</div>
								</div>
								<div class="meta">
									<a class="function-btn">
										<i class="iconfont ic-delete"></i>
										<span>回复</span>
									</a>
									<a href="" class="function-btn">
										<i class="iconfont ic-go"></i>
										<span>查看对话</span>
									</a>
								</div>

							</li>--%>

						</ul>

					</div>

					<div param="notify" class="hidden">
						<div class="menu">收到的通知消息</div>
						<ul class="comment-list" id="ul_notify_list">

						</ul>

					</div>
		        </div>
		    </div>
		</div>
		
	</div>
	<!-- //banner-bottom -->

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- footer -->
	
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/myJs/newsCenter.js"></script>

</body>

</html>