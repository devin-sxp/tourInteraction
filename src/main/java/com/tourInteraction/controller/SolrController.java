package com.tourInteraction.controller;

import com.tourInteraction.entity.SolrResultModel;
import com.tourInteraction.service.ISolrService;
import com.tourInteraction.utils.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("solr")
public class SolrController {

    @Autowired
    private ISolrService solrServiceImpl;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("getData.do")
    public @ResponseBody String getData(HttpServletRequest req,
                     @RequestParam("queryString") String queryString,
                     @RequestParam("queryType") String queryType,
                     @RequestParam("sort") String sort,
                     @RequestParam("page") Integer page,
                     @RequestParam("pageSize") Integer pageSize){

        logger.debug("getData.do被调用");
        SolrResultModel solrResultModel = null;
        try {
            solrResultModel = solrServiceImpl.getSolrData(queryString,queryType,sort, page, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String result = JSONUtil.object2json(solrResultModel);
        return result;
    }
}
