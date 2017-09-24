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
<link href="<%=contextPath%>/resource/css/table/app.v2.css"
	type="text/css" rel="stylesheet" media="all">
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
	<div class="banner-bottom">
		<!-- container -->
		<section class="vbox" style="width:94%;margin-left:3%"> <section
			class="panel panel-default"> <header class="panel-heading">
		当前板块 </header>
		<div class="row text-sm wrapper">
			<div class="col-sm-5 m-b-xs">
				<button class="btn btn-info" id="btn_publish">发布</button>
			</div>
			<div class="col-sm-4 m-b-xs">
			<!-- 	<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-sm btn-default active"> <input
						type="radio" name="options" id="option1"> Day
					</label> <label class="btn btn-sm btn-default"> <input type="radio"
						name="options" id="option2"> Week
					</label> <label class="btn btn-sm btn-default"> <input type="radio"
						name="options" id="option2"> Month
					</label>
				</div> -->
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<input type="text" class="input-sm form-control" placeholder="请输入关键词" id="input_news_search"/> 
					<span class="input-group-btn">
						<button class="btn btn-sm btn-success" type="button" id="btn_news_search_sure">搜索</button>
					</span>
				</div>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-striped b-t b-light text-sm">
				<thead>
					<tr>
						<th class="th-sortable" data-toggle="class">标题 <span
							class="th-sort"> <i class="fa fa-sort-down text"></i> <i
								class="fa fa-sort-up text-active"></i> <i class="fa fa-sort"></i>
						</span>
						</th>
						<th>标签</th>
						<th>发布者</th>
						<th>时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tbody_news">
					<tr>
						<td>Idrawfast</td>
						<td>4c</td>
						<td>Jul 25, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Formasa</td>
						<td>8c</td>
						<td>Jul 22, 2013</td>
						<td><a href="#" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Avatar system</td>
						<td>15c</td>
						<td>Jul 15, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Throwdown</td>
						<td>4c</td>
						<td>Jul 11, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Idrawfast</td>
						<td>4c</td>
						<td>Jul 7, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Formasa</td>
						<td>8c</td>
						<td>Jul 3, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Avatar system </b></td>
						<td>15c</td>
						<td>Jul 2, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
					<tr>
						<td>Videodown</td>
						<td>4c</td>
						<td>Jul 1, 2013</td>
						<td><a href="#" class="active" data-toggle="class"><i
								class="fa fa-check text-success text-active"></i><i
								class="fa fa-times text-danger text"></i></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- pagination --> <jsp:include page="common/pagination.jsp"></jsp:include>
		<!-- pagination --> </section> </section>

		<!-- //container -->
	</div>
	<!-- //banner-bottom -->
	<!--删除弹窗  start-->
	<div class="popinto" id="delete">
		<div class="font16 center deletediv">是否真的要删除？</div>
		<div class="deletediv_btn">
			<p class="pull-left">
				<button type="button" class="btn btn-primary" id="del_sure">确定</button>
			</p>
			<p class="pull-right">
				<button type="button" class="btn btn-default" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--删除弹窗 end-->
	<!--发布弹窗  start-->

	<div class="popinto" id="publish">
		<h3 class="" style="margin-top: 5px">
			<span class="pull-left ">发布</span> <i
				class="fa fa-times pull-right font18" onclick="closepop()"></i>
		</h3>
		<br>
		<hr>
		<div id="div_publish_app" style="height: 10%;" class="hidden"></div>
		<div class="popcon">
			<ul class="list-group">
				<li class="list-group-item"><input type="text" id="input_news_title" placeholder="请输入标题" class="form-control" maxlength="50"></li>
				<li class="list-group-item"><input type="text" id="input_news_label" placeholder="请输入标签" class="form-control" maxlength="50"></li>
				
			</ul>
			<div class="">
				<textarea id="textarea_publish"
					style="height: 0px; width: 96%; margin-left: 2%">
            </textarea>
			</div>
			<p class="pop_p">
				<button type="button" class="btn btn-primary pop_btn"
					style="padding: 10px" id="btn_news_publish_sure">发布</button>
				<button type="button" class="btn btn-defalut pop_btn"
					style="padding: 10px" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--发布弹窗 end-->

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
	src="<%=contextPath%>/resource/js/common/pagination.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/myJs/interactionNews.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/getUrlParam.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/wangEditor/wangEditor.js"></script>
<script type="text/javascript">
	var editor = new wangEditor('textarea_publish');
	editor.config.menus = $.map(wangEditor.config.menus, function(item, key) {
		return item;
	});
/* 	editor.config.zindex = 2000; */
	editor.create();
</script>
<script type="text/javascript">
	/* $(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});

	}); */
</script>
</html>