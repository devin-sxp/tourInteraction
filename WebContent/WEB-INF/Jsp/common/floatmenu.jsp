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
<style type="text/css">
/* reset */


/*** guide ***/
.guide{z-index: 100;width:60px;right:10px;position:fixed;bottom:2%;_position:absolute;_top:expression(documentElement.scrollTop+documentElement.clientHeight - this.clientHeight - 134+'px');display:block;}
.guide a{display:block;width:60px;height:50px;background:url(<%=contextPath %>/resource/images/floatmenu/sprite_v2.png) no-repeat;margin-top:10px;text-decoration:none;font:16px/50px "Microsoft YaHei";text-align:center;color:#fff;border-radius:2px;}
.guide a span{display:none;text-align:center;}
.guide a:hover{text-decoration:none;background-color:#39F;color:#fff;}
.guide a:hover span{display:block;width:60px;background:#39F}
.guide .find{background-position:-84px -236px;}
.guide .report{background-position:-146px -236px;}
.guide .edit{background-position:-83px -185px;}
.guide .top{background-position:-145px -185px;}
.guide .to_back{background:url(<%=contextPath %>/resource/images/floatmenu/back.png) no-repeat;background-color: darkgray; background-size: 50%;
    background-position: center;}
.guide .to_forward{background:url(<%=contextPath %>/resource/images/floatmenu/forward.png) no-repeat;background-color: darkgray; background-size: 50%;
    background-position: center;}
.guide .to_menu{background:url(<%=contextPath %>/resource/images/floatmenu/menu.png) no-repeat;background-color: darkgray; background-size: 50%;
    background-position: center;}
.guide .to_user{background:url(<%=contextPath %>/resource/images/floatmenu/user.png) no-repeat;background-color: darkgray; background-size: 50%;
background-position: center;}
</style>

</head>
<body>

<div class="guide">
	<div class="guide-wrap">
		<a id="a_top" href="javascript:window.scrollTo(0,0)" class="top" title="回顶部"><span>回顶部</span></a>
		<a id="a_back" href="javascript:history.go(-1);" class="to_back" ><span>返回</span></a>
		<a id="a_forward" href="javascript:history.go(1);" class="to_forward" ><span>前进</span></a>		
		<a id="a_search" href="#" class="find" title="找论坛"><span>搜索</span></a>
		<a id="a_user" href="<%=contextPath %>/page/userCenter" class="to_user hidden" title="个人中心"><span>个人</span></a>
		<a id="a_menu" class="to_menu" title="显示隐藏"><span>隐藏</span></a>
	</div>
</div>

</body>
<script type="text/javascript">
$("#a_menu").toggle(
  function () {
    $("#a_back").hide("fast");
    $("#a_forward").hide("fast");
    $("#a_user").hide("fast");
    $("#a_search").hide("fast");
    $("#a_top").hide("fast");
    $("#a_menu span").text("显示");
  },
  function () {
    $("#a_back").show("fast");
    $("#a_forward").show("fast");
    $("#a_user").show("fast");
    $("#a_search").show("fast");
    $("#a_top").show("fast"); 
    $("#a_menu span").text("隐藏");
    
   }
);
  function isShowUserCenter(){
    <%User user = new User();
	user = (User) session.getAttribute("user");%>
	if("<%if (user != null)
				out.print(user.getUserName());%>".trim() != "" && "<%if (user != null)
				out.print(user.getUserName());%>".trim() != null) {
    	$("#a_user").removeClass("hidden");
    	
	}
  }
 isShowUserCenter();

</script>
</html>