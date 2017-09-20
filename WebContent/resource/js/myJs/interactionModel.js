/**
 * 
 */

$(function() {

	var condition = {
	
	}
	getModel(condition);
});

var getModel = function(condition) {
    $("#ul_module").empty();

	$.ajax({
		url : "../interactionModel/getModel.do",
		type : 'post',
		data : condition,
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:没有查询到符合条件的信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			result = eval("("+result+")");
		    $.each(result.list, function (objIndex, interactionModel) {
                var html_ul = appendInteractionModel(interactionModel);
                $("#ul_module").append(html_ul);
            });
			
		}

	});
}

var appendInteractionModel = function(interactionModel) {
	 if(!isPhone()){
		var html_ul = "<li style=\"background-color: navajowhite;width: 220px; margin: 5px; padding: 0px; display: inline-block;\">"
			+"<div align=\"center\" style=\"margin-top: 20px;\">"
			+"<div><a title=\""+interactionModel.moduleDiscription+"\" href=\""+getRootPath()+"/page/interactionNews?moduleId="+interactionModel.id+"\"><img style=\"width: 100px;height:55px\" alt=\"\" src=\""+getRootPath()+interactionModel.moduleIcon+"\"></a></div>"
			+"<div style=\"margin: 10px auto;\"><a href=\"interactionNews?moduleId="+interactionModel.id+"\">" 
			+"<font style=\"font-size: 30px; font-weight: bold;\">"+interactionModel.moduleName+"</font></a></div>"
			+"<font style=\"font-size: 12px;\">版主："+interactionModel.createUserName+"</font></div></li>"
		
		return html_ul;
	 }else{
		var html_ul = "<li style=\"background-color: navajowhite;width: 100%; margin-bottom: 5px; padding: 0px; display: inline-block;\">"
			+"<div align=\"center\" style=\"margin-top: 20px;\">"
			+"<div class=\"pull-left\" style=\"margin-left: 5px;\"><a title=\""+interactionModel.moduleDiscription+"\" href=\""+getRootPath()+"/page/interactionNews?moduleId="+interactionModel.id+"\"><img style=\"width: 100px;height:55px\" alt=\"\" src=\""+getRootPath()+interactionModel.moduleIcon+"\"></a></div>"
			+"<div style=\"margin: 10px auto;\"><a href=\"interactionNews?moduleId="+interactionModel.id+"\">" 
			+"<font style=\"font-size: 30px; font-weight: bold;\">"+interactionModel.moduleName+"</font></a></div>"
			+"<font style=\"font-size: 12px;\">版主："+interactionModel.createUserName+"</font></div></li>"
		
		return html_ul;
	 }
}