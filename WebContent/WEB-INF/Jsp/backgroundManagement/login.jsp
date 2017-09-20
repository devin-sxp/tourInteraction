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
    <title>登录</title>  
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/pintuer.css">
    <link rel="stylesheet" href="<%=contextPath%>/resource/css/admin.css">
    <script src="<%=contextPath%>/resource/js/jquery.js"></script>
    <script src="<%=contextPath%>/resource/js/jquery.validate.js"></script>
    <script src="<%=contextPath%>/resource/js/pintuer.js"></script>  

</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:120px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="<%=contextPath%>/signTour/backSignIn.do" method="post" id="loginFrom" name="loginFrom">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name" placeholder="登录账号"/>
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="登录密码"/>
                         <!--    <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" /> 验证为空-->
                            
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
               <%--      <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="<%=contextPath%>/resource/images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
                                                   
                        </div>
                    </div> --%>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
            </form>          
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
//定义验证
	$.validator.addMethod("nameLength",function(value,element,param){
		var len = value.length;
		if(len < 3 || len > 12 ){
			return false;
		}else{
			return true;
		}
	});
	$.validator.addMethod("passwordValidate",function(value,element,param){
		var len = value.length;
		if(len<3||len>16){
			return false;
		}else{
			return true;
		}
	})
	
	$("#loginFrom").validate({
		/* debug:true, *//*开启后验证是否成功都不会提交表单，未设置时，验证成功才提交  */
		rules:{
			name:{
				required:true,
				nameLength:true
			},
			password:{
				required:true,
				passwordValidate:true
			}
		},
		messages:{
			name:"请输入3-12位账户名",
			password:"请输入3-16位密码"
		}
	});
</script>
</html>