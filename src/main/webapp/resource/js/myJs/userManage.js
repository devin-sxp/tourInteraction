
var targetUserId = "" //修改的用户的id
var sizePage = 5 ;
$(function() {
	$("#btn_save").hide();
	$("#strong_edit").hide();
	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);
	getUserRole();
});

var getUser = function(condition) {
    $("#tbody_user").empty();

	$.ajax({
		url : "../userManage/getUser.do",
		type : 'post',
		data : condition,
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:没有获取到用户列表信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			console.log(result)
			result = eval("("+result+")");
		    $.each(result.list, function (objIndex, user) {
                var html_tr = appendUserNode(user);
                $("#tbody_user").append(html_tr);
            });
			var currentShowPageStart = eval(currentPage * sizePage + 1);
			var currentShowPageStop = eval(currentPage * sizePage + sizePage);
			
			if(result.count%sizePage == 0){
				pageTotal = parseInt(result.count/sizePage);
			}else{
				pageTotal = parseInt(result.count/sizePage + 1);

			}
			
			$("#page_count").text("showing "+ currentShowPageStart +"-"+currentShowPageStop +" of "+ result.count + "---- total page:"+pageTotal);
		}

	});
}

var appendUserNode = function(user) {
	var html_tr1 ="<tr><td>"+user.id+"</td>"+     
      "<td>"+user.userName+"</td>"+
      "<td>"+user.email+"</td>"+
      "<td>"+user.phoneNumber+"</td>"+
      "<td>"+user.roleName+"</td>"+
      "<td>"+user.integration+"</td>"+
      "<td><div class=\"button-group\">"+
      "<a class=\"button border-main\" href=\"#add\" onclick=\"getUserById("+user.id+")\"><span class=\"icon-edit\"></span> 修改</a>";
	var html_tr2 ="";
	  if(user.status == "0"){
		  html_tr2 = "<a class=\"button border-green\" href=\"javascript:void(0)\" onclick=\"lockUserById("+user.id+",1)\"><span class=\"icon-lock\">启用</span></a>";

	  }else{
		  html_tr2 = "<a class=\"button border-yellow\" href=\"javascript:void(0)\" onclick=\"lockUserById("+user.id+",0)\"><span class=\"icon-lock\">禁用</span></a>";
	  }
	var html_tr3 = "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"del("+user.id+")\"><span class=\"icon-trash-o\"></span> 删除</a>"+
				"</div></td></tr>";
	
	return html_tr1+html_tr2+html_tr3;
}

/**
 * 处理分页
 */
$("#page1").click(function() {
	currentPage = page1 - 1;
	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);
});
$("#page2").click(function() {
	currentPage = page2 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);

});
$("#page3").click(function() {
	currentPage = page3 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);

});
$("#page4").click(function() {
	currentPage = page4 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);

});
$("#page5").click(function() {
	currentPage = page5 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getUser(condition);

});


var getUserById = function(userId) {
	$("#btn_save").show();
	$("#btn_add").hide();
	$("#strong_edit").show();
	$("#strong_add").hide();
	clearForm();
	targetUserId = userId;
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
			$("#input_name").val(result.userName);
			$("#input_email").val(result.email);
			$("#input_phone").val(result.phoneNumber);
			$("#input_integration").val(result.integration);
			
		
			$("#select_role option").each( function (){
		        if($(this).text()==result.roleName){
		            $(this).attr("selected","selected");
		        }else{
				    $(this).removeAttr("selected");
		        }
		    });

		}

	});
}


/**
 * 修改
 * @returns
 */
function sureSave(){
	var id = targetUserId;
	var targetUserName = $("#input_name").val();
	var targetEmail = $("#input_email").val();
	var targetPhone = $("#input_phone").val();
	var targetIntegration = $("#input_integration").val();
	var targetRoleId = $("#select_role option:selected").val();

	$.ajax({
		url : "../userManage/updateUser.do",
		type : 'post',
		data : {
					id:id,
					userName:targetUserName,
					email:targetEmail,
					phoneNumber:targetPhone,
					integration:targetIntegration,
					roleId:targetRoleId
				},
		
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:修改失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
					limit:currentPage * sizePage,
					offset:sizePage
				}
			getUser(condition);
		},
		success : function(result) {
			toastr.success(result)
			
		}

	});
}

/**
 * 增加
 */

$("#btn_add_content").on('click',function(){
	$("#btn_save").hide();
	$("#btn_add").show();
	$("#strong_edit").hide();
	$("#strong_add").show();
	clearForm();
});

function sureAdd(){
	var targetUserName = $("#input_name").val();
	var targetEmail = $("#input_email").val();
	var targetPhone = $("#input_phone").val();
	var targetIntegration = $("#input_integration").val();
	var targetRoleId = $("#select_role option:selected").val();

	$.ajax({
		url : "../userManage/addUser.do",
		type : 'post',
		data : {
					userName:targetUserName,
					email:targetEmail,
					phoneNumber:targetPhone,
					integration:targetIntegration,
					roleId:targetRoleId
				},
		
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:增加失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
					limit:currentPage * sizePage,
					offset:sizePage
				}
			getUser(condition);
		},
		success : function(result) {
			console.log(result)
			
		}

	});
}

/**
 * 删除
 */
function del(userId){
	$.ajax({
		url : "../userManage/delUserById.do",
		type : 'post',
		data : {userId:userId},
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:通过id删除失败";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
					limit:currentPage * sizePage,
					offset:sizePage
				}
			getUser(condition);
		},
		success : function(result) {
			toastr.success(result);
			
		}
	});
}

/**
 * 锁定解锁用户
 * @param userId
 * @param status
 * @returns
 */
function lockUserById(userId,status){
	$.ajax({
		url : "../userManage/lockUserById.do",
		type : 'post',
		data : {userId:userId,status:status},
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:通过id锁定用户失败！";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
					limit:currentPage * sizePage,
					offset:sizePage
				}
			getUser(condition);
		},
		success : function(result) {
			toastr.success(result);
			
		}
	});
}

var getUserRole = function() {
	$.ajax({
		url : "../userManage/getUserRole.do",
		type : 'post',
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:没有查询到角色!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			console.log(result)
			result = eval("("+result+")");

			$.each(result,function(objIndex,role){
				$("#select_role").append("<option value=\""+role.id+"\">"+role.roleName+"</option>");
			});

		}

	});
}

function clearForm(){
	$("#input_name").val("");
	$("#input_email").val("");
	$("#input_phone").val("");
	$("#input_integration").val("");
	targetUserId="";
}
