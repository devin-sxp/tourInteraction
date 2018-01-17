package com.tourInteraction.config;

import java.util.ArrayList;
import java.util.List;

public class GlobalConstantKey {

    /**
     * 数据开放设置
     */
    public static final String STATUS_CLOSE = "0";
    public static final String STATUS_OPEN = "1";

    /**
     * 用户模块
     * 默认值：
     * 积分、电话、邮箱    角色:管理员、用户、游客
     */
    public static final int INTEGRATION = 0;
    public static final String PHONE_NUMBER = "0";
    public static final String EMAIL = "0";
    public static final int ROLE_ADMIN = 1;
    public static final int ROLE_CUSTOM = 2;
    public static final int ROLE_BROWSER = 3;

    /**
     * 文章浏览、喜欢、支持、评论数默认值
     */
    public static final int ARTICLE_LOOK_COUNT = 0;
    public static final int ARTICLE_LOVE_COUNT = 0;
    public static final int ARTICLE_SUPPORT_COUNT = 0;
    public static final int ARTICLE_COMMENT_COUNT = 0;

    /**
     * 文章评论和回复数默认值
     */
    public static final int COMMENT_PRAISE_COUNT = 0;
    public static final int COMMENT_REPLY_COUNT = 0;

    /**
     * 评论赞、评论和回复、文章看、喜欢、支持增减值
     */
    public static final int PRAISE_COUNT_ADD_VALUE = 1;
    public static final int REPLY_COUNT_ADD_VALUE = 1;
    public static final int LOOK_COUNT_ADD_VALUE = 1;
    public static final int LOVE_COUNT_ADD_VALUE = 1;
    public static final int LOVE_COUNT_SUB_VALUE = -1;
    public static final int SUPPORT_COUNT_ADD_VALUE = 1;

    /**
     * solr
     */
    public static final String QUERY_TYPE_NEWS ="interaction_news";
    public static final String QUERY_TYPE_ARTICLE ="article";
    public static final String QUERY_TYPE_ARTICLE_SUBJECT="article_subject";
    public static final String QUERY_TYPE_USER="USER";

    /**
     * 日期变化
     */
    public static final String CHANGE_YEAR="year";
    public static final String CHANGE_MONTH="month";
    public static final String CHANGE_DAY="day";
    public static final int CHANGE_VALUE_THREE=3;
    public static final int CHANGE_VALUE=7;

    /**
     * 自动登录存储cookie
     * 设置cookie保存7天
     */
    public static final String COOKIR_TOUR_AUTO_LOGIN="cookie_tour_auto_login";
    public static final int COOKIR_AUTO_LOGIN_MAX_AGE=60 * 60 * 24 * 7;

    /**
     * 搜索历史
     */
    public static final int HISTORY_SEARCH_COUNT_DEFAULT=1;
    public static final int HISTORY_SEARCH_COUNT_ADD=1;

    /**
     * request请求传递参数默认值
     */
    public static final String REQUEST_DEFAULT_VALUE = "false";

    public static final String MESSAGE_REMIND_PRE_ARTICLE = "article_comment_";
    public static final String MESSAGE_REMIND_PRE_NEWS = "news_comment_";

    /**
     * 互动信息回复、评论类型
     */
    public static final String NEWS_METHOD_TYPE_COMMENT = "comment";
    public static final String NEWS_METHOD_TYPE_REPLY = "reply";

    /**
     * 文章（知识）类型
     */
    public static final String[] ARTICLE_SUBJECT_TYPES = {"官方","用户"};
}
