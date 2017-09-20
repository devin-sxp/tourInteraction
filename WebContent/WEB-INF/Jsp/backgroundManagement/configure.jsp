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

<title>主页配置</title>
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
			<strong class="icon-reorder">主页配置</strong>
		</div>
		<div class="padding border-bottom">
			<button type="button" id="btn_conf_pic" class="button btn-danger">
				<span class="icon-plus-square-o"></span>轮图配置
			</button>
			<button type="button" id="btn_conf_txt" class="button">
				<span class="icon-plus-square-o"></span>文本配置
			</button>

		</div>
		<table class="table table-hover text-center" id="table_conf_pic">
			<tr>
				<th width="5%">ID</th>
				<th width="25%">图标</th>
				<th width="15%">用途</th>
				<th width="25%">操作</th>
			</tr>
			<tbody id="tbody_module_pic">
				<tr>
					<td>1</td>
					<td><img src="<%=contextPath%>/resource/images/2.jpg" alt=""
						width="120" height="50" /></td>
					<td>前景</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
				<tr>
					<td>2</td>
					<td><img src="<%=contextPath%>/resource/images/2.jpg" alt=""
						width="120" height="50" /></td>
					<td>前景</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
				<tr>
					<td>3</td>
					<td><img src="<%=contextPath%>/resource/images/2.jpg" alt=""
						width="120" height="50" /></td>
					<td>前景</td>

					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
			</tbody>
		</table>

		<table class="table table-hover text-center hidden"
			id="table_conf_txt">
			<tr>
				<th width="5%">ID</th>
				<th width="25%">标题</th>
				<th width="15%">描述</th>
				<th width="25%">操作</th>
			</tr>
			<tbody id="tbody_module_txt">
				<tr>
					<td>1</td>
					<td>旅游社区</td>
					<td>一个社交网站</td>
					<td>
						<div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="panel admin-panel margin-top" id="div_conf_pic">
		<div class="panel-head">
			<strong id="strong_add"><span class="icon-pencil-square-o"></span>
				操作面板</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>ID：</label>
					</div>
					<div class="label" style="text-align: left;">
						<label id="control_id_pic"></label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<input type="file" placeholder="选择图片导入..." name="file" id="file"
							multiple="multiple" class="input tips"
							style="width: 25%; float: left;" data-toggle="hover"
							data-place="right"
							data-image="<%=contextPath%>/resource/images/2.jpg" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>用途：</label>
					</div>
					<div class="field">
						<select id="control_select_pic" class="input w50"
							name="select_role" data-validate="required:请选择角色">
							<option>前景</option>
							<option>背景</option>
						</select>
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

	<div class="panel admin-panel margin-top hidden" id="div_conf_txt">
		<div class="panel-head">
			<strong id="strong_add"><span class="icon-pencil-square-o"></span>
				操作面板</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value=""
							id="input_title_name" name="input_name"
							data-validate="required:请输入标题名" maxlength="25" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="area_discription"
							id="area_discription" style="height: 120px;" value=""
							data-validate="required:请输入描述信息" maxlength="100"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="button"
							onclick="sureSaveTxt()" id="btn_save">确定保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="<%=contextPath%>/resource/js/jquery.js"></script>
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
<script src="<%=contextPath%>/resource/js/pintuer.js"></script>
<script src="<%=contextPath%>/resource/js/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/getPath.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/myJs/configure.js"></script>
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