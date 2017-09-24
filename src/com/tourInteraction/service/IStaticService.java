package com.tourInteraction.service;

import java.util.List;

import com.tourInteraction.entity.Static;

public interface IStaticService {
	List<Static> getStatic(String staticType);
}
