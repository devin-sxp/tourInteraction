package com.tourInteraction.service;

import com.tourInteraction.entity.SolrResultModel;

public interface ISolrService {
    public SolrResultModel getSolrData(String queryString,String queryType,String sort,Integer page,Integer pageSize) throws Exception;
}
