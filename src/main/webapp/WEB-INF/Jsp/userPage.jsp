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
<title>个人主页</title>
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
                    <a class="avatar" href="<%=contextPath%>/page/userPage">
                        <img src="<%=contextPath%><%
                        	if(user != null){
                        		out.print(user.getUserIconPath());
                        	}
                        %>" alt="240">
                    </a>

                    <div class="title">
                        <a class="name" href="<%=contextPath%>/page/userPage"><%
                        	if(user != null){
                        		out.print(user.getUserName());
                        	}
                        %></a>
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
                    <ul class="note-list">


                    </ul>
					<a class="load-more">阅读更多</a>
                </div>
            </div>

            <div id="main_content_right" class="col-xs-2 col-xs-offset-1 aside">
                <div class="title">个人介绍</div>
                <a class="function-btn" href="javascript:void(0)"><i class="iconfont ic-edit-s"></i>编辑</a>
                <div class="profile-edit js-intro-form" >
                    <textarea id="text_user_description"><%
                    			if (user != null){
			                     out.print(user.getUserDescription());
			                   } %></textarea>
                    <input type="button" id="btn_save_user_description" value="保存" style="width:30%" class="btn btn-hollow btn-info" >
                    <a id="cancel-edit-intro" href="javascript:void(null);">取消</a>
                </div>
                <div class="description">
                    <div class="js-intro"><%
							if (user != null){
		                     out.print(user.getUserDescription());
		                   } %></div>
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
                        <div class="title">我创建的栏目</div>
                        <a class="function-btn new-collection-btn"><i class="iconfont ic-follow"></i><span>新建栏目</span></a>
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
	<!--创建栏目  start-->

	<div class="popinto" id="create_subject">
		<h3 class="" style="margin-top: 5px">
			<span class="pull-left ">创建栏目</span> <i
				class="fa fa-times pull-right font18" onclick="closepop()"></i>
		</h3>
		<br>
		<hr>
		<div class="popcon">
			<ul class="list-group">
				<li class="list-group-item"><input type="text"
					id="input_subject_title" placeholder="请输入标题" class="form-control"
					maxlength="50"></li>
				<li class="list-group-item">
					<label>请选择栏目图标：</label>
					<input type="file" id="input_file" name="input_file"
					class="form-control" multiple="multiple" data-show-caption="true"></li>

				<li class="list-group-item">
				<textarea id="textarea_subject_description"
					style="height: 200px; width: 100%;border: 1px solid #ccc;border-radius: 4px;">
        	    </textarea>
				</li>
			</ul>

			<p class="pop_p">
				<button type="button" class="btn btn-primary pop_btn"
					style="padding: 10px" id="btn_news_create_subject_sure">创建</button>
				<button type="button" class="btn btn-defalut pop_btn"
					style="padding: 10px" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--发布弹窗 end-->
	<div class="pop" onclick="closepop()"></div>
	<script defer src="<%=contextPath%>/resource/js/pop/pop.js"></script>

	<script defer src="<%=contextPath%>/resource/js/myJs/userPage.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script defer src="<%=contextPath%>/resource/js/fileInput/fileinput.js"></script>
	<script defer
		src="<%=contextPath%>/resource/js/fileInput/fileinput_locale_zh.js"></script>
	<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/fileUpload.js"></script>
	<div class="pop" onclick="closepop()"></div>

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
</body>

</html>