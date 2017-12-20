<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Article</title>
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
	href="<%=contextPath%>/resource/css/article/entry-search.css">
<link rel="stylesheet" media="all"
	href="<%=contextPath%>/resource/css/common/tourCss.css">
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
.write-btn {
	float: right;
	width: 100px;
	height: 40px;
	line-height: 24px;
	margin: 8px 15px 0;
	border-radius: 20px;
	font-size: 15px;
	color: #fff;
	background-color: #ea6f5a;
}
.col-xs-offset-8{
    margin-left: 27%;
}
.pagination {
	margin: 0 0;
	text-align: center;
	border-radius: 4px;
	width: 100%;
	margin-bottom: 10px;
}
.pagination li,.pagination{
	display: inline-block;
}
.pagination > li > a{
	border-radius: 30px;
}
.pagination > li:first-child > a,.pagination > li:last-child > a{
	border-radius: 30px;
}
.pagination .active {
	font-weight: 700;
	border: none;
	pointer-events: none;
}
</style>
</head>
<body class="reader-black-font">

	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--/header-->

	<!-- banner-bottom -->
	<div class="banner-bottom" style="padding: 1em 0 0 0">
		<!-- container -->
		<div class="container index">
			<div class="container search">
				<div class="row">
					<div class="aside">
						<div>
							<ul class="menu" id="ul_query_type">
								<li class="" param="article">
									<a>
										<div class="setting-icon"><i class="iconfont ic-search-note"></i></div> <span>文章</span></a>
								</li>
								<li class="" param="user">
									<a>
										<div class="setting-icon"><i class="iconfont ic-search-user"></i></div> <span>用户</span></a>
								</li>
								<li class="" param="article_subject">
									<a>
										<div class="setting-icon"><i class="iconfont ic-search-collection"></i></div> <span>专题</span></a>
								</li>
								<li class="" param="interaction_news">
									<a>
										<div class="setting-icon"><i class="iconfont ic-search-notebook"></i></div> <span>帖子</span></a>
								</li>
							</ul>
						</div>
						<div class="search-trending">
							<div class="search-trending-header clearfix"><span>热门搜索</span> <a><i class="iconfont ic-search-change" style="transform: rotate(0deg);"></i> 换一批</a></div>
							<ul class="search-trending-tag-wrap">
								<li><a href="http://www.jianshu.com/search?q=%E7%BA%A2%E9%BB%84%E8%93%9D&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">红黄蓝</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E8%87%B4%E6%88%91%E4%BB%AC%E5%8D%95%E7%BA%AF%E7%9A%84%E5%B0%8F%E7%BE%8E%E5%A5%BD&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">致我们单纯的小美好</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E6%95%85%E4%BA%8B&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">故事</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E6%89%8B%E5%B8%90&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">手帐</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E5%86%99%E7%BB%99%E6%9C%AA%E6%9D%A5X%E5%85%88%E7%94%9F%E7%9A%84%E4%B8%80%E7%BA%B8%E6%83%85%E4%B9%A6&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">写给未来X先生的一纸情书</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E9%A5%B1%E9%86%89%E8%B1%9A&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">饱醉豚</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E5%85%A8%E8%81%8C%E5%A6%88%E5%A6%88&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">全职妈妈</a></li>
								<li><a href="http://www.jianshu.com/search?q=PPT&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">PPT</a></li>
								<li><a href="http://www.jianshu.com/search?q=%E5%8D%81%E4%B9%9D%E5%A4%A7&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">十九大</a></li>
								<li><a href="http://www.jianshu.com/search?q=vue&amp;utm_source=desktop&amp;utm_medium=search-trending" target="_blank">vue</a></li>
							</ul>
						</div>
						<div class="search-recent">
							<div class="search-recent-header clearfix"><span>最近搜索</span> <a>清空</a></div>
							<ul class="search-recent-item-wrap">
								<li><a href="http://www.jianshu.com/search?q=%E7%BA%A2%E9%BB%84%E8%93%9D&amp;utm_source=desktop&amp;utm_medium=search-recent" target="_blank"><i class="iconfont ic-search-history"></i> <span>红黄蓝</span> <i class="iconfont ic-unfollow"></i></a></li>
								<li><a href="http://www.jianshu.com/search?q=%E6%84%9F%E6%81%A9%E8%8A%82&amp;utm_source=desktop&amp;utm_medium=search-recent" target="_blank"><i class="iconfont ic-search-history"></i> <span>感恩节</span> <i class="iconfont ic-unfollow"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xs-16 col-xs-offset-8 main">
						<div class="search-content">
							<div class="sort-type">
								<a class="active" param="desc_time">
								综合
								·
								</a>
								<a class="" param="desc_commentCount">
								热门
								·
								</a>
								<a class="" param="asc_time">
								最早
								·
								</a>
								<a class="" param="desc_time">
								最新
								</a>
							</div>
							<div class="result" id="result_count">0 个结果</div>
							<ul class="note-list">
							</ul>
							<ul class="user-list"></ul>
							<div>
								<ul class="pagination">

								</ul>
							</div>
						</div>

						<div class="find-nothing hidden"><img src="<%=contextPath%>/resource/images/search/find-nothing.png"> <div>未找到相关内容</div></div>
					</div>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->

	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
	<script type="text/javascript"
			src="<%=contextPath%>/resource/js/common/pagination_plus.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/myJs/search.js"></script>

</body>
</html>