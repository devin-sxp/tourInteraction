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
	href="<%=contextPath%>/resource/css/article/entry.css">
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
					<div id="div_article_content" data-note-content="" class="show-content">
						<div class="image-package">
							<img id="img_article_icon" src="" style="cursor: zoom-in;width:50%"><br>
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
							<img src="./7.jpeg" alt="96"></a> 
						<a class="btn btn-success follow"><i class="iconfont ic-follow"></i><span>关注</span></a> 
						<a id="a_create_user_name" class="title" href=""></a> <span	class="tag">签约作者</span>
						<p>写了 207145 字，被 15203 人关注，获得了 4162 个喜欢</p>
					</div>
					<div class="signature">
					文字爱好者。喜欢简单的生活，随心所欲的写作。我已委托“维权骑士”进行维权行动。
					</div>
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
								<a
									href="http://www.jianshu.com/sign_in?utm_source=desktop&amp;utm_medium=not-signed-in-like-button"><i
									class="iconfont ic-like"></i>喜欢</a>
							</div>
							<div class="modal-wrap">
								<a>138</a>
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
						</a> <a class="share-circle" data-toggle="tooltip"
							href="http://cwb.assets.jianshu.io/notes/images/15623683/weibo/image_3b16bf067e9a.jpg"
							target="_blank" data-original-title="下载长微博图片"> <i
							class="iconfont ic-picture"></i>
						</a> <a class="share-circle more-share" tabindex="0"
							data-toggle="popover" data-placement="top" data-html="true"
							data-trigger="focus" href="javascript:void(0);" data-content=""
							data-original-title="" title="">更多分享</a>
					</div>
				</div>
				<div>
					<div id="comment-list" class="comment-list">
						<div>
							<form class="new-comment">
								<a class="avatar"><img src="./9.png"></a>
								<div class="sign-container">
									<a
										href="http://www.jianshu.com/sign_in?utm_source=desktop&amp;utm_medium=not-signed-in-comment-form"
										class="btn btn-sign">登录</a> <span>后发表评论</span>
								</div>
							</form>
						</div>
						<div id="normal-comment-list" class="normal-comment-list">
							<div>
								<div>
									<div class="top">
										<span id="s_article_comment_count">未知评论</span> <a class="author-only">只看作者</a> <a
											class="close-btn" style="display: none;">关闭评论</a>
										<div class="pull-right">
											<a class="active">按喜欢排序</a><a class="">按时间正序</a><a class="">按时间倒序</a>
										</div>
									</div>
								</div>
								<!---->
								<!---->
								<div class="comments-placeholder" style="display: none;">
									<div class="author">
										<div class="avatar"></div>
										<div class="info">
											<div class="name"></div>
											<div class="meta"></div>
										</div>
									</div>
									<div class="text"></div>
									<div class="text animation-delay"></div>
									<div class="tool-group">
										<i class="iconfont ic-zan-active"></i>
										<div class="zan"></div>
										<i class="iconfont ic-list-comments"></i>
										<div class="zan"></div>
									</div>
								</div>
								<div id="comment-14511484" class="comment">
									<div>
										<div class="author">
											<a href="http://www.jianshu.com/u/74307f7c1d61"
												target="_blank" class="avatar"><img src="./7.jpeg"></a>
											<div class="info">
												<a href="http://www.jianshu.com/u/74307f7c1d61"
													target="_blank" class="name">雪花如糖</a> <span
													class="author-tag">作者</span>
												<div class="meta">
													<span>2楼 · 2017.08.27 12:35</span>
												</div>
											</div>
										</div>
										<div class="comment-wrap">
											<p>本打算只写2千多字。结果絮絮叨叨了近4千字，有点多了，阅读需要极大的耐心😊</p>
											<div class="tool-group">
												<a class=""><i class="iconfont ic-zan"></i> <span>4人赞</span></a>
												<a class=""><i class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
									</div>
									<div class="sub-comment-list">
										<div id="comment-14512030" class="sub-comment">
											<p>
												<a href="http://www.jianshu.com/u/df7c363d4643"
													target="_blank">柳荷</a>： <span> <a
													href="http://www.jianshu.com/users/74307f7c1d61"
													class="maleskine-author" target="_blank"
													data-user-slug="74307f7c1d61">@雪花如糖</a> 还是写少了，感觉不过瘾😊
												</span>
											</p>
											<div class="sub-tool-group">
												<span>2017.08.27 12:53</span> <a class=""><i
													class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
										<div id="comment-14512138" class="sub-comment">
											<p>
												<a href="http://www.jianshu.com/u/74307f7c1d61"
													target="_blank">雪花如糖</a>： <span> <a
													href="http://www.jianshu.com/users/df7c363d4643"
													class="maleskine-author" target="_blank"
													data-user-slug="df7c363d4643">@柳荷</a>
													万分感谢🙏不敢展开多写，字数太多，读者一般就失去耐心。
												</span>
											</p>
											<div class="sub-tool-group">
												<span>2017.08.27 12:56</span> <a class=""><i
													class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
										<div id="comment-14513496" class="sub-comment">
											<p>
												<a href="http://www.jianshu.com/u/96a22cdf4370"
													target="_blank">能辽</a>： <span> <a
													href="http://www.jianshu.com/users/74307f7c1d61"
													class="maleskine-author" target="_blank"
													data-user-slug="74307f7c1d61">@雪花如糖</a> 可以考虑写成系列
												</span>
											</p>
											<div class="sub-tool-group">
												<span>2017.08.27 13:40</span> <a class=""><i
													class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
										<div class="sub-comment more-comment">
											<a class="add-comment-btn"><i
												class="iconfont ic-subcomment"></i> <span>添加新评论</span></a> <span
												class="line-warp"> 还有5条评论， <a>展开查看</a></span>
											<!---->
											<!---->
										</div>
										<!---->
									</div>
								</div>
								<div id="comment-14512844" class="comment">
									<div>
										<div class="author">
											<a href="http://www.jianshu.com/u/cd9be1d83139"
												target="_blank" class="avatar"><img src="./2.jpg"></a>
											<div class="info">
												<a href="http://www.jianshu.com/u/cd9be1d83139"
													target="_blank" class="name">猫娃瓜瓜</a>
												<!---->
												<div class="meta">
													<span>4楼 · 2017.08.27 13:17</span>
												</div>
											</div>
										</div>
										<div class="comment-wrap">
											<p>能像你这样扎实地读一本书就好了👍</p>
											<div class="tool-group">
												<a class=""><i class="iconfont ic-zan"></i> <span>1人赞</span></a>
												<a class=""><i class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
									</div>
									<div class="sub-comment-list">
										<div id="comment-14513059" class="sub-comment">
											<p>
												<a href="http://www.jianshu.com/u/74307f7c1d61"
													target="_blank">雪花如糖</a>： <span>
													@猫娃瓜着过奖了~枕边堆着许多书，但真正看进去的也就一两本。只有自己觉得是好书，才能静下心来慢慢读。</span>
											</p>
											<div class="sub-tool-group">
												<span>2017.08.27 13:23</span> <a class=""><i
													class="iconfont ic-comment"></i> <span>回复</span></a>
												<!---->
												<!---->
											</div>
										</div>
										<div class="sub-comment more-comment">
											<a class="add-comment-btn"><i
												class="iconfont ic-subcomment"></i> <span>添加新评论</span></a>

										</div>
									</div>
								</div>

							</div>
						</div>
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
				<li class="list-group-item"><label>请选择文章封面：</label> <input
					type="file" id="input_file" name="input_file" class="form-control"
					multiple="multiple" data-show-caption="true"></li>


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

	<script src="<%=contextPath%>/resource/js/pop/pop.js"></script>
	<script src="<%=contextPath%>/resource/js/fileInput/fileinput.js"></script>
	<script src="<%=contextPath%>/resource/js/fileInput/fileinput_locale_zh.js"></script>
	<script src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>

	<script src="<%=contextPath%>/resource/js/myJs/articleNews.js"></script>
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