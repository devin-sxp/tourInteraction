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
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">  
  <button type="button" id="btn_add_content" class="button border-yellow" onclick="window.location.href='#add'"><span class="icon-plus-square-o"></span> 添加专题</button>
 
  </div>
  <table class="table table-hover text-center" id="">
    <tr>
      <th width="3%">ID</th>
      <th width="8">图标</th>
      <th width="9%">名称</th>
      <th width="15%">描述</th>
      <th width="10%">创建类型</th>
      <th width="15%">创建时间</th>
      <th width="25%">操作</th>
    </tr>
   	<tbody id="tbody_article_subject">

   	</tbody>
   
  </table>
  <!-- pagination -->
  <jsp:include page="../common/pagination.jsp"></jsp:include>
</div>

<div class="panel admin-panel margin-top" id="add">
  <div class="panel-head"><strong id="strong_add"><span class="icon-pencil-square-o"></span> 操作面板</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">    
       <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" id="input_subject_name" name="input_name" data-validate="required:请输入名称！" maxlength="25"/>
          <div class="tips"></div>
        </div>
      </div>
 	  <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="file" placeholder="选择图片导入..." name="file" id="file" multiple="multiple" class="input tips" style="width:25%; float:left;" data-toggle="hover" data-place="right" data-image="<%=contextPath%>/resource/images/2.jpg" />
      <!--     <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片尺寸：1920*500</div> -->
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="area_discription" id="area_discription" style="height:120px;" value="" maxlength="100"></textarea>
          <div class="tips"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>创建类型：</label>
        </div>
    	<div class="field">
          <input type="text" class="input w50" value="" id="input_subject_type" disabled/>
          <div class="tips"></div>
        </div>
      </div>
   
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="sureSave()" id="btn_save">确定保存</button>
          <button class="button bg-main icon-check-square-o" type="button" onclick="sureAdd()" id="btn_add">确定增加</button>
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
	<script type="text/javascript" src="<%=contextPath%>/resource/js/myJs/articleSubjectManage.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resource/js/common/pagination.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/common/getPath.js"></script>
<script type="text/javascript"
        src="<%=contextPath%>/resource/js/common/convertTime.js"></script>
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