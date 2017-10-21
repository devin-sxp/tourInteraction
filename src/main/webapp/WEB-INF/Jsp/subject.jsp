<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<!-- Start of Baidu Transcode -->
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta http-equiv="Cache-Control" content="no-transform">
<meta name="applicable-device" content="pc,mobile">
<meta name="MobileOptimized" content="width">
<meta name="HandheldFriendly" content="true">
<!-- Apple -->
<meta name="apple-mobile-web-app-title" content="tour">

<title>栏目</title>
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/web.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/entry-subject-single.css">
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
		<div class="container collection">
			<div class="row">
				<div class="col-xs-24 col-sm-16 main" style="float:left">
					<!-- 栏目头部模块 -->
					<div class="main-top">
						<a class="avatar-collection" onclick="window.location.reload()"> <img
							id="img_subject_icon" src="" style="width:80px;height:80px;
							border:1px solid #ddd;border-radius: 10%;">
						</a> 
						<div class="btn btn-hollow js-contribute-button">投稿</div>

						<div class="title">
							<a class="name" onclick="window.location.reload()" id="a_subject_title"></a>
						</div>
						<div class="info" id="div_create_info"></div>
					</div>
					<ul class="trigger-menu" data-pjax-container="#list-container">
						<li class=""><a
							href=""><i
								class="iconfont ic-latestcomments"></i> 最新评论</a></li>
						<li class="active"><a
							href=""><i
								class="iconfont ic-articles"></i> 最新收录</a></li>
						<li class=""><a
							href=""><i
								class="iconfont ic-hot"></i> 热门</a></li>
					</ul>
					<div id="list-container">
						<!-- 文章列表模块 -->
						<ul class="note-list">
<!-- 
							<li id="note-18234264" data-note-id="18234264" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/6f666c82ebcb"
								target="_blank"> <img class="img-blur-done"
									src="./散文 - 专题 - 简书_files/6370660-2b7496c122990a25.jpg"
									alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href=""> <img
											src=""
											alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="">剧情很甜_</a> <span
												class="time">昨天
												17:46</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="">不是所有的人都必须对你好</a>
									<p class="abstract">
										深夜，先生接到家乡老表的电话，让先生坐出租车去接老表的妹妹，也就是我们的表妹，一个才15岁的小女孩。
										因为不想读书，跟着熟人出来打工，正好来到了我和先生现在工作的城市，熟人带...</p>
									<div class="meta">
										<a target="_blank"
											href=""> <i
											class="iconfont ic-list-read"></i> 9
										</a> <a target="_blank"
											href=""> <i
											class="iconfont ic-list-comments"></i> 0
										</a> <span><i class="iconfont ic-list-like"></i> 1</span>
									</div>
								</div>
							</li> -->
						</ul>
					<a class="btn btn-danger load-more-btn" data-next-page="2" 
					style="width: 80%;margin-left: 10%; border-radius: 100px;">加载更多</a>
					</div>
				</div>
				<div class="col-xs-24 col-sm-7 col-sm-offset-1 aside">
					<p class="title">栏目描述</p>
					<div class="description js-description">
						
					</div>

					<div>
						<div>
							<p class="title" id="p_author_name">管理员</p>
							<ul class="list collection-editor">
								<!-- <li><a href=""
									target="_blank" class="avatar"><img
										src=""></a> <a
									href="" target="_blank"
									class="name">大豆</a> <span class="tag">创建者</span></li> -->
								
								<li><a class="check-more" id="load-more-author" data-next-page="2">展开更多 <i
										class="iconfont ic-show"></i></a>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<!-- popular-grids -->
	<jsp:include page="common/popularPlace.jsp"></jsp:include>
	<!-- popular-grids -->

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- footer -->
	<script src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
	<script src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script	src="<%=contextPath%>/resource/js/myJs/subject.js"></script>
</body>
</html>