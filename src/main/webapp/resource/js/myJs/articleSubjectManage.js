/**
 *
 */
var subjectId = "";
var sizePage = 5 ;
$(function() {
	$("#btn_save").hide();

	var condition={
		limit:0*sizePage,
		offset:sizePage
	};
	getArticleSubject(condition);
});

var getArticleSubject = function(condition) {
    $("#tbody_article_subject").empty();

	$.ajax({
		url : getRootPath()+"/articleSubject/getSubjectB.do",
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
			result = eval("("+result+")");
            // console.log(result);
            $.each(result.list, function (objIndex, subject) {
                var html_tr = appendArticleSubjectNode(subject);
                $("#tbody_article_subject").append(html_tr);
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
};

/**
 * 处理分页
 */
$("#page1").click(function() {
    currentPage = page1 - 1;
    var condition = {
        limit:currentPage * sizePage,
        offset:sizePage
    }
    getArticleSubject(condition);
});
$("#page2").click(function() {
    currentPage = page2 - 1;

    var condition = {
        limit:currentPage * sizePage,
        offset:sizePage
    }
    getArticleSubject(condition);

});
$("#page3").click(function() {
    currentPage = page3 - 1;

    var condition = {
        limit:currentPage * sizePage,
        offset:sizePage
    }
    getArticleSubject(condition);

});
$("#page4").click(function() {
    currentPage = page4 - 1;

    var condition = {
        limit:currentPage * sizePage,
        offset:sizePage
    }
    getArticleSubject(condition);

});
$("#page5").click(function() {
    currentPage = page5 - 1;

    var condition = {
        limit:currentPage * sizePage,
        offset:sizePage
    }
    getArticleSubject(condition);

});

var appendArticleSubjectNode = function(subject) {
	var op = "解冻";
	var lock = 1;
	var cls = "border-green";
	if(subject.status == 1){
		op="冻结";
		lock = 0;
		cls = "border-yellow";
	}
	var html_tr ="<tr><td>"+subject.id+"</td>"+
	  "<td><img src=\""+getRootPath()+subject.subjectIconPath+"\" alt=\"暂未获取到图片\" width=\"120\" height=\"50\" /></td>"+
      "<td>"+subject.subjectTitle+"</td>"+
      "<td>"+subject.subjectDescription+"</td>"+
      "<td>"+subject.subjectTypeName+"</td>"+
      "<td>"+stampToStandard(subject.createTime.time)+"</td>"+
      "<td><div class=\"button-group\">"+
      "<a class=\"button border-main\" href=\"#add\" onclick=\"getArticleSubjectById("+subject.id+")\"><span class=\"icon-edit\"></span>修改</a>"+
	  "<a class=\"button "+cls+"\" href=\"javascript:void(0)\" onclick=\"lockSubjectById("+subject.id+","+lock+")\"><span class=\"icon-lock\"></span> " +
		op+
		"</a>"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"delSubjectById("+subject.id+")\"><span class=\"icon-trash-o\"></span> 删除</a>"+
      "</div></td></tr>";
	return html_tr;
}

var getArticleSubjectById = function(id) {
	$("#btn_save").show();
	$("#btn_add").hide();
	subjectId=""
	clearForm();
	$.ajax({
		url : getRootPath()+"/articleSubject/getSubjectByIdB.do",
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
			result = eval("("+result+")");
            console.log(result)

            subjectId=result.id;
			$("#input_subject_name").val(result.subjectTitle);
			$("#file").attr("data-image",getRootPath()+result.subjectIconPath);
			$("#area_discription").val(result.subjectDescription);
			$("#input_subject_type").val(result.subjectTypeName);
			
		}

	});
}

/**
 * 冻结
 * @returns
 */
function lockSubjectById(id,status){

    $.ajax({
        url : getRootPath()+"/articleSubject/lockSubjectById.do",
        type : 'post',
        data : {
            id:id,
			status:status
        },
        dataType : 'html',
        error : function(obj, msg) {
            var txt = "error:操作失败!";
            toastr.error(txt);
            return;
        },
        complete : function() {
            var condition={
                limit:0*sizePage,
                offset:sizePage
            };
            getArticleSubject(condition);
        },
        success : function(result) {
            toastr.success(result)

        }

    });
}

/**
 * 删除
 * @returns
 */
function delSubjectById(id){
	
	$.ajax({
		url : getRootPath()+"/articleSubject/delSubjectById.do",
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
                limit:0*sizePage,
                offset:sizePage
			};
			getArticleSubject(condition);
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

    if($("#input_subject_name").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#area_discription").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }

    
    if(data==null || data==''){
    	var data = {
    		id:subjectId,
			subjectTitle:	$("#input_subject_name").val(),
			subjectDescription:$("#area_discription").val(),
			subjectIconId:""
    	};
    	updateSubject(data)
    }else{
    	importConfigure(1);
    }

}

/**
 * 上传文件
 * @param data
 */
var importConfigure = function (action) {
    var fileId="";
	var data = {
        fileUse : 'article_subject_icon',
        inputFile : 'file' //input file标签的name值传到后台，用于后台获取file
    };
    $.ajaxFileUpload({
        url:getRootPath() + "/fileManage/uploadFile.do",       //后台需要走的action
        secureuri:false,
        type: 'post',
        async:false,
		data:data,
        dataType:'text',
        fileElementId:'file',                            //文件选择框的id属性
        success: function (data, textStatus) {
            fileId = eval(data);
            console.log(fileId);
        	if(action == 1){
        		var data = {
            		id:subjectId,
                    subjectTitle:	$("#input_subject_name").val(),
        			subjectDescription:$("#area_discription").val(),
        			subjectIconId:fileId
                };
        		updateSubject(data)
        	}else{
        		var data = {
        			subjectTitle:$("#input_subject_name").val(),
        			subjectDescription:$("#area_discription").val(),
        			subjectIconId:fileId,
                    subjectType:1
            	};
        		addSubject(data);
        	}
            
        },
        error: function (data, status, e) {           //相当于java中catch语句块的用法
            toastr.error("上传失败哦！");
        },
        complete:function () {
        
        }

    });

};

function updateSubject(data){
	$.ajax({
		url : getRootPath()+"/articleSubject/updateSubject.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:修改专题失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
                limit:0*sizePage,
                offset:sizePage
				};
			getArticleSubject(condition);
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
    $("#input_subject_type").val("官方");

});
function sureAdd(){

    var data = $("#file").val();
    if(data==null || data==''){
        toastr.warning("请选择一个图标");
        return;
    }
    if($("#input_subject_name").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
    if($("#area_discription").val().trim() == ""){
    	toastr.warning("请输入全部");
    	return;
    }
	importConfigure(2);
}
function addSubject(data){
	$.ajax({
		url : getRootPath()+"/articleSubject/addSubject.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:增加专题失败!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition={
                limit:0*sizePage,
                offset:sizePage
			};
			getArticleSubject(condition);
		},
		success : function(result) {
			toastr.success(result);
			
		}

	});
} 
function clearForm(){
	$("#input_subject_name").val("");
	$("#file").val("");
	$("#file").removeAttr("data-image");
	$("#area_discription").val("");
	$("#input_subject_type").val("");

}