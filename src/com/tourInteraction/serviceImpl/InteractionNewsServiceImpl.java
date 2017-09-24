package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.InteractionNewsDao;
import com.tourInteraction.entity.InteractionNews;
import com.tourInteraction.service.IInteractionNewsService;

@Service("interactionNewsServiceImpl")
public class InteractionNewsServiceImpl implements IInteractionNewsService {

	@Resource
	private InteractionNewsDao interactionNewsDao;

	

	@Override
	public List<InteractionNews> getNews(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return interactionNewsDao.getNews(mapParam);
	}



	@Override
	public int getNewsCount(Map<String, Object> mapParam) {
		return interactionNewsDao.getNewsCount(mapParam);
	}



	@Override
	public int addNews(Map<String, Object> mapParam) {
		return interactionNewsDao.addNews(mapParam);
	}



	@Override
	public InteractionNews getNewsById(int newsId) {
		return interactionNewsDao.getNewsById(newsId);
	}



	@Override
	public int delNewsById(int id) {
		return interactionNewsDao.delNewsById(id);
	}

	

	

}
