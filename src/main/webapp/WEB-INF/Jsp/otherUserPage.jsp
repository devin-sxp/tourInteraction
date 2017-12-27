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
<title>用户页</title>
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
<link href="<%=contextPath%>/resource/css/pop/pop.css" type="text/css"
	rel="stylesheet" media="all">

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

	<!-- banner-bottom -->
	<div class="banner-bottom" style="padding: 1em 0 0 0">
		<!-- container -->
		<div class="container person">
        <div class="row">
            <div id="main_content_left" class="col-xs-1 main">
                <div class="main-top">
                    <a class="avatar" href="">
                        <img id="i_user_icon" src="" alt="240">
                    </a>

                    <div class="title">
                        <a id="a_create_user_name" class="name" href=""></a>
                    </div>
                    <div class="info">
                        <ul>
                            <li>
                                <div class="meta-block">
                                    <a href="">
                                        <p>0</p>
                                        关注 <i class="iconfont ic-arrow"></i>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="meta-block">
                                    <a href="">
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
                    <li id="li_user_article" class="active"><a><i class="iconfont ic-articles"></i> 文章</a></li>
                    <li class=""><a><i class="iconfont ic-feed"></i> 动态</a></li>
                    <li class=""><a><i class="iconfont ic-latestcomments"></i> 最新评论</a></li>
                    <li class=""><a><i class="iconfont ic-hot"></i> 热门</a></li>
                    <li id="li_liked_article"><a><i class="iconfont ic-like"></i> 喜欢的文章</a></li>
                </ul>

                <div id="list-container">
                    <!-- 文章列表模块 -->
                    <ul class="note-list">


                    </ul>
					<a class="load-more">阅读更多</a>
                </div>
            </div>

            <div id="main_content_right" class="col-xs-2 col-xs-offset-1 aside">
                <div class="title">个人介绍</div>
                <div class="description">
                    <div class="js-intro">太懒了,没有简介...</div>
                </div>
                <div id="user-publications">
                </div>
                <ul class="list user-dynamic">
                    <li>
                        <a href="http://www.jianshu.com/users/2d0700f3a80a/subscriptions">
                            <i class="iconfont ic-collection"></i> <span>关注的专题/文集</span>
                        </a>
                    </li>
                    <li>
                        <a id="a_my_liked_article" href="#li_liked_article">
                            <i class="iconfont ic-like"></i> <span>我喜欢的文章</span>
                        </a>
                    </li>
                </ul>
                <!-- 专题和文集 -->
                <div>
                    <div>
                        <!---->
                        <div class="title">创建的栏目</div>
                    	<ul class="my_subject_list list">
<!--                     		<li>
                    			<a href="" target="_blank" class="avatar-collection">
                    				<img style="width:32px;height:32px;" src="">
                    			</a> 
                    			<a href="" target="_blank" class="name">
                    			Django
                    			</a>
                    		</li> -->
                    	 
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

	<script defer src="<%=contextPath%>/resource/js/myJs/otherUserPage.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
    <script type="text/javascript"
            src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
	<script type="text/javascript">
		if (isPhone()) {
			$(".aside .board a img").css({
				'width' : "100%"
			})
		}
	</script>
	<script type="text/javascript">
	$(".trigger-menu li").on('click', function(){
		$(".trigger-menu li").each(function(){
			$(this).removeClass("active");
		});
		$(this).addClass('active');
	});

	if (isPhone()) {
		$("#main_content_right").addClass("hidden");
		$("#main_content_left").css({'width':"100%"});
	} 
</script>
</body>

</html>