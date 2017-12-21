package com.tourInteraction.config;

import com.tourInteraction.service.IHistorySearchService;
import com.tourInteraction.service.ILoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;

public class OPTask{

    @Autowired
    @Qualifier(value = "loginServiceImpl")
    private ILoginService loginService ;

    @Autowired
    private IHistorySearchService historySearchService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 一个cron表达式有至少6个（也可能7个）有空格分隔的时间元素。
     按顺序依次为
     1  秒（0~59）
     2  分钟（0~59）
     3 小时（0~23）
     4  天（0~31）
     5 月（0~11）
     6  星期（1~7 1=SUN 或 SUN，MON，TUE，WED，THU，FRI，SAT）
     7.年份（1970－2099）
     由于"月份中的日期"和"星期中的日期"这两个元素互斥的,必须要对其中一个设置?.
     */
    @Scheduled(cron = "0/30 * * * * ?")
    public void clearAutoLoginData(){
        logger.info("定时清除过时自动登录数据");
        loginService.clearOutOfDateAutoLoginData();
    }
    @Scheduled(cron = "0/30 * * * * ?")
    public void delOutOfdateHistorySearchData(){
        logger.info("定时清除过时搜索记录数据");
        historySearchService.delOutOfdateHistorySearchData();
    }
}
