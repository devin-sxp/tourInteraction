package com.tourInteraction.service;

import java.util.List;

import com.tourInteraction.entity.Home;

public interface IHomeService {

	List<Home> getTopNews(int limit, int offset);

	int insertNews(int i, int j);

}
