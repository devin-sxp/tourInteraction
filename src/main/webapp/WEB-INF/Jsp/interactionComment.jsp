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
<meta name="keywords"
	content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //Custom Theme files -->
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/wangEditor/wangEditor.css"
	type="text/css" rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/pop/pop.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet"
	href="<%=contextPath%>/resource/css/flexslider.css" type="text/css"
	media="screen" />
<!-- js -->
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>

<!-- //js -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#li_interaction").addClass("active");

		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>

<style type="text/css">
.row {
	float: none;
}
</style>
</head>
<body>
	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--//header-->

	<!-- banner -->
	<jsp:include page="common/banner.jsp"></jsp:include>
	<!-- banner -->

	<!-- banner-bottom -->
	<div class="" style="width: 96%;margin-left:2%">
		<!-- container -->
			<table class="table  margin-bottom-5 col-md-12"
				style="overflow-wrap: break-word; table-layout: auto">
				<div class="panel-body" >
					<tbody id="tbody_interaction" class="panel panel-primary" style="border-color: #fff">
	
					</tbody>
				</div>
			</table>

		</div>
		<!-- //container -->
	<!-- //banner-bottom -->

	<!--回复弹窗  start-->

	<div class="popinto" id="edit_text">
		<h3 class="" style="margin-top: 5px">
			<span class="pull-left ">回复</span> <i
				class="fa fa-times pull-right font18" onclick="closepop()"></i>
		</h3>
		<br>
		<hr>
		<div id="div_edit_text_app" style="height: 10%;" class="hidden"></div>

		<input type="hidden" placeholder="" id="knowledge_id"> <input
			type="hidden" placeholder="" id="user_id"> <input
			type="hidden" placeholder="" id="commented_id">
		<div class="popcon">
			<div class="">
				<textarea id="reply_area" name="reply_area"
					style="height:0px; max-height: 100px;">
                 <p></p>
            </textarea>
			</div>
			<p class="pop_p">
				<button type="button" class="btn btn-primary pop_btn"
					style="padding: 10px" id="reply_sure">回复</button>
				<button type="button" class="btn btn-defalut pop_btn"
					style="padding: 10px" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--回复弹窗 end-->

	<!-- popular-grids -->
	<jsp:include page="common/popularPlace.jsp"></jsp:include>
	<!-- popular-grids -->

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- footer -->
	<div class="pop" onclick="closepop()"></div>
</body>
<script defer src="<%=contextPath%>/resource/js/jquery.flexslider.js"></script>
<script defer src="<%=contextPath%>/resource/js/pop/pop.js"></script>

<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/myJs/interactionComment.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/wangEditor/wangEditor.js"></script>
<script type="text/javascript">
	var editor = new wangEditor('reply_area');
	editor.config.menus = $.map(wangEditor.config.menus, function(item, key) {
		return item;
	});
	editor.create();
</script>
<script type="text/javascript">
/* 	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});

	}); */
</script>
</html>