<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pagination</title>

</head>
<body>
<footer class="panel-footer">
		<div class="row">
			<div class="col-sm-4 hidden-xs">
				
			</div>
			<div class="col-sm-4 text-center">
				<small class="text-muted inline m-t-sm m-b-sm" id="page_count">showing 20-30
					of 50 items</small>
			</div>
			<div class="col-sm-4 text-right text-center-xs">
				<ul class="pagination pagination-sm m-t-none m-b-none">
					<li><a id="page_pre"><i class="fa fa-chevron-left" style="line-height:inherit"></i></a></li>
					<li><a id="page1">1</a></li>
					<li><a id="page2">2</a></li>
					<li><a id="page3">3</a></li>
					<li><a id="page4">4</a></li>
					<li><a id="page5">5</a></li>
					<li><a id="page_next"><i class="fa fa-chevron-right" style="line-height:inherit"></i></a></li>
				</ul>
			</div>
		</div>
</footer> 
</body>
</html>