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
<title></title>
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/pintuer.css">
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/admin.css">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/table/app.v2.css"
	type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" type="text/css"	href="<%=contextPath%>/resource/css/toastr/toastr.scss">
<style type="text/css">
	.table tbody tr td {
		vertical-align: middle;
	}
</style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 请求列表</strong></div>
  <table class="table table-hover text-center" id="">
    <tr>
        <th width="16%">图标</th>
        <th width="9%">知识标题</th>
        <th width="15%">请求投稿专题(栏目)</th>
        <th width="10%">请求人</th>
        <th width="15%">请求时间</th>
        <th width="25%">操作</th>
    </tr>
   	<tbody id="tbody_article_request_submit_list">

   	</tbody>
   
  </table>
</div>

</body>
    <script src="<%=contextPath%>/resource/js/jquery.js"></script>
    <script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
	<script src="<%=contextPath%>/resource/js/pintuer.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/common/getPath.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/toastr/toastr.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resource/js/myJs/articleRequestSubmitManage.js"></script>

<script type="text/javascript">
	toastr.options = {
		"closeButton" : false, //是否显示关闭按钮
		"progressBar": true,
		"positionClass" : "toast-bottom-right", //弹出窗的位置
		"showDuration" : "300", //显示的动画时间
		"hideDuration" : "1000", //消失的动画时间
		"timeOut" : "3000", //展现时间
	}; 
</script>
</html>