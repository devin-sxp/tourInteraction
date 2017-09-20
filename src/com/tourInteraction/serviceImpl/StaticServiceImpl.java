package com.tourInteraction.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.StaticDao;
import com.tourInteraction.entity.Static;
import com.tourInteraction.service.IStaticService;

@Service
public class StaticServiceImpl implements IStaticService {

	@Resource(name = "staticDao")
	private StaticDao staticDao;
	@Override
	public List<Static> getStatic(String staticType) {
		return staticDao.getStatic(staticType);
	}

}
