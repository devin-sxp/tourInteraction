package com.tourInteraction.config;

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
     * 文章评论和回复增值
     */
    public static final int PRAISE_COUNT_ADD_VALUE = 1;
    public static final int REPLY_COUNT_ADD_VALUE = 1;

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
    public static final int CHANGE_VALUE=7;

    /**
     * cookie存储cookie
     * 设置cookie保存7天
     */
    public static final String COOKIR_TOUR_AUTO_LOGIN="cookie_tour_auto_login";
    public static final int COOKIR_AUTO_LOGIN_MAX_AGE=60 * 60 * 24 * 7;

}
