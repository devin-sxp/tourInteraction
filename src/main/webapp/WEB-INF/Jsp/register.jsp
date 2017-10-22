<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<!-- //Custom Theme files -->

	<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<style type="text/css">
	.error_label{
		color:red
	}
	
	.book-left-form p{

	margin:2em 0 1em 0;
	}

	.book-left-form input[type="text"],.book-left-form input[type="reg_password"] {
	    margin-bottom: 0em; 
	}
	
</style>
<!-- fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //fonts -->
<!-- js -->
<script type="application/x-javascript">
	
	 addEventListener("load", function() {
		 setTimeout(hideURLbar, 0); 
		 }, false); 
	 function hideURLbar(){
		 window.scrollTo(0,1); 
		 } 

</script>
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
<script src="<%=contextPath%>/resource/js/modernizr.custom.js"></script>
<script src="<%=contextPath%>/resource/js/jquery.validate.js"></script>
<!-- //js -->

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
							<h3>创建你的个人账户！</h3>
						</div>
						<div class="book-left-form">
							<form method="post" action="<%=contextPath%>/signTour/register.do" id="register_from">
								<p>用户名</p>
								<input type="text" value="" name="name" maxlength="12" placeholder="请输入用户名"/>
								<p>电话</p>
								<input type="text" value="" name="phone" maxlength="11" placeholder="请输入手机号"/>
								<p>电子邮箱</p>
								<input type="text" value="" name="email" id="email" placeholder="请输入邮箱地址"/>
								<p>密码</p>
								<input type="password" name="reg_password" id="reg_password" maxlength="16" placeholder="请输入密码"/>
								<p>确认密码</p>
								<input type="password" name="comfirm_reg_password" id="comfirm_reg_password" maxlength="16" placeholder="请再次输入密码"/>
								<label for="checkbox" style="width: auto;"><input type="checkbox" 
									id="checkbox"> <i>记住</i></label> <input type="submit"
									id="regiseter" value="注册"/>
								<p style="color: red">${msgRegister}</p>
							</form>
						</div>
					</div>
					<div class="col-md-6 book-left book-right">
						<div class="book-left-info">
							<h3>提示</h3>
						</div>
						<div class="book-left-bottom">
							<div class="book-left-facebook">
								<a href="#">Connect with Facebook</a>
							</div>
							<div class="book-left-chrome">
								<a href="#">Connect with Google</a>
							</div>
						</div>
						<ul>
							<li>输入你的注册信息</li>
							<li>加入我们的平台</li>
							<li>好吧，我们需要你</li>
							<li>好了，开始了</li>
							<li>注册你的账号吧</li>
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
	<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/autoMail.1.0.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#email').autoMail({
				emails:['qq.com','163.com','126.com','sina.com','sohu.com','yahoo.cn','gmail.com','hotmail.com','live.cn']
			});
		});
	</script>
	
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
	

	$("#register_from").validate({
		rules:{
			name:{
				required:true,
				minlength:6,
				maxlength:12
			},
			phone:{
				required:true,
				number:true,
				minlength:11,
				maxlength:11
			},
			email:{
				required:true,
				email:true
			},
			reg_password:{
				required:true,
				minlength:6,
				maxlength:16
			},
			comfirm_reg_password:{
				required:true,
				minlength:6,
				maxlength:16,
				equalTo:"#reg_password"
			}
		},
		messages:{
			name:"请输入6-12位账户名",
			phone:"请输入正确的11位手机号",
			email:{
				required:"请输入邮箱地址！",
				email:"请输入正确的邮箱格式"
			},
			reg_password:"请输入6-16位密码",
			comfirm_reg_password:"两次密码输入不一致"
		},
		errorClass:"error_label",
		errorElement:"b"
	});
		
</script>
	
</body>
</html>