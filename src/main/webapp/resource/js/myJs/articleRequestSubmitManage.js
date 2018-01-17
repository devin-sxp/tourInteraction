var requestSubmit = {
    data:{
        type:"官方"
    },
    init:function () {
        requestSubmit.method.getArticleRequestSubmitNewsByType(requestSubmit.data.type);
    },
    method:{
        getArticleRequestSubmitNewsByType:function (type) {
            $.post(getRootPath()+"/article/getArticleRequestSubmitNewsByType.do",{type:type},function (data,status) {
                console.log(data+status);
                if(status == "success"){
                    $("#tbody_article_request_submit_list").empty();
                    data = eval("("+data+")");
                    $.each(data,function (index,request) {
                       var html_tr = requestSubmit.method.appendRequestSubmitNode(request);
                       $("#tbody_article_request_submit_list").append(html_tr);
                    })
                }else{
                    toastr.error("获取请求信息失败请稍后再试！")
                }
            },"json");
        },
        appendRequestSubmitNode: function(request) {
            var html_tr ="<tr>"+
                "<td><img src=\""+getRootPath()+request.filePath+"\" alt=\"暂未获取到图片\" width=\"120\" height=\"50\" /></td>"+
                "<td>"+request.articleName+"</td>"+
                "<td>"+request.requestSubjectTitle+"</td>"+
                "<td>"+request.createUserName+"</td>"+
                "<td>"+stampToStandard(request.createTime.time)+"</td>"+
                "<td><div class=\"button-group\">"+
                "<a class=\"button border-main\" target='_blank' href=\""+getRootPath()+"/page/articleNews?articleId="+request.requestArticleId+"\"><span class=\"icon-eye\"></span>查看</a>"+
                "<a class=\"button border-green\" href=\"javascript:void(0)\" onclick=\"requestSubmit.method.dealArticleRequestSubmitNews("+
                request.id+","+request.requestArticleId+","+request.requestSubjectId+",1)\"><span class=\"icon-check-square\"></span>通过" +
                "</a>"+
                "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"requestSubmit.method.dealArticleRequestSubmitNews("+
                request.id+",0,0,0)\"><span class=\"icon-trash-o\"></span> 不通过</a>"+
                "</div></td></tr>";
            return html_tr;
        },
        dealArticleRequestSubmitNews:function(requestId,requestArticleId,requestSubjectId,isPass){
            $.post(getRootPath()+"/article/dealArticleRequestSubmitNews.do", {
                requestId:requestId,requestArticleId:requestArticleId,
                requestSubjectId:requestSubjectId,
                isPass:isPass
            }, function(data, textStatus, req) {
                if(textStatus == "success"){
                    toastr.success(eval(data));
                    requestSubmit.method.getArticleRequestSubmitNewsByType(requestSubmit.data.type);
                }else{
                    toastr.error(eval(data));
                }
            })
        },
    }
};

$(function () {
    requestSubmit.init()
});