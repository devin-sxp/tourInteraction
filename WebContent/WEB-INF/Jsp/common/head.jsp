<%@page import="com.tourInteraction.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.top_menu {
	background: gold
}
</style>

</head>
<body>
	<!-- floatmenu -->
	<jsp:include page="floatmenu.jsp"></jsp:include>
	<!-- floatmenu -->
	<div class="header">
		<div class="container" style="margin-left: 2%;width: 96%;">
			<div class="header-grids">
				<div class="logo">
					<h1>
						<a href="<%=contextPath%>/page/homeDisplay"><span>Tour</span>Interaction</a>
					</h1>
				</div>
				<!--navbar-header-->
				<div class="header-dropdown hidden">
					<div class="emergency-grid">
						<ul>
							<li>服务电话:</li>
							<li class="call">+1 234 567 8901</li>
							<div id="div_user_center" class="pull-right hidden">
								<a class="btn btn-success"
									href="<%=contextPath%>/page/userCenter"><span>个人中心</span></a>
							</div>
							<li class="call">${msg}</li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>

			</div>
			<div class="nav-top">
				<div class="top-nav" style="position: absolute;z-index: 1;">
					<span class="menu"><img
						src="<%=contextPath%>/resource/images/menu.png" alt="" /></span>
					<ul class="nav1">
						<li id="li_index"
							style="width: 25%; margin-right: 5%; margin-left: 0%"><a
							href="<%=contextPath%>/page/homeDisplay"
							style="text-align: center;" class="top_menu">首页</a></li>
						<li id="li_interaction"
							style="width: 25%; margin-right: 5%;  margin-left: 0% "><a
							href="<%=contextPath%>/page/interactionModel"
							style="text-align: center;" class="top_menu">互动区</a></li>
						<li id="li_article" style="width: 25%; margin-left: 0% "><a
							href="<%=contextPath%>/page/article" style="text-align: center;"
							class="top_menu">文章区</a></li>
					</ul>
					<div class="clearfix"></div>
					<!-- script-for-menu -->
					<script>
						$("span.menu").click(function() {
							$("ul.nav1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>
					<!-- /script-for-menu -->
				</div>

				<div class="dropdown-grids">

					<div id="div_loginup" style="padding: 0.35em;" hidden>${user.getUserName()}已登录<button
							class="btn-danger" id="btn_loginup">注销</button>
					</div>
					<input type="hidden" id="userId" value="${user.getId()}" />
					<div id="loginContainer">
						<a id="loginButton"><span>登录</span></a>
						<div id="loginBox">
							<form id="loginForm" method="post">
								<div class="login-grids">
									<div class="login-grid-left">
										<fieldset id="body">
											<fieldset>
												<label for="name">用户名</label> <input type="text" name="name"
													id="name" value="" maxlength="10">
											</fieldset>
											<fieldset>
												<label for="password">密码</label> <input type="password"
													name="password" id="password" value="" maxlength="16">
											</fieldset>
											<input type="button" id="login" value="登录"> <label
												for="checkbox"><input type="checkbox"
												name="checkbox_save_password" id="checkbox_save_password">
												<i>记住</i></label>
										</fieldset>
										<span><a href="#">忘记密码?</a></span>
										<div class="or-grid">
											<p>或</p>
										</div>
										<div class="social-sits">
											<div class="facebook-button">
												<a href="#">Connect with Facebook</a>
											</div>
											<div class="chrome-button">
												<a href="#">Connect with Google</a>
											</div>
											<div class="button-bottom">
												<p>
													创建新账号? <a href="<%=contextPath%>/page/register">注册</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div id="header_hide" class="hidden"></div>

</body>
<!--pop-up 登录弹窗-->
<script src="<%=contextPath%>/resource/js/menu_jquery.js"></script>
<!--//pop-up-->
<script src="<%=contextPath%>/resource/js/modernizr.custom.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/getPath.js"></script>

<script src="<%=contextPath%>/resource/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/script.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/isPhone.js"></script>
<script src="<%=contextPath%>/resource/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript">
	if (!isPhone()) {
		$(".header-dropdown").removeClass("hidden");
	} else {
		$(".header").css({
			'position' : 'fixed',
			'z-index' : '1',
			'background-color' : 'cadetblue',
			'width' : '100%',
			'min-height' : '0px'
		});
		$(".header-grids").hide();
		$(".nav-top").css({
			'margin-top' : '-15px',
			'margin-bottom' : '5px'
		});
		$(".container").css({
			'padding-left' : '0px',
			'padding-right' : '0px'
		});
		$("#header_hide").css({
			'height' : $('.header').height()
		});
		$("#header_hide").removeClass("hidden")

		$("#loginContainer").css({
			'top' : '3px'
		});
	}
</script>
<script type="text/javascript">
	$(function() {
		if($("#userId").val() != null && $("#userId").val() !="" ){
			$("#div_user_center").removeClass("hidden");

		}
	})
	<%User user = new User();
			user = (User) session.getAttribute("user");%>
	
	if("<%if (user != null)
				out.print(user.getUserName());%>".trim() != "" && "<%if (user != null)
				out.print(user.getUserName());%>".trim() != null) {
		
		$('#loginContainer').hide();
		$('#div_loginup').show();

	} else {
		$('#loginContainer').show();
		$('#div_loginup').hide();

	}
	
	//登录
	$("#login").click(function(){
		$.post("<%=contextPath%>/signTour/loginIn.do",
				  {
					  name:$("#name").val(),
		        	  password:$("#password").val(),
		        	  checkbox_save_password:$("#checkbox_save_password").val()
	        	   },
	        	   function(result){
	        	       result = eval(result);
		        	   if(result == "success"){
		        	   	    window.location.reload()
		        	   
		        	   }else{
		        	   		toastr.error("用户名或密码错误！请重新登录！");
		        	   }
	        	   });
<%-- 	$.ajax({
	        url:"<%=contextPath%>/signTour/loginIn.do",
	        type: 'post',
	        data:{name:$("#name").val(),
	        	  password:$("#password").val(),
	        	  checkbox_save_password:$("#checkbox_save_password").val()
	        	   },
	        dataType: 'json',
	        error: function (obj, msg) {
	       
	        },
	        complete: function () {

	        },
	        success: function (result) {
        		window.location.reload()
	        }
	          
	    }); --%>
	});
	
	//注销
	$("#btn_loginup").click(function() {
	  $.ajax({
	        url:"<%=contextPath%>/signTour/signup.do",
	        type: 'post',
	        data:{sin:"<%out.print(session);%>"},
	        dataType: 'text',
	        error: function (obj, msg) {
	       
	        },
	        complete: function () {

	        },
	        success: function (result) {
        	
	        }
	          
	    });
	 	window.location.reload()
	});
	
	$("#loginButton").click(function(){
		if(isPhone()){
			window.location.href = "<%=contextPath%>/page/appWebLogin"
	    }
	});
	
</script>
</html>