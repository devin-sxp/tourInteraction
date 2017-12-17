package com.tourInteraction.config;

import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@PropertySource("solr.properties")
@EnableWebMvc // 启用 SpringMVC ，相当于 xml中的 <mvc:annotation-driven/>
public class SolrClientConfiguration {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private Environment environment;

    @Bean(name = "httpSolrClient")
    public HttpSolrClient getHttpSolrClient() {
        logger.info("自定义配置SolrClient");
        return new HttpSolrClient.Builder(environment.getProperty("solr.url")).build();
    }
}
