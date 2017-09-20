package com.tourInteraction.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.IntegrationDao;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IIntegrationtService;


@Service("integrationServiceImpl")
public class IntegrationServiceImpl implements IIntegrationtService {

	@Resource
	private  IntegrationDao integrationDao;

	@Override
	public int addIntegration(User user) {
		return integrationDao.addIntegration(user);
	}

	

}
