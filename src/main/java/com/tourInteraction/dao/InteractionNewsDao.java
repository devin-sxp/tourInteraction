package com.tourInteraction.dao;

import com.tourInteraction.entity.InteractionNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface InteractionNewsDao{
	List<InteractionNews> getNews(Map<String, Object> mapParam);

	int getNewsCount(Map<String, Object> mapParam);

	int addNews(Map<String, Object> mapParam);

	InteractionNews getNewsById(@Param("newsId")int newsId);

	int delNewsById(@Param("id") int id);

}
