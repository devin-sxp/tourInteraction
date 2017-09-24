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
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resource/css/toastr/toastr.scss">
</head>
<body>	
	<!-- //footer -->
	<div class="footer-bottom-grids hidden">
		<!-- container -->
		<div class="container" style="margin-left: 2%;width: 96%;">
			<div class="footer-bottom-top-grids">
				<div class="col-md-4 footer-bottom-left">
					<h4>下载我们的移动APP</h4>
					<div class="d-apps">
						<ul>
							<li><a href="#"><img src="<%=contextPath%>/resource/images/app1.png" alt="" /></a></li>
							<li><a href="#"><img src="<%=contextPath%>/resource/images/app2.png" alt="" /></a></a></li>
							<li><a href="#"><img src="<%=contextPath%>/resource/images/app3.png" alt="" /></a></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 footer-bottom-left">
					<h4>后台管理</h4>
					<div class="a-cards">
						<ul>
							<li><a href="<%=contextPath%>/page/backgroundManagementMain"><img src="<%=contextPath%>/resource/images/admin.png" alt="" style="width:20%"/></a></li>
						</ul>
					</div>
			
				</div>
				<div class="col-md-4 footer-bottom-left">
					<h4>联系我们</h4>
					<div class="social">
						<ul>
							<li><a href="http://www.facebook.com" class="facebook" target="_blank"></a></li>
							<li><a href="http://www.twitter.com" class="facebook twitter" target="_blank"> </a></li>
							<li><a href="http://www.google.com" class="facebook chrome" target="_blank"> </a></li>
							<li><a href="" class="facebook dribbble"> </a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="copyright">
					<p>
						Copyright &copy; 2017.Company name All rights reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/toastr/toastr.js"></script>
<script type="text/javascript"
src="<%=contextPath%>/resource/js/common/isPhone.js"></script>
<script type="text/javascript">
	toastr.options = {
		"closeButton" : false, //是否显示关闭按钮
		"progressBar": true,
		"positionClass" : "toast-bottom-right", //弹出窗的位置
		"showDuration" : "300", //显示的动画时间
		"hideDuration" : "1000", //消失的动画时间
		"timeOut" : "3000", //展现时间

	}; 

    if(!isPhone()){
        $(".footer-bottom-grids").removeClass("hidden");
        toastr.options = {
			"closeButton" : false, //是否显示关闭按钮
			"progressBar": true,
			"positionClass" : "toast-bottom-right", //弹出窗的位置
			"showDuration" : "300", //显示的动画时间
			"hideDuration" : "1000", //消失的动画时间
			"timeOut" : "3000", //展现时间
		
		}; 
    }else{
        toastr.options = {
			"closeButton" : false, //是否显示关闭按钮
			"progressBar": true,
			"positionClass" : "toast-top-center", //弹出窗的位置
			"showDuration" : "300", //显示的动画时间
			"hideDuration" : "1000", //消失的动画时间
			"timeOut" : "3000", //展现时间
		
		}; 
    }
</script>
</html>