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

<title>热门栏目</title>
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/web.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/article/entry-subjects.css">
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
		<div class="container recommend">
			<img class="recommend-banner" style="width: 100%;"
				src="<%=contextPath%>/resource/images/article/recommend-collection.png"
				alt="Recommend collection">

			<div class="row" id="list-container">
				<!-- <div class="col-xs-8">
					<div class="collection-wrap">
						<a target="_blank" href=""> <img
							class="avatar-collection"
							src="" alt="180">
							<h4 class="name">散文</h4>
							<p class="collection-description"></p>
						</a> <a class="btn btn-success follow"><i
							class="iconfont ic-follow"></i><span>关注</span></a>
						<hr>
						<div class="count">
							<a target="_blank" href="">124534篇文章</a>
							· 1278.6K人关注
						</div>
					</div>
				</div> -->

			</div>
			<a class="btn btn-danger load-more-btn" data-next-page="2">加载更多</a>
		</div>
	</div>
		<!-- popular-grids -->
	<jsp:include page="common/popularPlace.jsp"></jsp:include>
	<!-- popular-grids -->

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- footer -->
	<script defer src="<%=contextPath%>/resource/js/myJs/articleSubjects.js"></script>
</body>
</html>