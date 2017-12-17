/**
 * 加载分页
 * @param current_page  当前页
 * @param total_page 总页数
 * @param offset  当前页前后显示页数
 * @param target  加载到的目标(jquery对象)
 *                  eg. <ul class="pagination"></ul>  ---->  $(".pagination")
 */
var loadPagination = function (current_page,total_page,offset,target) {
    target.empty();
    if(total_page == 0){
        return;
    }
    current_page = parseInt(current_page);
    total_page = parseInt(total_page);
    offset = parseInt(offset);
    var page_html = "";
    if(current_page > 1){
        page_html = "<li><a page='"+(current_page-1)+"'>上一页</a></li>";
        var temp_html="";
        var start = (current_page-offset)>0?current_page-offset:1;
        for(var i=current_page-1;start<=i;i--){
            temp_html = "<li><a page='"+i+"'>"+i+"</a></li>" + temp_html
        }
        page_html = page_html+temp_html;
    }
    page_html = page_html + "<li><a class='active' page='"+(current_page)+"'>"+current_page+"</a></li>";

    if(total_page>current_page){
        var end = (current_page+offset)<total_page?current_page+offset:total_page;
        for(var i=current_page+1;i<=end;i++){
            page_html = page_html + "<li><a page='"+i+"'>"+i+"</a></li>"
        }
        page_html = page_html + "<li><a page='"+(current_page+1)+"'>下一页</a></li>";
    }
    target.append(page_html);
};