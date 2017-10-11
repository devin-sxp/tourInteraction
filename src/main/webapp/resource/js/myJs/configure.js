/**
 * 
 */
var configure_id = 0;
var configure_have_back = false; 
var configure_have_back_id = 0; 
$("#btn_conf_pic").click(function(){
	$("#btn_conf_txt").removeClass("btn-danger");
	$("#btn_conf_pic").addClass("btn-danger");
	
	$("#div_conf_pic").removeClass("hidden");
	$("#table_conf_pic").removeClass("hidden");
	$("#div_conf_txt").addClass("hidden");
	$("#table_conf_txt").addClass("hidden");

});
$("#btn_conf_txt").click(function(){
	$("#btn_conf_pic").removeClass("btn-danger");
	$("#btn_conf_txt").addClass("btn-danger");

	$("#div_conf_pic").addClass("hidden");
	$("#table_conf_pic").addClass("hidden");
//	$("#div_conf_txt").removeClass("hidden");
	$("#table_conf_txt").removeClass("hidden");

});
getConfigure();
getStaticSelect("configure_u");
function getConfigure(){
	$("#tbody_module_pic").empty();
	$("#tbody_module_txt").empty();
	$.post(getRootPath()+"/configure/getConfigure.do",function(data){
		configure_have_back = false;
		configure_have_back_id = 0;
		var data = eval("("+data+")")
		$.each(data,function(index,configure){
			console.log(configure)
			if(configure.staticCodeConfigure == "configure_pic"){
				var html = "<tr>"
					+"<td>"+configure.id+"</td>"
					+"<td><img src=\""+getRootPath()+configure.file+"\" width=\"120\" height=\"50\" /></td>"
					+"<td>"+configure.configureUse+"</td>"
					+"<td><div class=\"button-group\">"
					+"<a class=\"button border-main\" href=\"#div_conf_pic\" onclick=\"getConfigureById("+configure.id+","+"'pic'"+")\">" 
					+"<span	class=\"icon-edit\"></span> 修改</a>"
					+"<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"delById("+configure.id+")\">"
					+"<span	class=\"icon-trash-o\"></span> 删除</a></div></td></tr>"
					
				$("#tbody_module_pic").append(html);
				
				if(configure.staticCodeUse == "configure_pic_use_back"){
					configure_have_back = true;
					configure_have_back_id = configure.id;
				}
			}else{
				var html = "<tr>"
					+"<td>"+configure.id+"</td>"
					+"<td>"+configure.title+"</td>"
					+"<td>"+configure.description+"</td>"
					+"<td><div class=\"button-group\">"
					+"<a class=\"button border-main\" href=\"#div_conf_txt\" onclick=\"getConfigureById("+configure.id+","+"'txt'"+")\">" 
					+"<span	class=\"icon-edit\"></span> 修改</a>"
					+"<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"delById("+configure.id+")\">"
					+"<span	class=\"icon-trash-o\"></span> 删除</a></div></td></tr>"
					
				$("#tbody_module_txt").append(html);
			}
		});
		
	},'json');
}

/**
 * 获取下拉选项
 * @param staticType
 * @returns
 */
function getStaticSelect(staticType){
	$("#control_select_pic").empty();
	$.post(getRootPath()+"/static/getStatic.do",{staticType:staticType},function(data){
		var data = eval("("+data+")")
		$.each(data,function(index,stc){
			var html = "<option value=\""+stc.staticCode+"\">"+stc.staticName+"</option>"
			$("#control_select_pic").append(html);
			
		});
		
	},'json');
	
}

/**
 * 通过id获取信息
 * @param id
 * @returns
 */
