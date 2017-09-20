
var fileuploadedId = "";
var userId = $("#userId").val();
$(function() {

})

$("#btn_write_article").click(function() {
	if(userId == null || userId =="" ){
		toastr.warning("请先登录！");
		return;
	}
	writeArticle();
	var uploadUrl = getRootPath() + "/fileManage/uploadFile.do";
	var data = {
		fileUse : 'article_subject_icon',
		inputFile : 'input_file' //input file标签的name值传到后台，用于后台获取file
	}
	upLoadFileInput("input_file", uploadUrl, data);
})

$("#btn_news_write_article_sure").on('click',function(){
	if(returnUploadedData != "" && returnUploadedData != null && returnUploadedData != "undefine"){
		fileuploadedId = returnUploadedData;
		console.log(fileuploadedId);
	}else{
		toastr.info("上传未完毕或返回数据为空");
		return;
	}
	
	var articleName = $("#input_article_title").val();
	var articleContent = editor.$txt.html();
	var articleIconId = fileuploadedId;
	
	$.post(getRootPath()+"/article/addArticle.do", {articleName:articleName,articleContent:articleContent,
		articleIconId:articleIconId}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval(data);
			toastr.success(data);
			closepop();
		}else{
			toastr.error(data);
		}
	})
})




