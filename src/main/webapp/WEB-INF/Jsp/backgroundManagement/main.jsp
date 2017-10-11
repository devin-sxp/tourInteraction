<%@page import="com.tourInteraction.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/pintuer.css">
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/admin.css">
    <script src="<%=contextPath%>/resource/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><a title="点击进入设置" href="<%=contextPath%>/page/userCenter"><img id="nav_user_icon" src="<%=contextPath%>/resource/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="个人头像" /></a>管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="<%=contextPath%>/page/homeDisplay" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
<!--   <a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
 -->  <a class="button button-little bg-red" href="<%=contextPath %>/page/backgroundLogin" onclick="signup()"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2 class="on"><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="<%=contextPath%>/page/backgroundManagementUserManage" target="right" class="on"><span class="icon-user-md"></span>用户管理</a></li>   
   
  </ul>   
 <h2><span class="icon-exclamation-circle"></span>配置</h2>
  <ul>
    <li><a href="<%=contextPath%>/page/backgroundManagementConfigure" target="right"><span class="icon-briefcase"></span>主页配置</a></li>
  
  </ul>
   <h2><span class="icon-wechat"></span>互动管理</h2>
   <ul>
 	<li><a href="<%=contextPath%>/page/backgroundManagementModuleManage" target="right"><span class="icon-bullhorn"></span>模块管理</a></li>  
    <li><a href="<%=contextPath%>/page/backgroundManagementNewsManage" target="right"><span class="icon-comments"></span>信息管理</a></li>     
  </ul>
   <h2><span class="icon-pencil-square-o"></span>文章管理</h2>
   <ul>
    <li><a href="#" target="right"><span class="icon-bell"></span>审核</a></li>
  </ul>
  <h2><span class="icon-code"></span>系统管理</h2>
   <ul>
    <li><a href="<%=contextPath%>/page/backgroundManagementRoleManage" target="right"><span class="icon-pinterest"></span>角色管理</a></li>
  </ul>
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<%=contextPath%>/page/backgroundManagementUserManage" name="right" width="100%" height="100%"></iframe>
</div>
</body>
 
<script type="text/javascript">

<%User user = new User();
user = (User) session.getAttribute("user");%>

$("#nav_user_icon").attr('src','<%if (user != null) out.print(contextPath+user.getUserIconPath());%>'.trim());


$(function() {
/* 	getSignInUser() */
})

//用于判断是否已登录
var getSignInUser = function() {
	
	$.ajax({
		url : "../signTour/getNowSignInUser.do",
		type : 'post',
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:通过id没有查询到信息!";
			alert(txt);
			return;
		},
		complete : function() {
		},
		success : function(result) {
			result = eval("("+result+")");

			console.log(result)
			if(result==null || result==""){
				window.location.href="<%=contextPath%>/page/backgroundLogin";
			}else{
				if(result.roleId != 1){
					window.location.href="<%=contextPath%>/page/backgroundLogin";
				}
			}
		
		}

	});
}

function signup(){
	$.ajax({
		url : "../signTour/signup.do",
		type : 'post'
	});
}
</script>
</html>