package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.tourInteraction.dao.InteractionModelDao;
import com.tourInteraction.entity.InteractionModel;
import com.tourInteraction.service.IInteractionModelService;

@Service("interactionModelServiceImpl")
public class InteractionModelServiceImpl implements IInteractionModelService {

	@Resource
	private InteractionModelDao interactionModelDao;

	@Override
	@Cacheable("moduleListCache")
	public List<InteractionModel> getModel(String limit, String offset) {
		return interactionModelDao.getModel(limit,offset);
	}

	@Override
	public InteractionModel getModuleById(int id) {
		return interactionModelDao.getModuleById(id);
	}

	@Override
	@CacheEvict(value="moduleListCache",allEntries=true)
	public int delModuleById(int id) {
		return interactionModelDao.delModuleById(id);
	}

	@Override
	@CacheEvict(value="moduleListCache",allEntries=true)
	public int updateModule(Map<String, Object> mapParam) {
		return interactionModelDao.updateModule(mapParam);
	}

	@Override
	@CacheEvict(value="moduleListCache",allEntries=true)
	public int addModule(Map<String, Object> mapParam) {
		return interactionModelDao.addModule(mapParam);
	}

	

}
