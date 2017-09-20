package com.tourInteraction.service;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.InteractionModel;

public interface IInteractionModelService {

	List<InteractionModel> getModel(String limit, String offset);

	InteractionModel getModuleById(int id);

	int delModuleById(int id);

	int updateModule(Map<String, Object> mapParam);

	int addModule(Map<String, Object> mapParam);

}
