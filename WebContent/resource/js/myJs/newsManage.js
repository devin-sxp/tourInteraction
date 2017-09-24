
var targetUserId = "" //修改的用户的id
var sizePage = 5 ;
$(function() {
	
	var condition = {
			limit:0 * sizePage,
			offset:sizePage
		}
	getNews(condition);
});

var getNews = function(condition) {
    $("#tbody_news").empty();

	$.ajax({
		url : "../interactionNews/getNews.do",
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
			result = eval("("+result+")");
		    $.each(result.list, function (objIndex, news) {
                var html_tr = appendNewsNode(news);
                $("#tbody_news").append(html_tr);
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

var appendNewsNode = function(news) {
	var html_tr ="<tr><td>"+news.id+"</td>"+     
      "<td>"+news.moduleId+"</td>"+
      "<td>"+news.newsTitle+"</td>"+
      "<td>"+news.newsLabel+"</td>"+
      "<td>"+news.newsAddress+"</td>"+
      "<td><div class=\"button-group\">"+
      "<a class=\"button border-main\" href=\"#add\" onclick=\"getNewsById("+news.id+")\"><span class=\"icon-edit\"></span>查看</a>"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"del("+news.id+")\"><span class=\"icon-trash-o\"></span> 删除</a>"+
      "<input name=\"user_id\" type=\"hidden\" value=\""+news.id+"\"/>"+
      "</div></td></tr>";
	return html_tr;
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
	getNews(condition);
});
$("#page2").click(function() {
	currentPage = page2 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getNews(condition);

});
$("#page3").click(function() {
	currentPage = page3 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getNews(condition);

});
$("#page4").click(function() {
	currentPage = page4 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getNews(condition);

});
$("#page5").click(function() {
	currentPage = page5 - 1;

	var condition = {
			limit:currentPage * sizePage,
			offset:sizePage
		}
	getNews(condition);

});


var getNewsById = function(newsId) {

	clearForm();
	$.ajax({
		url : "../interactionNews/getNewsById.do",
		type : 'post',
		data : {newsId:newsId},
		dataType : 'json',
		error : function(obj, msg) {
			var txt = "error:通过id没有查询到信息!";
			toastr.error(txt);
			return;
		},
		complete : function() {
			$("#add").show()
		},
		success : function(result) {
			result = eval("("+result+")");
			console.log(result)
			$("#label_news_id").text(result.id);
			$("#label_news_module").text(result.moduleName);
			$("#label_news_title").text(result.newsTitle);
			$("#label_news_content").html(result.newsContent);
			$("#label_news_label").text(result.newsLabel);
			$("#label_news_address").text(result.newsAddress);
			
		}

	});
}


/**
 * 删除
 * @returns
 */
function del(id){
	
	$.ajax({
		url : "../interactionNews/delNewsById.do",
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
					limit:currentPage * sizePage,
					offset:sizePage
			}
			getNews(condition);
		},
		success : function(result) {
			toastr.success(result)
			
		}
		
	});
}

function clearForm(){
	$("#label_news_id").text("");
	$("#label_news_module").text("");
	$("#label_news_title").text("");
	$("#label_news_content").text("");
	$("#label_news_label").text("");
	$("#label_news_address").text("");
}
