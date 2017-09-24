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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="<%=contextPath%>/resource/css/pintuer.css">
<link rel="stylesheet" href="<%=contextPath%>/resource/css/admin.css">
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="<%=contextPath%>/resource/css/table/app.v2.css"
	type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resource/css/toastr/toastr.scss">
<style type="text/css">
.table tbody tr td {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong>
		</div>

		<table class="table table-hover text-center" id="table_news">
			<tr>
				<th width="5%">ID</th>
				<th width="5">模块ID</th>
				<th width="15%">标题</th>
				<th width="10%">标签</th>
				<th width="15%">地点</th>
				<th width="30%">操作</th>
			</tr>
			<tbody id="tbody_news">
				<tr>
					<td>1</td>
					<td><img src="" alt="" width="120" height="50" /></td>
					<td>首页焦点图</td>
					<td>描述文字....</td>
					<td>1</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
				<tr>
					<td>2</td>
					<td><img src="" alt="" width="120" height="50" /></td>
					<td>首页焦点图</td>
					<td>描述文字....</td>
					<td>1</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
				<tr>
					<td>3</td>
					<td><img src="" alt="" width="120" height="50" /></td>
					<td>首页焦点图</td>
					<td>描述文字....</td>
					<td>1</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>

			</tbody>

		</table>
		<!-- pagination -->
		<jsp:include page="../common/pagination.jsp"></jsp:include>

	</div>
	<div class="panel admin-panel margin-top" id="add" hidden>
		<div class="panel-head">
			<strong id="strong_add"><span class="icon-pencil-square-o"></span>
				查看内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>ID:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_id">ID</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>模块:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_module">模块</label>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>标题:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_title">标题</label>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>标签:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_label">标签</label>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_address">地址</label>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>内容:</label>
					</div>
					<div class="field">
						<label style="margin-top: 3px" id="label_news_content">内容</label>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="button"
							onclick="javascript:void($('#add').hide())">关闭</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script src="<%=contextPath%>/resource/js/jquery.js"></script>
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
<script src="<%=contextPath%>/resource/js/pintuer.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/myJs/newsManage.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/pagination.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/toastr/toastr.js"></script>
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