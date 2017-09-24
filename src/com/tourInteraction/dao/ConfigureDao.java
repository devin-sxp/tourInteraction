package com.tourInteraction.dao;

import java.util.List;

import com.tourInteraction.entity.Configure;

public interface ConfigureDao {

	List<Configure> getConfigure();
	int addConfigure(Configure configure);
	int updateConfigure(Configure configure);
	int delConfigureById(int id);
	Configure getConfigureById(long id);

}
