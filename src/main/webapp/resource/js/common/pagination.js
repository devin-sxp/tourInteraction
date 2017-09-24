/**
 *分页js 
 */
var currentPage = 0;
var page1 = 0;
var page2 = 0;
var page3 = 0;
var page4 = 0;
var page5 = 0;
var pageTotal = 0;
$(function() {
	page1 = $("#page1").text().trim();
	page2 = $("#page2").text().trim();
	page3 = $("#page3").text().trim();
	page4 = $("#page4").text().trim();
	page5 = $("#page5").text().trim();
});

/**
 * 上页
 */
$("#page_pre").click(function() {
	if(page1 == "1"){
		alert("前面没有页数了！");
		return;
	}
	$("#page1").text(eval(parseInt(page1) - 5));
	$("#page2").text(eval(parseInt(page2) - 5));
	$("#page3").text(eval(parseInt(page3) - 5));
	$("#page4").text(eval(parseInt(page4) - 5));
	$("#page5").text(eval(parseInt(page5) - 5));
	
	page1 = parseInt(page1) - 5;
	page2 = parseInt(page2) - 5;
	page3 = parseInt(page3) - 5;
	page4 = parseInt(page4) - 5;
	page5 = parseInt(page5) - 5;

});

/**
 * 下页
 */
$("#page_next").click(function() {
	if(page5 >= pageTotal){
		alert("后面没有页数了！");
		return;
	}
	$("#page1").text(eval(parseInt(page1) + 5));
	$("#page2").text(eval(parseInt(page2) + 5));
	$("#page3").text(eval(parseInt(page3) + 5));
	$("#page4").text(eval(parseInt(page4) + 5));
	$("#page5").text(eval(parseInt(page5) + 5));

	page1 = parseInt(page1) + 5;
	page2 = parseInt(page2) + 5;
	page3 = parseInt(page3) + 5;
	page4 = parseInt(page4) + 5;
	page5 = parseInt(page5) + 5;
})

/**
 * 重置翻页参数
 */
var resetPaginationParam = function() {
	currentPage = 0;
	var page1 = 0;
	var page2 = 0;
	var page3 = 0;
	var page4 = 0;
	var page5 = 0;
	var pageTotal = 0;
	$("#page1").text();
	$("#page2").text();
	$("#page3").text();
	$("#page4").text();
	$("#page5").text();
}
