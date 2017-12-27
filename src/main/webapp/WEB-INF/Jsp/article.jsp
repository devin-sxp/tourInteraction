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
	href="<%=contextPath%>/resource/css/article/entry-list.css">
<link href="<%=contextPath%>/resource/css/pop/pop.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/wangEditor/wangEditor.css"
	type="text/css" rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/fileInput/fileinput.css"
	type="text/css" rel="stylesheet" media="all">
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
</style>
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
		<div class="container index">
			<button id="btn_write_article" class="btn write-btn">
				<i class="iconfont ic-write"></i>写文章
			</button>
			<div class="row">
				<div class="col-xs-16 main">
					<div class="recommend-collection">
						
						<a class="more-hot-collection" style="float:right"
							href="<%=contextPath%>/page/articleSubjects">
							更多热门专题 <i class="iconfont ic-link"></i>
						</a>
					</div>
					<div class="split-line"></div>
					<div id="list-container">
						<!-- 文章列表模块 -->
						<ul class="note-list">
							<li class="have-img">
								<a class="wrap-img" href=""
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href=""> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="">蹇之途</a> <span
												class="time">09.09
												01:08</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="">这些PPT拆字方法，我觉得OK</a>
									<p class="abstract">上一篇分享文章中谈到，可以利用文字就地取材，制作墨迹填充效果。
										既然在PPT中文字是矢量，又可以拆分成形状，成了形状的笔画就具备了形状的特征，比如可以进行图片填充、编辑顶点等...</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="">上班这点事儿</a> <a>
											<i class="iconfont ic-list-read"></i> 2183
										</a> <a target="_blank"
											href=""> <i
											class="iconfont ic-list-comments"></i> 163
										</a> <span><i class="iconfont ic-list-like"></i> 263</span> <span><i
											class="iconfont ic-list-money"></i> 2</span>
									</div>
								</div>
							</li>
						</ul>
						<!-- 文章列表模块 -->
					</div>
					<a class="load-more">阅读更多</a>
				</div>
				<div class="aside">
					<div class="board">
						<a target="_blank"
							href="http://www.jianshu.com/recommendations/notes?category_id=56&amp;utm_medium=index-banner-s&amp;utm_source=desktop">
							<img
							src="<%=contextPath%>/resource/images/article/banner-s-1.png"
							alt="Banner s 1">
						</a> <a target="_blank"
							href="http://www.jianshu.com/trending/weekly?utm_medium=index-banner-s&amp;utm_source=desktop"><img
							src="<%=contextPath%>/resource/images/article/banner-s-3.png"
							alt="Banner s 3"> </a> <a target="_blank"
							href="http://www.jianshu.com/trending/monthly?utm_medium=index-banner-s&amp;utm_source=desktop"><img
							src="<%=contextPath%>/resource/images/article/banner-s-4.png"
							alt="Banner s 4"> </a>
					</div>

					<!-- 推荐作者 -->
					<div class="recommended-authors">
						<div class="title">
							<span>推荐作者</span>
							<a class="page-change">
								<i	class="iconfont ic-search-change"	style="transform: rotate(0deg);"></i>
								换一批
							</a>
						</div>
						<ul class="list" id="user_rand_list">
							<li>
								<a target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
									class="follow" state="0"><i class="iconfont ic-follow"></i>关注
								</a>
								<a	target="_blank" class="name"> 刘淼 </a>
								<p>写了320.3k字 · 19.4k喜欢</p>
							</li>

						</ul>
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

	<!--发布弹窗  start-->

	<div class="popinto" id="write_article">
		<h3 class="" style="margin-top: 5px">
			<span class="pull-left ">写文章</span> <i
				class="fa fa-times pull-right font18" onclick="closepop()"></i>
		</h3>
		<br>
		<hr>
		<div class="popcon">
			<ul class="list-group">
				<li class="list-group-item"><input type="text"
					id="input_article_title" placeholder="请输入标题" class="form-control"
					maxlength="50"></li>
				<li class="list-group-item">
					<label>请选择文章封面：</label>
					<input type="file" id="input_file" name="input_file"
					class="form-control" multiple="multiple" data-show-caption="true"></li>


			</ul>
			<div class="">
				<textarea id="textarea_article_content"
					style="height: 200px; width: 96%; margin-left: 2%">
            </textarea>
			</div>
			<p class="pop_p">
				<button type="button" class="btn btn-primary pop_btn"
					style="padding: 10px" id="btn_news_write_article_sure">保存</button>
				<button type="button" class="btn btn-defalut pop_btn"
					style="padding: 10px" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--发布弹窗 end-->
	<div class="pop" onclick="closepop()"></div>

	<script defer src="<%=contextPath%>/resource/js/pop/pop.js"></script>
	<script defer src="<%=contextPath%>/resource/js/fileInput/fileinput.js"></script>
	<script defer
		src="<%=contextPath%>/resource/js/fileInput/fileinput_locale_zh.js"></script>

	<script defer src="<%=contextPath%>/resource/js/myJs/article.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/fileUpload.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/wangEditor/wangEditor.js"></script>
	<script type="text/javascript">
		var editor = new wangEditor('textarea_article_content');
		editor.config.menus = $.map(wangEditor.config.menus, function(item, key) {
			return item;
		});
		/* 	editor.config.zindex = 2000; */
		editor.create();
	</script>
	<script type="text/javascript">
		if (isPhone()) {
			$(".aside .board a img").css({
				'width' : "100%"
			})
		}
	</script>
</body>
</html>