function getConfigureById(id,action){
	clearForm();
	configure_id = id;
	$.post(getRootPath()+"/configure/getConfigureById.do",{id:id},function(data){
		data = JSON.parse(data)
		if(action == "pic"){
			$("#control_id_pic").text(data.id);
			$("#file").attr('data-image',getRootPath()+data.file);
			$("#control_select_pic option").each(function (){  
				console.log($(this).val())
				if($(this).val() == data.staticCodeUse){
					$(this).attr('selected','true')
				}
			 });
		}else{
			$("#div_conf_txt").removeClass("hidden");
			$("#input_title_name").val(data.title);
			$("#area_discription").val(data.description);

		}
		
	},'json');
}
/**
 * 确定修改
 * @returns
 */
function sureSave(){
	if(configure_have_back == true 
			&& $("#control_select_pic").find('option:selected').val() == "configure_pic_use_back"
			&& $("#control_id_pic").text() != configure_have_back_id){
//		alert("背景只能设置一个！");
		toastr.warning('背景只能设置一个,请重新选择！');

		return;
	}
	if($("#control_id_pic").text() == null || $("#control_id_pic").text() == ""){
//		alert("请选择修改项")
		toastr.warning("请选择修改项");
		return;
	}
	if(configure_id == 0){
		toastr.warning("请选择修改项")
		return;
	}
    var data = $("#file").val();
    if(data==null || data==''){
		var data = {
    		id:configure_id,
    		staticCodeConfigure:"",
    		staticCodeUse:$("#control_select_pic").find('option:selected').val(),
    		title:"",
    		description:"",
			file:""
		}
    	updateConfigure(data)

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
            		id:configure_id,
            		staticCodeConfigure:"",
            		staticCodeUse:$("#control_select_pic").find('option:selected').val(),
            		title:"",
            		description:"",
        			file:fileUrl
        		}
        		updateConfigure(data)
        	}else{
        		var data = {
    				staticCodeConfigure:"",
            		staticCodeUse:$("#control_select_pic").find('option:selected').val(),
            		title:"",
            		description:"",
        			file:fileUrl
            	}
        		addConfigure(data)
        	}
            
        },
        error: function (data, status, e) {           //相当于java中catch语句块的用法
            toastr.error("上传失败哦！");
        },
        complete:function () {
        
        }

    });

};

function updateConfigure(data){
	$.ajax({
		url : getRootPath()+"/configure/updateConfigure.do",
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
			getConfigure();
		},
		success : function(result) {
			toastr.success(result)
			
		}

	});
} 

/**
 * 增加
 * @param
 * @returns
 */
function sureAdd(){
	if(configure_have_back == true && $("#control_select_pic").find('option:selected').val() == "configure_pic_use_back"){
		toastr.warning("背景只能设置一个！");
		return;
	}
    var data = $("#file").val();
    if(data==null || data==''){
        toastr.warning("请选择一个图标");
        return;
    }
	importConfigure(2);
}
function addConfigure(data){
	$.ajax({
		url : getRootPath()+"/configure/addConfigure.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:增加模块失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			getConfigure();
		},
		success : function(result) {
			toastr.success(result)	
		}

	});
} 

function delById(id){
	if (confirm("确定删除吗?")==false){ 
		  return; 
	}
	$.post(getRootPath()+"/configure/delConfigureById.do",{id:id},function(data){
		getConfigure();
		toastr.success(data)
	});
}

/**
 * 确定修改文本
 * @returns
 */
function sureSaveTxt(){
	
	if($("#input_title_name").val()==null || $("#input_title_name").val()==''){
        toastr.warning("请输入全部信息");
        return;
    }
    if($("#area_discription").val()==null || $("#area_discription").val()==''){
        toastr.warning("请输入全部信息");
        return;
    }

	var data = {
		id:configure_id,
		staticCodeConfigure:"",
		staticCodeUse:"",
		title:$("#input_title_name").val(),
		description:$("#area_discription").val(),
		file:""
    }
    updateConfigure(data);
}

function clearForm(){
	$("#input_title_name").val("");
	$("#area_discription").val("");
	$("#control_id_pic").text("");
	configure_id = 0;
}