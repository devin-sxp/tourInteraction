<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
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
						<a class="collection" target="_blank"
							href="http://www.jianshu.com/c/8c92f845cd4d?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">漫画·手绘</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/fcd7a62be697?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">世间事</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/RfYyQj?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">散文</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/V2CqjW?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">@IT·互联网</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/41ab6aec506c?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">书法</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/Jgq3Wc?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">上班这点事儿</div>
						</a> <a class="collection" target="_blank"
							href="http://www.jianshu.com/c/074e475b2f45?utm_medium=index-collections&amp;utm_source=desktop">
							<img src="<%=contextPath%>/resource/images/article/1.jpg"
							alt="64">
							<div class="name">成长励志</div>
						</a> <a class="more-hot-collection" target="_blank"
							href="http://www.jianshu.com/recommendations/collections?utm_medium=index-collections&amp;utm_source=desktop">
							更多热门专题 <i class="iconfont ic-link"></i>
						</a>
					</div>
					<div class="split-line"></div>
					<div id="list-container">
						<!-- 文章列表模块 -->
						<ul class="note-list" infinite-scroll-url="/">

							<li id="note-16834633" data-note-id="16834633" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/3da2eb9e3d5c"
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href="http://www.jianshu.com/u/fb038c413759"> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="http://www.jianshu.com/u/fb038c413759">蹇之途</a> <span
												class="time" data-shared-at="2017-09-09T01:08:56+08:00">09.09
												01:08</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="http://www.jianshu.com/p/3da2eb9e3d5c">这些PPT拆字方法，我觉得OK</a>
									<p class="abstract">上一篇分享文章中谈到，可以利用文字就地取材，制作墨迹填充效果。
										既然在PPT中文字是矢量，又可以拆分成形状，成了形状的笔画就具备了形状的特征，比如可以进行图片填充、编辑顶点等...</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="http://www.jianshu.com/c/Jgq3Wc">上班这点事儿</a> <a
											target="_blank" href="http://www.jianshu.com/p/3da2eb9e3d5c">
											<i class="iconfont ic-list-read"></i> 2183
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/3da2eb9e3d5c#comments"> <i
											class="iconfont ic-list-comments"></i> 163
										</a> <span><i class="iconfont ic-list-like"></i> 263</span> <span><i
											class="iconfont ic-list-money"></i> 2</span>
									</div>
								</div>
							</li>

							<li id="note-16846963" data-note-id="16846963" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/72c97ffb2443"
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href="http://www.jianshu.com/u/9dc7de6c93ee"> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="http://www.jianshu.com/u/9dc7de6c93ee">阳光baby</a> <span
												class="time" data-shared-at="2017-09-08T20:13:23+08:00">09.08
												20:13</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="http://www.jianshu.com/p/72c97ffb2443">不逼自己一把，你永远不知道自己有多棒</a>
									<p class="abstract">
										我一直都不怎么爱说话，天生如此。用朋友的话说，我就是那种一聊天就能把天聊死的人。
										但我骨子里却又是一个不安分的人，有着心比天高的梦想，天天渴望创业，但是却连跟陌生人说话的勇气...</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="http://www.jianshu.com/c/e2XTpa">青春</a> <a
											target="_blank" href="http://www.jianshu.com/p/72c97ffb2443">
											<i class="iconfont ic-list-read"></i> 3223
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/72c97ffb2443#comments"> <i
											class="iconfont ic-list-comments"></i> 51
										</a> <span><i class="iconfont ic-list-like"></i> 169</span>
									</div>
								</div>
							</li>

							<li id="note-16794791" data-note-id="16794791" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/4c605d1c1920"
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href="http://www.jianshu.com/u/ec08e7de966a"> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="http://www.jianshu.com/u/ec08e7de966a">喵喵敏</a> <span
												class="time" data-shared-at="2017-09-08T17:45:59+08:00">09.08
												17:45</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="http://www.jianshu.com/p/4c605d1c1920">淘宝上有哪些小清新女装店铺？这五家一定不能错过</a>
									<p class="abstract">
										近段时间都陆续开学了，00后也在慢慢进入大学了，每每这时喵喵就无比感叹自己的青春，不过虽然逝去了校园生活，但青春风还是可以自己搭配的嘛，喵喵也一直比较喜欢文艺小清新的穿衣风格...
									</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="http://www.jianshu.com/c/dbce1aae36a3">买买买购物指南</a> <a
											target="_blank" href="http://www.jianshu.com/p/4c605d1c1920">
											<i class="iconfont ic-list-read"></i> 2437
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/4c605d1c1920#comments"> <i
											class="iconfont ic-list-comments"></i> 16
										</a> <span><i class="iconfont ic-list-like"></i> 194</span>
									</div>
								</div>
							</li>

							<li id="note-16857487" data-note-id="16857487" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/f1eec63946e5"
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href="http://www.jianshu.com/u/f79de69d59e3"> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="http://www.jianshu.com/u/f79de69d59e3">虬田</a> <span
												class="time" data-shared-at="2017-09-09T00:40:33+08:00">09.09
												00:40</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="http://www.jianshu.com/p/8a787e1bdd5f">[家乡老行当的故事征文]琢字补碗匠老张</a>
									<p class="abstract">
										老张年轻时靠琢字补碗谋生。因其始终不肯说出乡籍，只知其曾是四方云游的匠人，具体何方人士，至今仍不得而知。
										记得小时候，每逢立秋后农闲，他就挑着琢字补碗的工具和全部生活家当，从...</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="http://www.jianshu.com/c/43bddff215e8">行业故事汇</a> <a
											target="_blank" href="http://www.jianshu.com/p/8a787e1bdd5f">
											<i class="iconfont ic-list-read"></i> 655
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/8a787e1bdd5f#comments"> <i
											class="iconfont ic-list-comments"></i> 138
										</a> <span><i class="iconfont ic-list-like"></i> 96</span> <span><i
											class="iconfont ic-list-money"></i> 14</span>
									</div>
								</div>
							</li>

							<li id="note-16972723" data-note-id="16972723" class="have-img">
								<a class="wrap-img" href="http://www.jianshu.com/p/f1eec63946e5"
								target="_blank"> <img class="img-blur-done"
									src="<%=contextPath%>/resource/images/article/1.jpg" alt="120">
							</a>
								<div class="content">
									<div class="author">
										<a class="avatar" target="_blank"
											href="http://www.jianshu.com/u/2d898d506ab9"> <img
											src="<%=contextPath%>/resource/images/article/1.jpg" alt="64">
										</a>
										<div class="name">
											<a class="blue-link" target="_blank"
												href="http://www.jianshu.com/u/2d898d506ab9">帕克儿</a> <span
												class="time" data-shared-at="2017-09-12T07:06:14+08:00">3小时前</span>
										</div>
									</div>
									<a class="title" target="_blank"
										href="http://www.jianshu.com/p/f1eec63946e5">和平是我以为的理所应当，却是塞尔维亚的难能可贵</a>
									<p class="abstract">来塞尔维亚是一个特别冲动和鲁莽的决定。
										作为一个旅行博主，各国的签证信息我是一直都有在关注的，尤其是那些少得可怜的对中国开放免签政策的国家。
										所以当今年1月听说塞尔维亚免签的...</p>
									<div class="meta">
										<a class="collection-tag" target="_blank"
											href="http://www.jianshu.com/c/5AUzod">旅行·在路上</a> <a
											target="_blank" href="http://www.jianshu.com/p/f1eec63946e5">
											<i class="iconfont ic-list-read"></i> 278
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/f1eec63946e5#comments"> <i
											class="iconfont ic-list-comments"></i> 3
										</a> <span><i class="iconfont ic-list-like"></i> 13</span> <span><i
											class="iconfont ic-list-money"></i> 1</span>
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
							<span>推荐作者</span> <a class="page-change"><i
								class="iconfont ic-search-change"
								style="transform: rotate(0deg);"></i> 换一批 </a>
						</div>
						<ul class="list">
							<li><a
								href="http://www.jianshu.com/u/5SqsuF?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
								class="follow" state="0"><i class="iconfont ic-follow"></i>关注
							</a> <a
								href="http://www.jianshu.com/u/5SqsuF?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="name"> 刘淼 </a>
								<p>写了320.3k字 · 19.4k喜欢</p></li>
							<li><a
								href="http://www.jianshu.com/u/4062aaeba322?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
								class="follow" state="0"><i class="iconfont ic-follow"></i>关注
							</a> <a
								href="http://www.jianshu.com/u/4062aaeba322?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="name"> 念远怀人 </a>
								<p>写了90.9k字 · 405喜欢</p></li>
							<li><a
								href="http://www.jianshu.com/u/66c9f67ba2e0?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
								class="follow" state="0"><i class="iconfont ic-follow"></i>关注
							</a> <a
								href="http://www.jianshu.com/u/66c9f67ba2e0?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="name"> 占芳 </a>
								<p>写了94.1k字 · 482喜欢</p></li>
							<li><a
								href="http://www.jianshu.com/u/5462ec6828f6?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
								class="follow" state="0"><i class="iconfont ic-follow"></i>关注
							</a> <a
								href="http://www.jianshu.com/u/5462ec6828f6?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="name"> 魏童 </a>
								<p>写了23.8k字 · 344喜欢</p></li>
							<li><a
								href="http://www.jianshu.com/u/78f970537a5e?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="avatar"><img style="height: 100%;"
									src="<%=contextPath%>/resource/images/article/1.jpg"></a> <a
								class="follow" state="0"><i class="iconfont ic-follow"></i>关注
							</a> <a
								href="http://www.jianshu.com/u/78f970537a5e?utm_source=desktop&amp;utm_medium=index-users"
								target="_blank" class="name"> 名贵的考拉熊 </a>
								<p>写了29.9k字 · 1.4k喜欢</p></li>
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
	<div class="pop" onclick="closepop()"></div>
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