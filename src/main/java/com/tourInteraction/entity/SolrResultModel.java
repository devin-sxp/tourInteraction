package com.tourInteraction.entity;

import java.io.Serializable;
import java.util.List;

public class SolrResultModel implements Serializable{
    // 列表
    private List<Object> list;
    // 总数
    private Long recordCount;
    // 总页数
    private int pageCount;
    // 当前页
    private int curPage;
    //查询类型
    private String queryType;
    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public Long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Long recordCount) {
        this.recordCount = recordCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }
}
