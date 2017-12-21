var search = {
    data:{
        condition:{
            queryString:getUrlParam("search_value").trim()?getUrlParam("search_value").trim():'',
            queryType:getUrlParam("search_type").trim()?getUrlParam("search_type").trim():'article',
            sort:"desc_time",
            page:getUrlParam("page")?getUrlParam("page"):1,
            pageSize:5
        },
        page_offset:3,
        history_search_cookie_name:"history_search_name"
    },
    init:function () {
        search.method.getData(search.data.condition);
        search.method.loadClickEvents();
        search.method.otherDeal();
        search.method.saveSearchHistory(search.data.condition.queryString);
    },
    method:{
        getData:function (condition) {
            $.post(getRootPath()+"/solr/getData.do",condition,function (data,status) {
                data = eval("("+data+")");
                // console.log(data);
                if(data == null){
                    return;
                }
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

            //排序点击事件
            $(".sort-type a").on("click",function () {
                $(".sort-type a").each(function () {
                   $(this).removeClass("active") ;
                });
                $(this).addClass("active");
                search.data.condition.sort = $(this).attr("param");
                search.method.getData(search.data.condition);

            });

            //清空本地搜索历史
            $("#clear_all_search_history").on('click',function () {
                document.cookie=search.data.history_search_cookie_name+'=';
                $(".search-recent-item-wrap").empty();
            });

            //更换搜索推荐
            $("#recommend_search_search").on('click',function () {
                head.method.getSearchHistory(head.history_search_condition);
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
        },
        saveSearchHistory:function (searchValue) {
            if (searchValue == null || searchValue == ""){
                return;
            }
            //服务器存储
            $.post(getRootPath()+"/historySearch/addOrUpdateHistorySearch.do",{searchValue:searchValue},function (data,status) {
                
            },'json');

            //本地cookie存储
            var name = search.data.history_search_cookie_name;
            var isSave = true;
            var Days = 7;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days*24*60*60*1000);
            var start = document.cookie.indexOf(name+'=');
            if (start == -1){
                document.cookie = name + "="+ encodeURIComponent(searchValue) + ";expires=" + exp.toGMTString();
                return;
            }
            start = start+name.length+1;
            var end = document.cookie.indexOf(';', start);
            if (end == -1)
                end=document.cookie.length;
            var cookieValue = document.cookie.substring(start, end);
            cookieValue = decodeURIComponent(cookieValue);
            var values = cookieValue.split("|||");
            for (var i=0;i<values.length;i++) {
                if(values[i] == searchValue){
                    isSave = false
                }
            }
            if(isSave){
                if (cookieValue != null && cookieValue != ""){
                    cookieValue = searchValue + "|||" + cookieValue;

                }else {
                    cookieValue = searchValue;
                }
                document.cookie = name + "="+ encodeURIComponent(cookieValue) + ";expires=" + exp.toGMTString();
            }

            head.method.getLocalHistorySearch(head.data.history_search_name)
        }

    }
};

$(function () {
   search.init();
});


