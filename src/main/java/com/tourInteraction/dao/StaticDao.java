package com.tourInteraction.dao;

import java.util.List;

import com.tourInteraction.entity.Static;

public interface StaticDao {

	List<Static> getStatic(String staticType);

}
