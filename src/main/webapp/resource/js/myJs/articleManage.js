var article_manage = {
    data:{
        total_count:0,
        limit:currentPage*5,
        offset:5
    },
    init:function () {
        article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);
        article_manage.methods.dealPagination();
    },
    methods:{
        getArticle:function (limit,offset) {
            $.post(getRootPath()+"/article/getArticleCount.do",{},function (data,status) {
                article_manage.data.total_count = data;
                if (status == "success"){

                    var currentShowPageStart = eval(currentPage * article_manage.data.offset + 1);
                    var currentShowPageStop = eval((currentPage+1) * article_manage.data.offset);

                    if(parseInt(data)%offset == 0){
                        pageTotal = parseInt(parseInt(data)/article_manage.data.offset);
                    }else{
                        pageTotal = parseInt(parseInt(data)/article_manage.data.offset + 1);

                    }

                    $("#page_count").text("showing "+ currentShowPageStart +"-"+currentShowPageStop +" of "+ data + "---- total page:"+pageTotal);
                }
            });
            $.post(getRootPath()+"/article/getArticles.do",{limit:limit,offset:offset},function (data,status) {
                data = eval("("+data+")");
                // console.log(data);
                if(status == "success"){
                    $("#tbody_article").empty();
                    $.each(data.list,function (index,obj) {
                        $("#tbody_article").append(article_manage.methods.appendNode(obj));
                    });

                }
            },'json');
        },
        appendNode:function (obj) {
            if(obj.subjectTitle == "" || obj.subjectTitle == null   ){
                obj.subjectTitle = "(没有栏目)";
            }
            var condition_del = {
                articleId:obj.id,
                articleName:obj.articleName,
                level:1,
                opIdentity:'admin',
                targetUserId:obj.createUser
            };
            var condition_del_permanent = {
                articleId:obj.id,
                articleName:obj.articleName,
                level:2,
                opIdentity:'admin',
                targetUserId:obj.createUser
            };
            var html_tr = "<tr>" +
                  "<td>"+obj.id+"</td>" +
                  "<td>"+obj.subjectTitle+"</td>" +
                  "<td>"+obj.articleName+"</td>" +
                  "<td>"+obj.createUserName+"</td>" +
                  "<td>"+stampToStandard(obj.createTime.time)+"</td>" +
                  "<td><div class=\"button-group\">" +
                  "<a class=\"button border-main\" target='_blank' href=\""+getRootPath()+"/page/articleNews?articleId="+obj.id+"\"><span" +
                  "class=\"icon-edit\"></span> 查看</a>" +
                  "<a class=\"button border-yellow\"" +
                  "href=\"javascript:void(0)\" onclick=\"article_manage.methods.delArticleById("+JSON.stringify(condition_del).replace(/\"/g,"'")+")\"><span" +
                  "class=\"icon-lock\"></span>删除</a>" +
                  "<a class=\"button border-red\"" +
                  "   href=\"javascript:void(0)\" onclick=\"article_manage.methods.delArticleById("+JSON.stringify(condition_del_permanent).replace(/\"/g,"'")+")\"><span" +
                  "class=\"icon-trash-o\"></span> 彻底删除</a>" +
                  "</div></td>" +
                  "</tr>";
            return html_tr;
        },
        getArticleById:function (articleId) {
            $.post(getRootPath()+"/article/getArticleById.do",{articleId:articleId},function (data,status) {

            },'json');
        },
        delArticleById:function (condition) {
            $.post(getRootPath()+"/article/delArticleById.do",condition,function (data,status) {
                if(eval(data) == "true"){
                    toastr.success("删除成功");
                    article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);
                }
            });
        },
        dealPagination:function () {
            /**
             * 处理分页
             */
            $("#page1").click(function() {
                currentPage = page1 - 1;
                article_manage.data.limit = currentPage*article_manage.data.offset
                article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);
            });
            $("#page2").click(function() {
                currentPage = page2 - 1;
                article_manage.data.limit = currentPage*article_manage.data.offset
                article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);

            });
            $("#page3").click(function() {
                currentPage = page3 - 1;
                article_manage.data.limit = currentPage*article_manage.data.offset
                article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);

            });
            $("#page4").click(function() {
                currentPage = page4 - 1;
                article_manage.data.limit = currentPage*article_manage.data.offset
                article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);

            });
            $("#page5").click(function() {
                currentPage = page5 - 1;
                article_manage.data.limit = currentPage*article_manage.data.offset
                article_manage.methods.getArticle(article_manage.data.limit,article_manage.data.offset);

            });
        }

    }
};

$(function () {
    article_manage.init();
});