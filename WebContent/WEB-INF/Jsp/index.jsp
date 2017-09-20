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
<link rel="stylesheet"
	href="<%=contextPath%>/resource/css/flexslider.css" type="text/css"
	media="screen" />
<!-- js -->
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
<!-- //js -->
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

<style type="text/css">
.td-right p {
    font-size: 1.3em;
    margin:0;
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
		<div class="container" style="margin-left: 2%;width: 96%;">
			<div class="banner-bottom-info">
				<h3>今日最热</h3>
			</div>
			<div class="banner-bottom-grids">
				<div class="col-md-4 banner-bottom-grid">
					<div class="destinations">
						<ul id="ul_todayHot">
							<li class="button"><a href="#">Goa Popular Hotels</a>
							<li class="dropdown active"><a href="products.html">
									<div class="destinations-grid">
										<img src="<%=contextPath%>/resource/images/a1.jpg" alt="" />
									</div>
									<div class="destinations-grid-info">
										<div class="destinations-hotel">Lorem ipsum dolor sit
											amet , Goa</div>
										<div class="destinations-star">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</div>
										<div class="destinations-price">$100</div>
										<div class="clearfix"></div>
									</div>
							</a></li>
							</li>
							<li class="button"><a href="#">Bangalore Popular Hotels</a>
							<li class="dropdown"><a href="products.html">
									<div class="destinations-grid">
										<img src="<%=contextPath%>/resource/images/a4.jpg" alt="" />
									</div>
									<div class="destinations-grid-info">
										<div class="destinations-hotel">Lorem ipsum dolor sit
											amet , Bangalore</div>
										<div class="destinations-star">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</div>
										<div class="destinations-price">$100</div>
										<div class="clearfix"></div>
									</div>
							</a></li>
							</li>
							<li class="button"><a href="#">Bangkok Popular Hotels</a>
							<li class="dropdown"><a href="products">
									<div class="destinations-grid">
										<img src="<%=contextPath%>/resource/images/a3.jpg" alt="" />
									</div>
									<div class="destinations-grid-info">
										<div class="destinations-hotel">Lorem ipsum dolor sit
											amet , Bangkok</div>
										<div class="destinations-star">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</div>
										<div class="destinations-price">$240</div>
										<div class="clearfix"></div>
									</div>
							</a></li>
							</li>
							<li class="button"><a href="#">Malaysia Popular Hotels</a>
							<li class="dropdown"><a href="products.html">
									<div class="destinations-grid">
										<img src="<%=contextPath%>/resource/images/a1.jpg" alt="" />
									</div>
									<div class="destinations-grid-info">
										<div class="destinations-hotel">Lorem ipsum dolor sit
											amet , Malaysia</div>
										<div class="destinations-star">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span><span
												class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</div>
										<div class="destinations-price">$320</div>
										<div class="clearfix"></div>
									</div>
							</a></li>
							</li>
						</ul>
					</div>
					<div class="choose">
						<div class="choose-info">
							<h4>积分榜单</h4>
						</div>
						<div class="choose-grids" id="div_integration_top">
							<div class="choose-grids-info">
								<div class="choose-left">
									<h5>09</h5>
									<span>Million</span>
								</div>
								<div class="choose-right">
									<a href="products.html">Aliquam faucibus vehicula vulputate</a>
									<p>Maecenas euismod tortor a tristique convallis diam eros
										aliquam.</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="choose-grids-info">
								<div class="choose-left">
									<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
								</div>
								<div class="choose-right">
									<a href="products.html">Sed tincidunt consectetur augue</a>
									<p>Nulla bibendum libero in nunc eleifend tincidunt.
										Aliquam quis molestie lectus</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="choose-grids-info">
								<div class="choose-left">
									<h6>$</h6>
								</div>
								<div class="choose-right">
									<a href="products.html">Nullam et arcu interdum, accumsan
										justo</a>
									<p>Maecenas dapibus eu purus vel imperdiet. Maecenas
										cursus, arcu sed tempus</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<div class="banner-bottom-middle" id="module_top1">
						<a href="products.html"> <img
							src="<%=contextPath%>/resource/images/a2.jpg" alt="" />
							<div class="destinations-grid-info tours">
								<h5>Book your next Malaysia holiday!</h5>
								<p>Integer eget aliquam nibh. Donec blandit volutpat libero
									id lacinia</p>
								<p class="b-period">Book Period: Now - 7 September 2015 |
									Travel Period: Now - 31 October 2015</p>
							</div>
						</a>
					</div>
					<div class="top-destinations-grids">
						<div class="top-destinations-info">
							<h4>最热地点</h4>
						</div>
						<div class="top-destinations-bottom" id="div_hot_place">
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="<%=contextPath%>/resource/images/t1.jpg" alt="" />
								</div>
								<div class="col-xs-7 td-middle">
									<a href="products.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$190</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="<%=contextPath%>/resource/images/t2.jpg" alt="" />
								</div>
								<div class="col-xs-7 td-middle">
									<a href="products.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$213</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="<%=contextPath%>/resource/images/t3.jpg" alt="" />
								</div>
								<div class="col-xs-7 td-middle">
									<a href="products.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$176</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="<%=contextPath%>/resource/images/t4.jpg" alt="" />
								</div>
								<div class="col-xs-7 td-middle">
									<a href="products.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$490</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<div class="banner-bottom-right" id="module_top2">
						<a href="products.html"> <img
							src="<%=contextPath%>/resource/images/a3.jpg" alt="" />
							<div class="destinations-grid-info tours">
								<h5>New Hotel Experiences at Your Favourite Destinations</h5>
								<p>Integer eget aliquam nibh. Donec blandit volutpat libero
									id lacinia</p>
								<p class="b-period">Book Period: Now - 7 September 2015 |
									Travel Period: Now - 31 October 2015</p>
							</div>
						</a>
					</div>
					<div class="news-grids">
						<div class="news-grids-info">
							<h4>最新信息</h4>
						</div>
						<div class="news-grids-bottom">
							<!-- date -->
							<div id="design" class="date">
								<div id="cycler">
									<!--
									<div class="date-text">
										<a href="single.html">February 15,2015</a>
										<p>Duis venenatis ac ipsum vel ultricies in placerat quam</p>
									</div>
									<div class="date-text">
										<a href="single.html">January 15,2015</a>
										<p>Pellentesque ullamcorper fringilla ipsum, ornare dapibus velit volutpat sit amet.</p>
									</div>
									<div class="date-text">
										<a href="single.html">September 24,2014</a>
										<p>In lobortis ipsum mi, ac imperdiet elit pellentesque at.</p>
									</div>
-->
								</div>
							</div>
							<!-- //date -->
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
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
	<script defer src="<%=contextPath%>/resource/js/jquery.flexslider.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/myJs/index.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/getPath.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script type="text/javascript">
		$(function() {
			/* SyntaxHighlighter.all(); */
 		});
/* 		$(window).load(function() {

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