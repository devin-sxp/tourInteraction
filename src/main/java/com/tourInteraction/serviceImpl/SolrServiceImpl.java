package com.tourInteraction.serviceImpl;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.entity.SolrResultModel;
import com.tourInteraction.service.ISolrService;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SolrServiceImpl implements ISolrService{

    @Autowired
    private HttpSolrClient httpSolrClient;

    @Override
    public SolrResultModel getSolrData(String queryString, String queryType,String sort, Integer page, Integer pageSize) throws Exception {
        // 创建SolrQuery对象
        SolrQuery query = new SolrQuery();

        // 输入关键字
        if (!StringUtils.isEmpty(queryString)) {
            // 设置高亮信息
            query.setHighlight(true);
            if(queryType.equals(GlobalConstantKey.QUERY_TYPE_NEWS)){
                query.setQuery("newsTitle:*"+queryString+ "* or newsContent:*"+queryString+"*");
                query.addHighlightField("newsTitle");
                query.addHighlightField("newsContent");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_ARTICLE)){
                query.setQuery("articleName:*"+queryString+ "* or articleContent:*"+queryString+"*");
                query.addHighlightField("articleName");
                query.addHighlightField("articleContent");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_ARTICLE_SUBJECT)){
                query.setQuery("articleSubjectTitle:*"+queryString+ "* or articleSubjectDescription:*"+queryString+"*");
                query.addHighlightField("articleSubjectTitle");
                query.addHighlightField("articleSubjectDescription");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_USER)){
                query.setQuery("userName:*"+queryString + "*");
                query.addHighlightField("userName");
            }
            query.setHighlightSimplePre("<em class=\"search-result-highlight\" >");
            query.setHighlightSimplePost("</em>");
        } else {
            if(queryType.equals(GlobalConstantKey.QUERY_TYPE_NEWS)){
                query.setQuery("newsTitle:*");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_ARTICLE)){
                query.setQuery("articleName:*");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_ARTICLE_SUBJECT)){
                query.setQuery("articleSubjectTitle:*");
            }else if(queryType.equals(GlobalConstantKey.QUERY_TYPE_USER)){
                query.setQuery("userName:*");
            }
        }

//        // 分类过滤条件
//        if (!StringUtils.isEmpty(catalogName)) {
//            query.addFilterQuery("catalog_name:" + catalogName);
//        }
//
//        // 输入区间过滤条件
//        // price的值：0-9 10-19
//        if (!StringUtils.isEmpty(price)) {
//            String[] ss = price.split("-");
//            if (ss.length == 2) {
//                query.addFilterQuery("price:[" + ss[0] + " TO " + ss[1]
//                        + "]");
//            }
//        }

        // 设置排序
        if ("desc".equals(sort)) {
            query.setSort("createTime", SolrQuery.ORDER.desc);
        } else {
            query.setSort("createTime", SolrQuery.ORDER.asc);
        }

        // 设置分页信息
        if (page == null)
            page = 1;
        if (pageSize == null) {
            pageSize = 10;
        }
        query.setStart((page - 1) * pageSize);
        query.setRows(pageSize);
        QueryResponse response = null;

        try {
            response = httpSolrClient.query(query);
        }catch (Exception e){
            e.printStackTrace();
        }
        // 查询出的结果
        SolrDocumentList results = response.getResults();
        // 记录总数
        long count = results.getNumFound();

        if(!StringUtils.isEmpty(queryString)){
            // 获取高亮信息
            Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();

            //重设高亮字段
            for (SolrDocument doc : results) {
                List<String> hNewsTitle = highlighting.get(doc.get("id")).get("newsTitle");
                if(hNewsTitle != null)
                    doc.setField("newsTitle",hNewsTitle.get(0));
                List<String> hNewsContent = highlighting.get(doc.get("id")).get("newsContent");
                if (hNewsContent != null)
                    doc.setField("newsContent",hNewsContent.get(0));
                List<String> hArticleName = highlighting.get(doc.get("id")).get("articleName");
                if(hArticleName != null)
                    doc.setField("articleName",hArticleName.get(0));
                List<String> hArticleContent = highlighting.get(doc.get("id")).get("articleContent");
                if (hArticleContent != null)
                    doc.setField("articleContent",hArticleContent.get(0));

                List<String> hSubjectTitle = highlighting.get(doc.get("id")).get("articleSubjectTitle");
                if (hSubjectTitle != null)
                    doc.setField("articleSubjectTitle",hSubjectTitle.get(0));
                List<String> hSubjectDescription = highlighting.get(doc.get("id")).get("articleSubjectDescription");
                if (hSubjectDescription != null)
                    doc.setField("articleSubjectDescription",hSubjectDescription.get(0));

                List<String> hUserName = highlighting.get(doc.get("id")).get("userName");
                if (hUserName != null)
                    doc.setField("userName",hUserName.get(0));
            }
        }

        //重新封装数据
//        List<Object> list = new ArrayList<Object>();
//        if(queryType.equals(GlobalConstantKey.QUERY_TYPE_NEWS)){
//            InteractionNews interactionNews = null;
//
//            for (SolrDocument doc : results) {
//                interactionNews = new InteractionNews();
//                interactionNews.setId(Integer.parseInt(doc.get("newsId").toString()));
//                interactionNews.setModuleId(Integer.parseInt(doc.get("moduleId").toString()));
//                interactionNews.setNewsTitle(doc.get("newsTitle").toString());
//                interactionNews.setNewsContent(doc.get("newsContent").toString());
//                interactionNews.setCreateUser(Integer.parseInt(doc.get("createUser").toString()));
//                interactionNews.setCreateTime((Date) doc.get("createTime"));
//                list.add(interactionNews);
//
//            }
//
//        }else  if(queryType.equals(GlobalConstantKey.QUERY_TYPE_ARTICLE)){
//            Article article = null;
//
//            for (SolrDocument doc : results) {
//                article = new Article();
//                article.setId(Integer.parseInt(doc.get("articleId").toString()));
//                article.setArticleName(doc.get("articleName").toString());
//                article.setFilePath(doc.get("filePath").toString());
//                article.setArticleContent(doc.get("articleContent").toString());
//                article.setArticleLoveCount(Integer.parseInt(doc.get("articleLoveCount").toString()));
//                article.setArticleSupportCount(Integer.parseInt(doc.get("articleSupportCount").toString()));
//                article.setArticleLookCount(Integer.parseInt(doc.get("articleLookCount").toString()));
//                article.setArticleCommentCount(Integer.parseInt(doc.get("articleCommentCount").toString()));
//                article.setCreateUser(Integer.parseInt(doc.get("createUser").toString()));
//                article.setCreateUserName(doc.get("createUserName").toString());
//                article.setUserIconPath(doc.get("userIconPath").toString());
//                article.setCreateTime((Date) doc.get("createTime"));
//                list.add(article);
//
//            }
//
//        }

        // 封装SolrResultModel对象
        SolrResultModel rm = new SolrResultModel();
//        rm.setList(list);
        rm.setList((List)results);
        rm.setCurPage(page);
        rm.setRecordCount(count);
        rm.setQueryType(queryType);
        int pageCount = (int) (count / pageSize);

        if (count % pageSize > 0)
            pageCount++;
        // 设置总页数
        rm.setPageCount(pageCount);
        return rm;
    }
}
