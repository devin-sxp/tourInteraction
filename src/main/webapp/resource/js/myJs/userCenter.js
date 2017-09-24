
var userId=$("#userId").val();
$(function() {
	getUserById(userId);
	var uploadUrl = getRootPath() + "/fileManage/uploadFile.do";
	var data = {
		fileUse : 'user_icon',
		inputFile : 'input_file' //input file标签的name值传到后台，用于后台获取file
	}
	upLoadUserIconInput("input_file", uploadUrl, data);
});


var getUserById = function(userId) {

	$.ajax({
		url : "../userManage/getUserById.do",
		type : 'post',
		data : {userId:userId},
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:通过id没有查询到信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			console.log(result)
			result = eval("("+result+")");
			$("#userName").val(result.userName);
			$("#email").val(result.email);
			$("#phone").val(result.phoneNumber);
			$("#role").val(result.roleName);
			$("#integration").val(result.integration);
			$(".user-icon").attr('src',getRootPath()+result.userIconPath);
			$("#nav_user_icon").attr('src',getRootPath()+result.userIconPath);
			updateNavUserIcon(result.userIconPath);//更新head.jsp session中icon路径
		}

	});
}

var updateNavUserIcon = function(userIconPath){
	$.post(getRootPath()+"/signTour/updateSession.do", {userIconPath:userIconPath}, function(data, textStatus, req) {
		console.info(data);
	})
}

/**
 * 修改
 * @returns
 */
function sureSave(){
	var id = userId;
	var targetUserName = $("#userName").val();
	var targetEmail = $("#email").val();
	var targetPhone = $("#phone").val();

	$.ajax({
		url : "../userManage/updateUser.do",
		type : 'post',
		data : {
					id:id,
					userName:targetUserName,
					email:targetEmail,
					phoneNumber:targetPhone,
				},
		
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:修改失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			toastr.success(eval(result));
		}

	});
}

/**
 * 修改密码
 */
$("#btn_save_password_sure").click(function(){
	if($("#input_new_password").val().trim() == $("#input_new_password_again").val().trim() && $("#input_new_password").val().trim() !=""){
		sureSavePassWord();
	}else{
		toastr.warning("请正确输入！")
	}
});

function sureSavePassWord(){
	var id = userId;

	$.ajax({
		url : "../userManage/updateUser.do",
		type : 'post',
		data : {
					id:id,
					passWord:$("#input_new_password").val().trim(),
				},
		
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:修改失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			closepop();
		},
		success : function(result) {
			toastr.success(eval(result))
		}

	});
}
