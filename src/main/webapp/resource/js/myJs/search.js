var search = {
    data:{
        condition:{
            queryString:getUrlParam("search_value")?getUrlParam("search_value"):'',
            queryType:getUrlParam("search_type")?getUrlParam("search_type"):'article',
            sort:"asc",
            page:getUrlParam("page")?getUrlParam("page"):1,
            pageSize:5
        },
        page_offset:3
    },
    init:function () {
        search.method.getData(search.data.condition);
        search.method.loadClickEvents();
        search.method.otherDeal();
    },
    method:{
        getData:function (condition) {
            $.post(getRootPath()+"/solr/getData.do",condition,function (data,status) {
                data = eval("("+data+")");
                console.log(data);
                $(".note-list").empty();
                $(".user-list").empty();

                $("#result_count").text(data.recordCount+"个结果");
                if(data.recordCount == 0){
                    $(".find-nothing").removeClass("hidden");
                }else {
                    $(".find-nothing").addClass("hidden");
                }
                $.each(data.list,function (indexObj,elem) {
                    if(search.data.condition.queryType == "article"){
                        search.method.appendArticleList(elem,$(".note-list"));
                    }else if(search.data.condition.queryType == "interaction_news"){
                        search.method.appendNewsList(elem,$(".note-list"));
                    }else if(search.data.condition.queryType == "article_subject"){
                        search.method.appendArticleSubjectList(elem,$(".user-list"));
                    }
                });

                search.method.setPagination(search.data.condition.page,data.pageCount,search.data.page_offset,$(".pagination"));
            },'json');
        },
        loadClickEvents:function () {

            //查询类型选择
            $("#ul_query_type li").on('click',function () {

                $("#ul_query_type li").each(function () {
                    $(this).removeClass("active");
                });
                $(this).addClass("active");

                var new_data = {
                   queryType:$(this).attr("param"),
                   page:1
                };
                $.extend(search.data.condition,new_data);

                search.method.getData(search.data.condition);
                window.history.pushState({},"","?search_value="+search.data.condition.queryString+"&search_type="+
                search.data.condition.queryType+"&page=1");
            });

        },
        otherDeal:function () {
            //当前查询类型
            $("#ul_query_type li").each(function () {
                if($(this).attr("param") == search.data.condition.queryType){
                    $(this).addClass("active");
                }
            });
        },
        setPagination:function (current_page,total_page,offset,target) {
           loadPagination(current_page,total_page,offset,target);
           $(".pagination li").on('click',function () {
               search.data.condition.page =  $(this).children().attr("page");
               search.method.getData(search.data.condition);
               window.history.pushState({},"","?search_value="+search.data.condition.queryString+"&search_type="+
                   search.data.condition.queryType+"&page="+$(this).children().attr("page"));
           })
        },
        appendArticleList:function (elem,target) {
            var html="<li>" +
                "<div class=\"content\">" +
                "<div class=\"author\">" +
                "<a href=\"\" target=\"_blank\" class=\"avatar\"><img src=\""+getRootPath()+elem.userIconPath+"\"></a>" +
                "<div class=\"info\">" +
                "<a href=\"\" class=\"nickname\">"+elem.createUserName+"</a>" +
                "<span class=\"time\">"+stampToStandard(elem.createTime.time)+"</span>" +
                "</div>" +
                "</div>" +
                "<a href=\""+getRootPath()+"/page/articleNews?articleId="+elem.articleId+"\" target=\"_blank\" class=\"title txt-limit-1\">" + elem.articleName +"</a>" +
                "<div class=\"abstract txt-limit-3\" >" + elem.articleContent +"</div>" +
                "<div class=\"meta\">" +
                "<a>" +
                "<i class=\"iconfont ic-list-read\"></i>" + elem.articleLookCount+
                "</a>" +
                "<a>" +
                "<i class=\"iconfont ic-list-comments\"></i>" + elem.articleCommentCount+
                "</a>" +
                "<span><i class=\"iconfont ic-list-like\"></i>"+elem.articleLoveCount+"</span>" +
                "</div>" +
                "</div>" +
                "</li>";
            target.append(html);
        },
        appendNewsList:function (elem,target) {
            var html="<li>" +
                "<div class=\"content\">" +
                "<div class=\"author\">" +
                "<span class=\"time\">"+stampToStandard(elem.createTime.time)+"</span>" +
                "</div>" +
                "</div>" +
                "<a href=\""+getRootPath()+"/page/interactionComment?newsId="+elem.newsId+"\" target=\"_blank\" class=\"title txt-limit-1\">" + elem.newsTitle +"</a>" +
                "<div class=\"abstract txt-limit-3\" >" + elem.newsContent +"</div>" +
                "</div>" +
                "</li>";
            target.append(html);
        },
        appendArticleSubjectList:function (elem,target) {
            var html="<li>" +
                "<a href=\""+getRootPath()+"/page/subject?sid="+elem.articleSubjectId+"\" target=\"_blank\" class=\"avatar-collection\">" +
                "<img class=\"avatar-collection\" src=\""+getRootPath()+elem.subjectIconPath+"\">" +
                "</a>" +
                "<div class=\"info\">" +
                "      <a href=\""+getRootPath()+"/page/subject?sid="+elem.articleSubjectId+"\" class='name'>"+elem.articleSubjectTitle+"</a>" +
                "<div class=\"meta\">" +
                "<span>创建于 " + stampToStandard(elem.createTime.time) + "</span>" +
                "</div>" +
                "</div>" +
                "<a class=\"btn btn-success follow\"><i class=\"iconfont ic-follow\"></i><span>关注</span></a>" +
                "</li>";
            target.append(html);
        }
    }
};

$(function () {
   search.init();
});


