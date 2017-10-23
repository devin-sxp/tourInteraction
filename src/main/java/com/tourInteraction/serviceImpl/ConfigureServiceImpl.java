package com.tourInteraction.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.ConfigureDao;
import com.tourInteraction.entity.Configure;
import com.tourInteraction.service.IConfigureService;

@Service(value="configureServiceImpl")
public class ConfigureServiceImpl implements IConfigureService {

	@Resource(name="configureDao")
	private ConfigureDao configureDao;
	@Override
	@Cacheable("configureCache")
	public List<Configure> getConfigure() {
		// TODO Auto-generated method stub
		return configureDao.getConfigure();
	}
	
	@CacheEvict(value="configureCache",allEntries=true)
	public int addConfigure(Configure configure) {
		// TODO Auto-generated method stub
		return configureDao.addConfigure(configure);
	}
	
	@Override
	@CacheEvict(value="configureCache",allEntries=true)
	public int delConfigureById(int id) {
		// TODO Auto-generated method stub
		return configureDao.delConfigureById(id);
	}
	
	@Transactional(propagation = Propagation.REQUIRED , readOnly = false)
	@Override
	@CacheEvict(value="configureCache",allEntries=true)
	public int updateConfigure(Configure configure) {
		// TODO Auto-generated method stub
		int num = configureDao.updateConfigure(configure);
//		configureDao.addConfigure(configure);
		return num;
	}
	@Override
	public Configure getConfigureById(long id) {
		// TODO Auto-generated method stub
		return configureDao.getConfigureById(id);
	}

}
