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
<link href="<%=contextPath%>/resource/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resource/css/toastr/toastr.scss">
<link rel="stylesheet" href="<%=contextPath%>/resource/css/admin.css">
<link rel="stylesheet" href="<%=contextPath%>/resource/css/zTreeStyle/zTreeStyle.css">

<style type="text/css">
.table tbody tr td {
	vertical-align: middle;
}
.ztree {

    float: left;
    border: dashed;
    border-radius: 10px;
    width: 50%;
    overflow: auto;

} 
</style>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 角色列表</strong>
		</div>
		<div class="padding border-bottom">
			<button type="button" id="btn_add_role"
				class="button border-yellow" onclick="window.location.href='#add'">
				<span class="icon-plus-square-o"></span> 添加角色
			</button>

		</div>
		<table class="table table-hover text-center" id="table_user">
			<tr>
				<th width="25%">ID</th>
				<th width="25%">角色名</th>
				<th width="50%">操作</th>
			</tr>
			<tbody id="tbody_user">
				<tr>
					<td>1</td>
					<td>首页焦点图</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> 
							
							<a class="button border-yellow"
								href="javascript:void(0)" onclick=""><span
								class="icon-lock"></span> 设置权限</a>
								
							<a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>
				<tr>
					<td>2</td>
					<td>首页焦点图</td>
					<td><div class="button-group">
							<a class="button border-main" href="#add"><span
								class="icon-edit"></span> 修改</a> 
							
							<a class="button border-yellow"
								href="javascript:void(0)" onclick=""><span
								class="icon-lock"></span> 设置权限</a>
								
							<a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1)"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>

			</tbody>

		</table>


	</div>

	<div class="panel admin-panel margin-top" id="control">
		<div class="panel-head hidden">
			<strong id="strong_add"><span class="icon-pencil-square-o"></span>
				增加角色</strong>
		</div>
		<div class="panel-head hidden">
			<strong id="strong_set_privilege"><span class="icon-pencil-square-o"></span>
				设置权限</strong>
		</div>
		<div class="panel-head hidden">
			<strong id="strong_edit"><span class="icon-pencil-square-o"></span>
				修改角色</strong>
		</div>
		<div id="add_or_edit_panel" class="body-content hidden">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					
					<div class="label">
						<label>角色名：</label>
					</div>
					<div class="field">
						<input type="hidden" id="input_role_id">
						<input type="text" class="input w50" value="" id="input_role_name"
							name="input_name" data-validate="required:请输入角色名" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o hidden" type="button"
							id="btn_save">确定保存</button>
						<button class="button bg-main icon-check-square-o hidden" type="button"
							id="btn_add">确定增加</button>
					</div>
				</div>
			</form>
		</div>
		
		<div id="div_privilege_panel" class="body-content hidden" style="margin: 0 20% 0 10%;">
			<img id="img_loading" style="float: left;height: 30px;margin-right: 20px;" src="<%=contextPath %>/resource/css/zTreeStyle/img/loading.gif"/>
		
			<ul id="privilege_tree" class="ztree"></ul>
			<div class="field" style="float:right">
				<button class="button bg-main icon-check-square-o" type="button"
					id="sure_save_privilege">保存设置</button>
			</div>
		</div>
	</div>
</body>
<script src="<%=contextPath%>/resource/js/jquery.js"></script>
<script src="<%=contextPath%>/resource/js/jquery.min.js"></script>
<script src="<%=contextPath%>/resource/js/pintuer.js"></script>
<script src="<%=contextPath%>/resource/js/common/getPath.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/zTree/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/myJs/roleManage.js"></script>

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