package com.tourInteraction.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.HomeDao;
import com.tourInteraction.entity.Home;
import com.tourInteraction.service.IHomeService;

@Service("homeServiceImpl")
public class HomeServiceImpl implements IHomeService {

	@Resource
	private HomeDao homeDao;
	@Override
	public List<Home> getTopNews(int limit, int offset) {
		List<Home> list = homeDao.getTopNews(limit,offset);
		return null;
	}
	@Override
	public int insertNews(int i, int j) {
		int result = homeDao.insertNews(i,j);
		return result;
	}

}
