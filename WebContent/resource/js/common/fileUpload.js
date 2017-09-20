/**
 * bootstrap fileInput
 * 选择后自动上传
 */
var returnUploadedData = "";//上传后后台返回的数据
function upLoadFileInput(ctrlName, uploadUrl, data) {
	var control = $('#' + ctrlName);
	control.fileinput({
		language : 'zh', //设置语言  
		uploadUrl : uploadUrl, //上传地址  
		showUpload : false, //是否显示上传按钮  
		showRemove : true,
		showPreview : false,
		dropZoneEnabled : false,
		showCaption : true, //是否显示标题  
		allowedPreviewTypes : [ 'image' ],
		allowedFileTypes : [ 'image' ],
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'ico' ],
		maxFileSize : 20000,
		maxFileCount : 1,
		uploadAsync:true,
		uploadExtraData : function(previewId, index) {
			return data
		},
//            initialPreview: [   
////                    预览图片的设置  
//                    "<img src='http://127.0.0.1:8080/NewsManageSys/plugin/umeditor1_2_2/jsp/upload/20161030/55061477813913474.jpg' class='file-preview-image' alt='肖像图片' title='肖像图片'>",  
//            ],  

	}).on("filebatchselected", function(event, files) {
		$(this).fileinput("upload"); 
	}).on("fileuploaded", function(event, data) {
		returnUploadedData = ""
		returnUploadedData = data.response;
	});
}