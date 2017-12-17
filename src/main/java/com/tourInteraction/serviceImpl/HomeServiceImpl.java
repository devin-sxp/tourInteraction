package com.tourInteraction.serviceImpl;

import com.tourInteraction.dao.HomeDao;
import com.tourInteraction.entity.Home;
import com.tourInteraction.service.IHomeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("homeServiceImpl")
public class HomeServiceImpl implements IHomeService {

	@Resource
	private HomeDao homeDao;
	@Override
	public List<Home> getTopNews(int limit, int offset) {
		List<Home> list = homeDao.getTopNews(limit,offset);
		return list;
	}
	@Override
	public int insertNews(int i, int j) {
		int result = homeDao.insertNews(i,j);
		return result;
	}

}
