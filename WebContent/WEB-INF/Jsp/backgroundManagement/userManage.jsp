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
		<div class="padding border-bottom">
			<button type="button" id="btn_add_content"
				class="button border-yellow" onclick="window.location.href='#add'">
				<span class="icon-plus-square-o"></span> 添加用户
			</button>

		</div>
		<table class="table table-hover text-center" id="table_user">
			<tr>
				<th width="5%">ID</th>
				<th width="15">用户名</th>
				<th width="15%">邮箱</th>
				<th width="15%">电话</th>
				<th width="10%">角色</th>
				<th width="15%">积分</th>
				<th width="25%">操作</th>
			</tr>
			<tbody id="tbody_user">
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

	<div class="panel admin-panel margin-top" id="add">
		<div class="panel-head">
			<strong id="strong_add"><span class="icon-pencil-square-o"></span>
				增加内容</strong>
		</div>
		<div class="panel-head">
			<strong id="strong_edit"><span class="icon-pencil-square-o"></span>
				修改内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>用户名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" id="input_name"
							name="input_name" data-validate="required:请输入用户名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>邮箱：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" id="input_email"
							name="input_email" data-validate="required:请输入邮箱" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" id="input_phone"
							name="input_phone" data-validate="required:请输入电话" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>角色：</label>
					</div>
					<div class="field">
						<select id="select_role" class="input w50" name="select_role"
							data-validate="required:请选择角色">

						</select>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>积分：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value=""
							id="input_integration" name="input_integration"
							data-validate="required:请输入积分" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="button"
							onclick="sureSave()" id="btn_save">确定保存</button>
						<button class="button bg-main icon-check-square-o" type="button"
							onclick="sureAdd()" id="btn_add">确定增加</button>
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
	src="<%=contextPath%>/resource/js/myJs/userManage.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/pagination.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/toastr/toastr.js"></script>
<script type="text/javascript">
	toastr.options = {
		"closeButton" : false, //是否显示关闭按钮
		"progressBar" : true,
		"positionClass" : "toast-bottom-right", //弹出窗的位置
		"showDuration" : "300", //显示的动画时间
		"hideDuration" : "1000", //消失的动画时间
		"timeOut" : "3000", //展现时间

	};
</script>
</html>