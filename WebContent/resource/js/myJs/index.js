/**
 * 
 */

$(function(){
	var condition = {
		limit:0,
		offset:10
	}
	getLatestNews(condition);
	
	var data = {
		limit:0,
		offset:5
	}
	getHotPlace(data);
	var data1 = {
			limit:0,
			offset:10
		}
	getUser(data1);
		
});


var getLatestNews = function(condition) {
    $.ajax({
        url:getRootPath()+"/interactionNews/getNews.do",
        type: 'post',
        data:condition,
        dataType: 'json',
        error: function (obj, msg) {
            $("#cycler").empty();
            var txt = "error:没有查询最新信息!";
            toastr.error(txt);
            return;
        },
        complete: function () {
        	/**
        	 * 最新消息循环滚动
        	 * @param $item
        	 * @param $cycler
        	 * @returns
        	 */
        	function cycle($item, $cycler){
        		setTimeout(cycle, 5000, $item.next(), $cycler);
        		$item.slideUp(2000,function(){
        			$item.appendTo($cycler).show();        
        		});

        	}
        	cycle($('#cycler div:first'),  $('#cycler'));
        },
        success: function (result) {
        	 var html = "";	
        	 result = eval("("+result+")");
             $.each(result.list,function(objIndex,interactionNews){
            	 html = html + "<div class=\"date-text\"><a href=\""+getRootPath()+"/page/interactionComment?newsId="+interactionNews.id+"\">"+interactionNews.newsTitle+"</a><p>"+interactionNews.newsLabel+"</p></div>";
             });
             $("#cycler").append(html);
          }
          
    });
}

var getHotPlace = function(data) {
    $("#ul_module").empty();

	$.ajax({
		url : getRootPath()+"/interactionModel/getModel.do",
		type : 'post',
		data : data,
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:没有查询到符合条件的信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {
//			<script type="text/javascript"
//				src="<%=contextPath%>/resource/js/script.js"></script> 的内容;加$("#ul_todayHot")的点击展开
			$.easing.def = "easeOutBounce";

			/* Binding a click event handler to the links: */
			$('li.button a').click(function(e){

				/* Finding the drop down list that corresponds to the current section: */
				var dropDown = $(this).parent().next();
				
				/* Closing all other drop down sections, except the current one */
				$('.dropdown').not(dropDown).slideUp('slow');
				dropDown.slideToggle('slow');
				
				/* Preventing the default event (which would be to navigate the browser to the link's address) */
				e.preventDefault();
			})
		},
		success : function(result) {
			$("#div_hot_place").empty()
			$("#module_top1").empty()
			$("#module_top2").empty()
			$("#ul_todayHot").empty()

			result = eval("("+result+")");
			$("#module_top1").append("<a href=\""+getRootPath()+"/page/interactionNews?moduleId="+result.list[0].id+"\">" +
					"<img src=\""+getRootPath()+result.list[0].moduleIcon+"\" alt=\"暂时无法显示该图片\" style=\"height:190px\"/>"+
					"<div class=\"destinations-grid-info tours\"><h5>"+result.list[0].moduleName+"</h5>"+
					"<p>"+result.list[0].moduleDiscription+"</p>"+
					"<p class=\"b-period\">创建于"+stampToStandard(result.list[0].createTime.time)+"</p></div></a>");
			$("#module_top2").append("<a href=\""+getRootPath()+"/page/interactionNews?moduleId="+result.list[1].id+"\">" +
					"<img src=\""+getRootPath()+result.list[1].moduleIcon+"\" alt=\"暂时无法显示该图片\" style=\"height:190px\"/>"+
					"<div class=\"destinations-grid-info tours\"><h5>"+result.list[1].moduleName+"</h5>"+
					"<p>"+result.list[1].moduleDiscription+"</p>"+
					"<p class=\"b-period\">创建于"+stampToStandard(result.list[0].createTime.time)+"</p></div></a>");
		    $.each(result.list, function (objIndex, interactionModel) {
                var html = appendHotPlaceNode(interactionModel);
                $("#div_hot_place").append(html);
                $("#ul_todayHot").append("<li class=\"button\"><a>"+interactionModel.moduleName+"</a>"+
						"<li class=\"dropdown\"><a href=\""+getRootPath()+"/page/interactionNews?moduleId="+interactionModel.id+"\">" +
						"<div class=\"destinations-grid\">" +
						"<img src=\""+getRootPath()+interactionModel.moduleIcon+"\" alt=\"暂时无法显示该图片\" />"+
						"</div><div class=\"destinations-grid-info\"><div class=\"destinations-hotel\">"+interactionModel.moduleDiscription+"</div>"+
						"<div class=\"destinations-star\"><span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span><span"+
						" class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span><span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>"+
						"</div><div class=\"destinations-price\">"+interactionModel.moduleLabel+"</div><div class=\"clearfix\"></div></div></a></li></li>");
            });
			
		}
	});
}

var getUser = function(condition) {

	$.ajax({
		url : getRootPath()+"/userManage/getUserByInteraction.do",
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
			$("#div_integration_top").empty();
			result = eval("("+result+")");
		    $.each(result.list, function (objIndex, user) {
                $("#div_integration_top").append("<div class=\"choose-grids-info\"><div class=\"choose-left\"><h5>"+
                		user.integration+"</h5></div>"+
                		"<div class=\"choose-right\" style=\"width:inherit\"><a>"+user.userName+"</a></div>"+
                		"<div class=\"clearfix\"></div></div><hr>");
            });
		
		}

	});
}

var appendHotPlaceNode = function(interactionModel) {
	var html = "<div class=\"td-grids\"><div class=\"col-xs-3 td-left\">"+
		"<img src=\""+getRootPath()+interactionModel.moduleIcon+"\" alt=\"暂时无法显示该图片\"/>"+
		"</div><div class=\"col-xs-7 td-middle\">" +
		"<a href=\""+getRootPath()+"/page/interactionNews?moduleId="+interactionModel.id+"\">"+interactionModel.moduleName+"</a>"+
		"<p>"+interactionModel.moduleDiscription+"</p>"+
		"<span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>"+
		"<span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>"+
		"<span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>"+
		"</div><div class=\"col-xs-2 td-right\">" +
		"<p>"+interactionModel.moduleLabel+"</p>" +
		"</div><div class=\"clearfix\"></div></div>";
	
	return html;
}

