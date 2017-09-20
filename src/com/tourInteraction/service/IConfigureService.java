package com.tourInteraction.service;

import java.util.List;

import com.tourInteraction.entity.Configure;

public interface IConfigureService {

	List<Configure> getConfigure();

	int addConfigure(Configure configure);

	int delConfigureById(int id);

	int updateConfigure(Configure configure);

	Configure getConfigureById(long id);
	
}
