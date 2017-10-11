var fileuploadedId = "";
var userId = $("#userId").val();

var articleWordsCount = 0;
var page = 0;
var getCount = 5;
var articleCount = 0;
$(function() {
	getNowUserArticleCount();
	getNowUserArticle(page*getCount,getCount);
	getSubjectsByUserId();
})


var getNowUserArticleCount =  function (){

	$.post(getRootPath()+"/article/getNowUserArticleCount.do", function(data, textStatus, req) {
		if(textStatus == "success"){
			articleCount = eval(data);
			$("#my_article_count").text(articleCount);
		}else{
			toastr.error("获取文章数量失败！请稍后重试！");
		}
	})
};

var getNowUserArticle =  function (limit,offset){

	$.post(getRootPath()+"/article/getNowUserArticle.do",{limit:limit,offset:offset}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval("("+data+")");
			console.log(data)
			$.each(data.list, function(objIndex, article) {
				var html = "<li><div class=\"content\"><div class=\"author\">"+
						   "<span class=\"time\">"+stampToStandard(article.createTime.time)+"</span></div>"+
						   "<a class=\"title\" target=\"_blank\" href=\""+getRootPath()+"/page/articleNews?articleId="+ article.id +"\">"+article.articleName.replace(/<[^>]+>/g,"")+"</a>"+
						   "<div class=\"abstract txt-limit-2\">"+article.articleContent.replace(/<[^>]+>/g,"")+"</div>"+
						   "<div class=\"meta\"><a><i class=\"iconfont ic-list-read\"></i>"+article.articleLookCount+
						   "</a><a><i class=\"iconfont ic-list-comments\"></i>"+article.articleCommentCount+
						   "</a><span><i class=\"iconfont ic-list-like\"></i>"+article.articleLoveCount+
						   "</span></div></div></li>"
				$(".note-list").append(html);
				articleWordsCount = articleWordsCount + article.articleName.replace(/<[^>]+>/g,"").length + article.articleContent.replace(/<[^>]+>/g,"").length;
			})
			$("#my_article_words_count").text(articleWordsCount);
		}else{
			toastr.error("获取文章失败！请稍后重试！");
		}
	},'json')
};

var getSubjectsByUserId = function(){
	$.post(getRootPath()+"/articleSubject/getSubjectsByUserId.do",{userId:0}, function(data, textStatus, req) {
		data = eval(data);
		$.each(data, function(objIndex, subject) {
			var html = "<li>"+
					"<a href=\""+subject.id+"\" target=\"_blank\" class=\"avatar-collection\">"+
					"<img style=\"width:32px;height:32px;\" src=\""+getRootPath()+subject.subjectIconPath+"\">"+
					"</a><a href=\""+subject.id+"\" target=\"_blank\" class=\"name\">"+subject.subjectTitle+"</a></li>";
			$(".my_subject_list").append(html);
		})
	},'json');
}

$(".load-more").on('click',function(){
	page++;
	if(page*getCount > articleCount){
		toastr.info("没有更多了");
		return;
	}
	getNowUserArticle(page*getCount,getCount);
})


$("#btn_save_user_description").on('click', function() {
	var description = $("#text_user_description").val();
	$.post(getRootPath()+"/userManage/updateUserDescription.do", {userDescription:description}, function(data, textStatus, req) {
		if(textStatus =='success'){
			toastr.info(eval(data))
		}
	})
	$(this).parent().css({'display':'none'});
})

/**
 * 创建专题
 */
$(".new-collection-btn").click(function() {
	if(userId == null || userId =="" ){
		toastr.warning("请先登录！");
		return;
	}
	create_subject();
	var uploadUrl = getRootPath() + "/fileManage/uploadFile.do";
	var data = {
		fileUse : 'subject_icon',
		inputFile : 'input_file' //input file标签的name值传到后台，用于后台获取file
	}
	upLoadFileInput("input_file", uploadUrl, data);
})

$("#btn_news_create_subject_sure").on('click',function(){
	if(returnUploadedData != "" && returnUploadedData != null && returnUploadedData != "undefine"){
		fileuploadedId = returnUploadedData;
		console.log(fileuploadedId);
	}else{
		toastr.info("上传未完毕或返回数据为空");
		return;
	}
	
	var subjectTitle = $("#input_subject_title").val();
	var subjectDescription = $("#textarea_subject_description").val();
	var subjectIconId = fileuploadedId;
	
	$.post(getRootPath()+"/articleSubject/addSubject.do", {subjectTitle:subjectTitle,subjectDescription:subjectDescription,
		subjectIconId:subjectIconId,subjectType:2}, function(data, textStatus, req) {
		if(textStatus == "success"){
			data = eval(data);
			toastr.success(data);
			closepop();
		}else{
			toastr.error(data);
		}
	})
	
	location.reload();
})
