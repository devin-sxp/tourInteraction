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
</head>
<body>	
	<!-- banner -->
	<div class="banner" style="width: 96%;margin-left:2%">
		<!-- container -->
		<div class="container" style="margin-left: 2%;width: 96%;">
			<div class="col-md-4 banner-left">
				<section class="slider2">
				<div class="flexslider">
					<ul class="slides" id="ul_image_pre">
						<li>
							<div class="slider-info">
								<img src="<%=contextPath%>/resource/images/1.jpg" alt="">
							</div>
						</li>
						<li>
							<div class="slider-info">
								<img src="<%=contextPath%>/resource/images/2.jpg" alt="">
							</div>
						</li>
						<li>
							<div class="slider-info">
								<img src="<%=contextPath%>/resource/images/3.jpg" alt="">
							</div>
						</li>
						<li>
							<div class="slider-info">
								<img src="<%=contextPath%>/resource/images/4.jpg" alt="">
							</div>
						</li>
						<li>
							<div class="slider-info">
								<img src="<%=contextPath%>/resource/images/2.jpg" alt="">
							</div>
						</li>
					</ul>
				</div>
				</section>
				<!--FlexSlider-->
			</div>

			<div class="col-md-8 banner-right">
				<div class="sap_tabs">
					<div class="booking-info" id = "div_title_description">
						<h1 style="color: aqua;">旅游社区</h1>
						<h2 style="color: burlywood; margin:10px">一个旅游爱好者信息互动的网站</h2>
					</div>
					<%-- <div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<ul class="resp-tabs-list">
							<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>往返</span></li>
							<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>单程</span></li>
							<div class="clearfix"></div>
						</ul>
						<!---->
						<div class="resp-tabs-container">
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="facts">
									<div class="booking-form">
										<!---strat-date-piker---->
										<script>
											$(function() {
												$("#datepicker,#datepicker1")
														.datepicker();
											});
										</script>
										<!---/End-date-piker---->
										<!-- Set here the key for your domain in order to hide the watermark on the web server -->

										<div class="online_reservation">
											<div class="b_room">
												<div class="booking_room">
													<div class="reservation">
														<ul>
															<li class="span1_of_1 desti">
																<h5>出发地</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-map-marker"
																			aria-hidden="true"></span> <input type="text"
																			placeholder="出发地"
																			class="typeahead1 input-md form-control tt-input"
																			required="">
																	</form>
																</div>
															</li>
															<li class="span1_of_1 left desti">
																<h5>目的地</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-map-marker"
																			aria-hidden="true"></span> <input type="text"
																			placeholder="目的地"
																			class="typeahead1 input-md form-control tt-input"
																			required="">
																	</form>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
													<div class="reservation">
														<ul>
															<li class="span1_of_1">
																<h5>出发日期</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-calendar"
																			aria-hidden="true"></span> <input type="date"
																			value="Select date" onFocus="this.value = '';"
																			onBlur="if (this.value == '') {this.value = 'Select date';}">
																	</form>
																</div>
															</li>
															<li class="span1_of_1 left">
																<h5>返回日期</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-calendar"
																			aria-hidden="true"></span> <input type="date"
																			value="Select date" onFocus="this.value = '';"
																			onBlur="if (this.value == '') {this.value = 'Select date';}">
																	</form>
																</div>
															</li>
															<li class="span1_of_1 left adult">
																<h5>成人 (18+)</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">1</option>
																		<option value="null">2</option>
																		<option value="AX">3</option>
																		<option value="AX">4</option>
																		<option value="AX">5</option>
																		<option value="AX">6</option>
																	</select>
																</div>
															</li>
															<li class="span1_of_1 left children">
																<h5>未成年 (0-17)</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">1</option>
																		<option value="null">2</option>
																		<option value="AX">3</option>
																		<option value="AX">4</option>
																		<option value="AX">5</option>
																		<option value="AX">6</option>
																	</select>
																</div>
															</li>
															<li class="span1_of_1 economy">
																<h5>等级</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">经济舱</option>
																		<option value="null">头等舱</option>
																	</select>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
													<div class="reservation">
														<ul>
															<li class="span1_of_3">
																<div class="date_btn">
																	<form>
																		<input type="submit" value="查询" />
																	</form>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<!---->
									</div>
								</div>
							</div>
							<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
								<div class="facts">
									<div class="booking-form">
										<!---strat-date-piker---->
										<link rel="stylesheet" href="<%=contextPath%>/resource/css/jquery-ui.css" />
										<script src="<%=contextPath%>/resource/js/jquery-ui.js"></script>
										<script>
											$(function() {
												$("#datepicker,#datepicker1")
														.datepicker();
											});
										</script>

										<!---/End-date-piker---->
										<div class="online_reservation">
											<div class="b_room">
												<div class="booking_room">
													<div class="reservation">
														<ul>
															<li class="span1_of_1 desti">
																<h5>Flying from</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-map-marker"
																			aria-hidden="true"></span> <input type="text"
																			placeholder="Type Departure City"
																			class="typeahead1 input-md form-control tt-input"
																			required="">
																	</form>
																</div>
															</li>
															<li class="span1_of_1 left desti">
																<h5>Flying to</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-map-marker"
																			aria-hidden="true"></span> <input type="text"
																			placeholder="Type Destination City"
																			class="typeahead1 input-md form-control tt-input"
																			required="">
																	</form>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
													<div class="reservation">
														<ul>
															<li class="span1_of_1">
																<h5>Departure</h5>
																<div class="book_date">
																	<form>
																		<span class="glyphicon glyphicon-calendar"
																			aria-hidden="true"></span> <input type="date"
																			value="Select date" onFocus="this.value = '';"
																			onBlur="if (this.value == '') {this.value = 'Select date';}">
																	</form>
																</div>
															</li>
															<li class="span1_of_1 left">
																<h5>Adults (18+)</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">1</option>
																		<option value="null">2</option>
																		<option value="AX">3</option>
																		<option value="AX">4</option>
																		<option value="AX">5</option>
																		<option value="AX">6</option>
																	</select>
																</div>
															</li>
															<li class="span1_of_1 left tab-children">
																<h5>Children (0-17)</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">1</option>
																		<option value="null">2</option>
																		<option value="AX">3</option>
																		<option value="AX">4</option>
																		<option value="AX">5</option>
																		<option value="AX">6</option>
																	</select>
																</div>
															</li>
															<li class="span1_of_1 economy">
																<h5>Class</h5> <!----------start section_room----------->
																<div class="section_room">
																	<select id="country"
																		onChange="change_country(this.value)"
																		class="frm-field required">
																		<option value="null">Economy</option>
																		<option value="null">Business</option>
																	</select>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
													<div class="reservation">
														<ul>
															<li class="span1_of_3">
																<div class="date_btn">
																	<form>
																		<input type="submit" value="Search" />
																	</form>
																</div>
															</li>
															<div class="clearfix"></div>
														</ul>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner -->
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common/getPath.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/myJs/banner.js"></script>

<link rel="stylesheet" href="<%=contextPath%>/resource/css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript" src="<%=contextPath%>/resource/js/jquery.flexslider.js"></script>
</html>