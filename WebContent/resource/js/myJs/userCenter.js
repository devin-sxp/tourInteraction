
var userId=$("#userId").val();
$(function() {
	getUserById(userId);
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
		
		}

	});
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
			console.log(result)
			toastr.success(result)
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
			console.log(result)
			toastr.success(result)
		}

	});
}
