<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<!-- popular-grids -->
	<div class="popular-grids">
		<!-- container -->
		<div class="container" style="margin-left: 6%;width: 88%;">
			<div class="popular-info">
				&nbsp;
				<h3>最受欢迎</h3>
			</div>
			<!-- slider -->
			<div class="slider">
				<div class="arrival-grids">
					<ul id="flexiselDemo1">
						<li><a href="products.html"><img
								src="<%=contextPath%>/resource/images/a3.jpg" alt="" /> </a></li>
						<li><a href="products.html"><img
								src="<%=contextPath%>/resource/images/a2.jpg" alt="" /> </a></li>
						<li><a href="products.html"><img
								src="<%=contextPath%>/resource/images/a4.jpg" alt="" /> </a></li>
						<li><a href="products.html"><img
								src="<%=contextPath%>/resource/images/a1.jpg" alt="" /> </a></li>
					</ul>
					<script type="text/javascript">
						$(window).load(function() {

							var condition={
								limit:0,
								offset:4
							}
							getModule1(condition);
							
							$("#flexiselDemo1").flexisel({
								visibleItems : 4,
								animationSpeed : 1000,
								autoPlay : true,
								autoPlaySpeed : 3000,
								pauseOnHover : true,
								enableResponsiveBreakpoints : true,
								responsiveBreakpoints : {
									portrait : {
										changePoint : 480,
										visibleItems : 1
									},
									landscape : {
										changePoint : 640,
										visibleItems : 2
									},
									tablet : {
										changePoint : 768,
										visibleItems : 3
									}
								}
							});
							
						});

						var getModule1 = function(condition) {
						    $("#flexiselDemo1").empty();

							$.ajax({
								url : "<%=contextPath%>/interactionModel/getModel.do",
								type : 'post',
								data : condition,
								async: false,
								dataType : 'json',
								error : function(obj, msg) {
									var txt = "error:没有获取到模块列表信息!";
									alert(txt);
									return;
								},
								complete : function() {

								},
								success : function(result) {
//									console.log(result)
									result = eval("("+result+")");
									var html_tr ="";
								    $.each(result.list, function (objIndex, module) {
						               html_tr = html_tr + "<li><a title=\""+module.moduleName+"\" href=\"<%=contextPath%>/page/interactionNews?moduleId="+module.id+"\"><img src=\"<%=contextPath%>"+module.moduleIcon+"\" alt=\"图片暂时无法显示\" style=\"width:250px;height:150px\"/><NOBR>"+module.moduleName+"</NOBR></a></li>";
						            }); 
					                $("#flexiselDemo1").append(html_tr);

								}

							});
						}
					</script>
					<script type="text/javascript"
						src="<%=contextPath%>/resource/js/jquery.flexisel.js"></script>
				</div>
			</div>
			<!-- //slider -->
		</div>
		<!-- //container -->
	</div>
	<!-- popular-grids -->
</body>
<script type="text/javascript">
    if(isPhone()){
        $(".popular-grids").hide();
    }
</script>
</html>