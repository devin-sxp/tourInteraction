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
<link href="<%=contextPath%>/resource/css/fileInput/fileinput.css"
	type="text/css" rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/pop/pop.css" type="text/css"
	rel="stylesheet" media="all">
<!-- js -->
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>

<!-- //js -->
<!-- fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //fonts -->

<style type="text/css">
	.user-icon {
		width: 150px;
	    height: 150px;
	    border: 1px solid #ddd;
	    border-radius: 50%;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#li_index").addClass("active");
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>

</head>
<body>
	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--//header-->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="faqs-top-grids">
				<div class="book-grids">
					<div class="col-md-6 book-left">
						<div class="book-left-info">
							<h3>个人资料</h3>
						</div>
						<div class="book-left-form">
							<form>
								<p>用户名</p>
								<input type="text" value="" id="userName"
									onblur="if (this.value.length != 6) toastr.info('请设置6位以上用户名')" maxlength="10">
								<p>电话</p>
								<input type="text" value="" id="phone"
									onblur="if (this.value.length != 11) toastr.info('请设置11位电话号码')" maxlength="11">
								<p>电子邮箱</p>
								<input type="text" value="" id="email"
									onblur="if (this.value.indexOf('@') == -1) toastr.info('请设置正确的邮箱格式')" maxlength="20">
								<p>身份</p>
								<input type="text" value="" id="role"
									onblur="if (this.value == '') {this.value ='';}" maxlength="20" disabled="disabled">
								<p>积分</p>				
								<input type="text" value="" id="integration"
									onblur="if (this.value == '') {this.value ='';}" maxlength="20" disabled="disabled">
								<button type="button" class="btn btn-danger" onclick="sureSave()">保存</button>
								<button type="button" class="btn btn-info pull-right" onclick="edit_password()">修改密码</button>
							</form>
						</div>
					</div>
					<div class="col-md-6 book-left book-right">
						<div class="book-left-info">
							<h3>个人头像</h3>
						</div>
						<div class="book-left-bottom">
							<div class="book-left-facebook" style="text-align:center">
								<img class="user-icon" alt="userIcon" src="<%=contextPath%>/resource/images/article/1.jpg">
							</div>
							<div class="book-left-chrome">
								<input type="file" name="input_file" id="input_file">
							</div>
						</div>
						<ul>
							<li>头像是你给别人的第一印象</li>
							<li>想好你的头像吧</li>
							<li>等等，想好了吗？</li>
							<li>那么，就开始了</li>
							<li>开始设置一个你喜欢的头像吧！</li>
						</ul>
					</div>
					<div class="clearfix"></div>
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
	<!--修改密码弹窗  start-->

	<div class="popinto" id="edit_password">
		<h3 class="" style="margin-top: 5px">
			<span class="pull-left ">修改密码</span> <i
				class="fa fa-times pull-right font18" onclick="closepop()"></i>
		</h3>
		<br>
		<hr>

		<div class="popcon">
			<ul class="list-group">
				<li class="list-group-item"><input type="text" id="input_new_password" placeholder="请输入新密码" class="form-control" maxlength="16"></li>
				<li class="list-group-item"><input type="text" id="input_new_password_again" placeholder="请再次输入新密码" class="form-control" maxlength="16"></li>
			</ul>
			<p class="pop_p">
				<button type="button" class="btn btn-primary pop_btn"
					style="padding: 10px" id="btn_save_password_sure">确定修改</button>
				<button type="button" class="btn btn-defalut pop_btn"
					style="padding: 10px" onclick="closepop()">取消</button>
			</p>
		</div>
	</div>
	<!--修改密码弹窗 end-->
	<div class="pop" onclick="closepop()"></div>
	<script defer src="<%=contextPath%>/resource/js/pop/pop.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/myJs/userCenter.js"></script>
	<script defer src="<%=contextPath%>/resource/js/fileInput/fileinput.js"></script>
	<script defer
		src="<%=contextPath%>/resource/js/fileInput/fileinput_locale_zh.js"></script>
	<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/fileUpload.js"></script>
	
</body>
</html>