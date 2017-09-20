/**
 * 
 */
var sizePage = 5 ;
var moduleId = 0 ;
var userId = $("#userId").val();
$(function() {
	moduleId = getUrlParam("moduleId");
	getNewsTransfer();
});

var getNews = function(condition) {
    $("#tbody_news").empty();

	$.ajax({
		url : "../interactionNews/getNews.do",
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
			console.log(result)
		    $.each(result.list, function (objIndex, interactionNews) {
                var html_tr = appendInteractionNews(interactionNews);
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

var appendInteractionNews = function(interactionNews) {
	var html_tr = "<tr>"
		+"<td><a href=\"interactionComment?newsId="+interactionNews.id+"\" >"+interactionNews.newsTitle+"</td>"
		+"<td>"+interactionNews.newsLabel+"</td>"
		+"<td>"+interactionNews.createUserName+"</td>"
		+"<td>"+stampToStandard(interactionNews.createTime.time)+"</td>"				
		+"<td><a href=\"interactionComment?newsId="+interactionNews.id+"\" >进入</a></td></tr>"			
	return html_tr;
}

/**
 * 处理分页
 */
$("#page1").click(function() {
	currentPage = page1 - 1;
	getNewsTransfer();
});
$("#page2").click(function() {
	currentPage = page2 - 1;

	getNewsTransfer();

});
$("#page3").click(function() {
	currentPage = page3 - 1;
	getNewsTransfer();

});
$("#page4").click(function() {
	currentPage = page4 - 1;

	getNewsTransfer();

});
$("#page5").click(function() {
	currentPage = page5 - 1;

	getNewsTransfer();

});

//发布
$("#btn_publish").click(function() {
	if(userId != null && userId !="" ){
		publish();

	}else{
		toastr.warning("请先登录！");
	}
});

/*
 * 发布功能
 */
$("#btn_news_publish_sure").click(function(){
	var newsTitle = $("#input_news_title").val();
	var newsLabel = $("#input_news_label").val();
	var newsContent = editor.$txt.html();
	var data = {
		newsTitle:newsTitle,
		newsLabel:newsLabel,
		newsContent:newsContent,
		moduleId:moduleId
	}
	
	addNews(data);
});

var addNews = function(data){
	$.ajax({
		url : "../interactionNews/addNews.do",
		type : 'post',
		data : data,
		dataType : 'html',
		error : function(obj, msg) {
			var txt = "error:发布失败";
			toastr.error(txt);
			return;
		},
		complete : function() {
			var condition = {
					moduleId:moduleId,
					limit:currentPage * sizePage,
					offset:sizePage
			}
			getNews(condition);
			addIntegration(20);
		},
		success : function(result) {
			closepop();
			console.log(result)
			return;
		}

	});
}

/*
 * 搜索功能
 */

var getNewsTransfer = function() {
	var searchValue = $("#input_news_search").val().trim();
	var condition = {
		moduleId:moduleId,
		newsTitle:searchValue,
		newsLabel:searchValue,
		createUserName:searchValue,
		limit:currentPage * sizePage,
		offset:sizePage
	}
	getNews(condition);
}

$("#btn_news_search_sure").click(function() {
	resetPaginationParam()
	getNewsTransfer()
});

/**
 * 加积分
 * @param data
 */
var addIntegration =function (integration) {
    $.ajax({
        url: "../integration/addIntegration.do",
        type : 'post',
        data : {
            integration:integration
        },
        async: true,
        dataType : 'html',
        error : function(obj, msg) {
            return;
        },
        complete : function() {

        },
        success : function(result) {
            console.log(result)

        }
    });
};


