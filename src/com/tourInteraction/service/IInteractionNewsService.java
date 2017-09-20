package com.tourInteraction.service;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.InteractionNews;

public interface IInteractionNewsService {

	List<InteractionNews> getNews(Map<String, Object> mapParam);

	int getNewsCount(Map<String, Object> mapParam);

	int addNews(Map<String, Object> mapParam);

	InteractionNews getNewsById(int newsId);

	int delNewsById(int id);


}
