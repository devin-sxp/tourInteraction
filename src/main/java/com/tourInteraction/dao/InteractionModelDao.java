package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.InteractionModel;

public interface InteractionModelDao{

	List<InteractionModel> getModel(@Param("limit") String limit,@Param("offset") String offset);

	InteractionModel getModuleById(@Param("id")int id);

	int delModuleById(@Param("id")int id);

	int updateModule(Map<String, Object> mapParam);

	int addModule(Map<String, Object> mapParam);

}
