<%@page import="java.net.CookiePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>互动区</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">


	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Custom Theme files -->
<link href="<%=contextPath%>/resource/css/style.css" type="text/css"
rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
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

</head>
<body>
	<!--header-->
	<jsp:include page="common/head.jsp"></jsp:include>
	<!--//header-->

	<!-- banner -->
	<jsp:include page="common/banner.jsp"></jsp:include>
	<!-- banner -->

	<!-- banner-bottom -->
	<div class="banner-bottom" style="padding: 1em 0 0 0">
		<!-- container -->
		<div class="panel panel-primary " style="margin-left: 2%;width: 96%; margin-bottom:0px">
			<table style="width: 100%;" align="center">
				<div class="panel-heading">
					<h3 class="panel-title">
						专题
						<%-- 			<tr height="30">
				<td style="text-indent: 5;" background="<%=contextPath%>/resource/images/classT.jpg"><b><font
						color="white">■ ${zone.name }专题</font></b></td>
			</tr> --%>
					</h3>
				</div>

				<div class="panel-body" style="padding:5px" >
					<tr style="background: #f4f7f9"><td>
							<ul class="unstyled inline" id="ul_module" style="text-align: center;">
								<%-- <li style="width: 30%; margin-left: 0px; padding: 0px;">
								<div align="center" style="margin-top: 20px;">
									<div>
										<a href="Topic_list.action?sectionId=${section.id }"><img
											style="width: 100px;" alt=""
											src="${pageContext.request.contextPath}/${section.logo }"></a>
									</div>
									<div style="margin: 10px auto;">
										<a href="Topic_list.action?sectionId=${section.id }">
										<font style="font-size: 30px; font-weight: bold;">${section.name }</font></a>
									</div>
									<font style="font-size: 12px;">帖子总数：${sectionTopicCount.get(section) }</font>
									<font style="font-size: 12px;">精华帖子：${sectionGoodTopicCount.get(section) }</font>
									<font style="font-size: 12px;">未回复：${sectionNoReplyTopicCount.get(section) }</font>
									<font style="font-size: 12px;">版主：${section.master.nickName }</font>
								</div>
							</li> --%>
							</ul>
					</td></tr>
				</div>
			<tr height="25">
				<td style="text-indent: 10" background=""><font
					color="#F9F9F9)">论坛介绍：${zone.description }</font></td>
			</tr>
		</table>
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
	<script defer src="<%=contextPath%>/resource/js/jquery.flexslider.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/myJs/interactionModel.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/getPath.js"></script>
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
</body>
</html>