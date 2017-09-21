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
	href="<%=contextPath%>/resource/css/article/entry-private-main.css">
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
		<div class="container person">
        <div class="row">
            <div id="main_content_left" class="col-xs-1 main">
                <div class="main-top">
                    <a class="avatar" href="http://www.jianshu.com/u/2d0700f3a80a">
                        <img src="<%=contextPath%>/resource/images/article/3.jpg" alt="240">
                    </a>

                    <div class="title">
                        <a class="name" href="http://www.jianshu.com/u/2d0700f3a80a">Dreamer_2099</a>
                    </div>
                    <div class="info">
                        <ul>
                            <li>
                                <div class="meta-block">
                                    <a href="http://www.jianshu.com/users/2d0700f3a80a/following">
                                        <p>0</p>
                                        关注 <i class="iconfont ic-arrow"></i>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="meta-block">
                                    <a href="http://www.jianshu.com/users/2d0700f3a80a/followers">
                                        <p>0</p>
                                        粉丝 <i class="iconfont ic-arrow"></i>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="meta-block">
                                    <a>
                                        <p id="my_article_count">0</p>
                                                        文章 <i class="iconfont ic-arrow"></i>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="meta-block">
                                    <p id="my_article_words_count">0</p>
                                    <div>字数</div>
                                </div>
                            </li>
                            <li>
                                <div class="meta-block">
                                    <p>0</p>
                                    <div>收获喜欢</div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <ul class="trigger-menu" data-pjax-container="#list-container">
                    <li class="active"><a><i class="iconfont ic-articles"></i> 文章</a></li>
                    <li class=""><a><i class="iconfont ic-feed"></i> 动态</a></li>
                    <li class=""><a><i class="iconfont ic-latestcomments"></i> 最新评论</a></li>
                    <li class=""><a><i class="iconfont ic-hot"></i> 热门</a></li>
                </ul>

                <div id="list-container">
                    <!-- 文章列表模块 -->
                    <ul class="note-list" infinite-scroll-url="/u/2d0700f3a80a?order_by=shared_at">


                    </ul>
					<a class="load-more">阅读更多</a>
                </div>
            </div>

            <div id="main_content_right" class="col-xs-2 col-xs-offset-1 aside">
                <div class="title">个人介绍</div>
                <a class="function-btn" data-action="start-edit-intro" href="javascript:void(0)"><i class="iconfont ic-edit-s"></i>编辑</a>
                <form class="profile-edit js-intro-form" data-type="json" id="edit_user_8000859" action="http://www.jianshu.com/users/2d0700f3a80a" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
                    <textarea name="user[intro]" id="user_intro"></textarea>
                    <input type="submit" name="commit" value="保存" class="btn btn-hollow" data-action="save-edit-intro" data-disable-with="保存">
                    <a id="cancel-edit-intro" data-action="cancel-edit-intro" href="javascript:void(null);">取消</a>
                </form>
                <div class="description">
                    <div class="js-intro"></div>


                </div>
                <div id="user-publications">
                </div>
                <ul class="list user-dynamic">
                    <li>
                        <a href="http://www.jianshu.com/users/2d0700f3a80a/subscriptions">
                            <i class="iconfont ic-collection"></i> <span>我关注的专题/文集</span>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.jianshu.com/users/2d0700f3a80a/liked_notes">
                            <i class="iconfont ic-like"></i> <span>我喜欢的文章</span>
                        </a>
                    </li>
                </ul>
                <!-- 专题和文集 -->
                <div>
                    <div>
                        <!---->
                        <div class="title">我创建的专题</div>
                        <div class="new-collection-block"><a href="http://www.jianshu.com/collections/new" class="new-collection-btn"><i class="iconfont ic-follow"></i><span>创建一个新专题</span></a></div>
                    </div>
                    <!---->
                    <div>
                        <div class="title">
                            我的文集
                        </div>
                        <ul class="list">
                            <li><a href="http://www.jianshu.com/nb/16690692" target="_blank"><i class="iconfont ic-search-notebook"></i></a> <a href="http://www.jianshu.com/nb/16690692" target="_blank" class="name">随笔</a></li>
                            <li>

                            </li>
                        </ul>
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

	<script defer src="<%=contextPath%>/resource/js/myJs/userPage.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	
</body>
<script type="text/javascript">
	$(".trigger-menu li").on('click', function(){
		$(".trigger-menu li").each(function(){
			$(this).removeClass("active");
		});
		$(this).addClass('active');
	});
	
	$(".function-btn").on('click',function(){
		$(this).next().css({'display':'block'});
	});
	$("#cancel-edit-intro").on('click',function(){
		$(this).parent().css({'display':'none'});
	});
	
	if (isPhone()) {
		$("#main_content_right").addClass("hidden");
		$("#main_content_left").css({'width':"100%"});
	} 
</script>
</html>