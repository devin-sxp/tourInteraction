/**
 * 
 */
var moduleId = "";
$(function() {
	$("#btn_save").hide();

	var condition={
			
	}
	getModule(condition);
});

var getModule = function(condition) {
    $("#tbody_module").empty();

	$.ajax({
		url : "../interactionModel/getModel.do",
		type : 'post',
		data : condition,
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:没有获取到模块列表信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {

		},
		success : function(result) {
			console.log(result)
			result = eval("("+result+")");
		    $.each(result.list, function (objIndex, module) {
                var html_tr = appendModuleNode(module);
                $("#tbody_module").append(html_tr);
            });
		}

	});
}

var appendModuleNode = function(module) {
	var html_tr ="<tr><td>"+module.id+"</td>"+     
	  "<td><img src=\""+getRootPath()+module.moduleIcon+"\" alt=\"暂未获取到图片\" width=\"120\" height=\"50\" /></td>"+ 
      "<td>"+module.moduleName+"</td>"+
      "<td>"+module.moduleDiscription+"</td>"+
      "<td>"+module.moduleLabel+"</td>"+
      "<td><div class=\"button-group\">"+
      "<a class=\"button border-main\" href=\"#add\" onclick=\"getModuleById("+module.id+")\"><span class=\"icon-edit\"></span>修改</a>"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"delModuleById("+module.id+")\"><span class=\"icon-trash-o\"></span> 删除</a>"+
      "<input name=\"user_id\" type=\"hidden\" value=\""+module.id+"\"/>"+
      "</div></td></tr>";
	return html_tr;
}

var getModuleById = function(id) {
	$("#btn_save").show();
	$("#btn_add").hide();
	moduleId=""
	clearForm();
	$.ajax({
		url : "../interactionModel/getModuleById.do",
		type : 'post',
		data : {id:id},
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
			moduleId=result.id;
			$("#input_module_name").val(result.moduleName);
			$("#file").attr("data-image",getRootPath()+result.moduleIcon);
			$("#area_discription").val(result.moduleDiscription);
			$("#input_module_label").val(result.moduleLabel);
			
		}

	});
}


/**
 * 删除
 * @returns
 */
function delModuleById(id){
	
	$.ajax({
		url : "../interactionModel/delModuleById.do",
		type : 'post',
		data : {
			id:id
		},
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:删除失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
	
			}
			getModule(condition);
		},
		success : function(result) {
			toastr.success(result)
			
		}
		
	});
}

/**
 * 确定修改
 * @returns
 */
function sureSave(){

    var data = $("#file").val();

    if($("#input_module_name").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#area_discription").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#input_module_label").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    
    if(data==null || data==''){
    	var data = {
    		id:moduleId,
			moduleName:	$("#input_module_name").val(),
			moduleDiscription:$("#area_discription").val(),
			moduleLabel:$("#input_module_label").val(),
			moduleIcon:""
    	}
    		updateModule(data)
    }else{
    	importConfigure(1);
    }

}

/**
 * 上传文件
 * @param data
 */
var importConfigure = function (action) {
    var fileUrl="";

    $.ajaxFileUpload({
        url:"../interactionModel/uploadFile.do",       //后台需要走的action
        secureuri:false,
        type: 'POST',
        async:false,
        fileElementId:'file',                            //文件选择框的id属性
		dataType : 'text',
        enctype:'multipart/form-data',
        success: function (data, textStatus) {               
            fileUrl = data.replace(/\"/g, "")
            console.log(fileUrl);
        	if(action == 1){
        		var data = {
            		id:moduleId,
        			moduleName:	$("#input_module_name").val(),
        			moduleDiscription:$("#area_discription").val(),
        			moduleLabel:$("#input_module_label").val(),
        			moduleIcon:fileUrl
        		}
        		updateModule(data)
        	}else{
        		var data = {
        			moduleName:	$("#input_module_name").val(),
        			moduleDiscription:$("#area_discription").val(),
        			moduleLabel:$("#input_module_label").val(),
        			moduleIcon:fileUrl
            	}
        		addModule(data)
        	}
            
        },
        error: function (data, status, e) {           //相当于java中catch语句块的用法
            toastr.error("上传失败哦！");
        },
        complete:function () {
        
        }

    });

};

function updateModule(data){
	$.ajax({
		url : "../interactionModel/updateModule.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:修改模块失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={

				}
			getModule(condition);
		},
		success : function(result) {
			toastr.success(result)
			
		}

	});
} 

/**
 * 增加
 * @param data
 * @returns
 */
$("#btn_add_content").click(function(){
	$("#btn_save").hide();
	$("#btn_add").show();
	clearForm();
});
function sureAdd(){

    var data = $("#file").val();
    if(data==null || data==''){
        toastr.warning("请选择一个图标");
        return;
    }
    if($("#input_module_name").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#area_discription").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#input_module_label").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
	importConfigure(2);
}
function addModule(data){
	$.ajax({
		url : "../interactionModel/addModule.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:增加模块失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={

			}
			getModule(condition);
		},
		success : function(result) {
			toastr.success(result);
			
		}

	});
} 
function clearForm(){
	$("#input_module_name").val("");
	$("#file").val("");
	$("#file").removeAttr("data-image");
	$("#area_discription").val("");
	$("#input_module_label").val("");

}