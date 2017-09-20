package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.InteractionNews;

public interface InteractionNewsDao {

	List<InteractionNews> getNews(Map<String, Object> mapParam);

	int getNewsCount(Map<String, Object> mapParam);

	int addNews(Map<String, Object> mapParam);

	InteractionNews getNewsById(@Param("newsId")int newsId);

	int delNewsById(@Param("id") int id);

}
