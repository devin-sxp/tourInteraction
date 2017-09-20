package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.InteractionModelDao;
import com.tourInteraction.entity.InteractionModel;
import com.tourInteraction.service.IInteractionModelService;

@Service("interactionModelServiceImpl")
public class InteractionModelServiceImpl implements IInteractionModelService {

	@Resource
	private InteractionModelDao interactionModelDao;

	@Override
	public List<InteractionModel> getModel(String limit, String offset) {
		return interactionModelDao.getModel(limit,offset);
	}

	@Override
	public InteractionModel getModuleById(int id) {
		return interactionModelDao.getModuleById(id);
	}

	@Override
	public int delModuleById(int id) {
		return interactionModelDao.delModuleById(id);
	}

	@Override
	public int updateModule(Map<String, Object> mapParam) {
		return interactionModelDao.updateModule(mapParam);
	}

	@Override
	public int addModule(Map<String, Object> mapParam) {
		return interactionModelDao.addModule(mapParam);
	}

	

}
