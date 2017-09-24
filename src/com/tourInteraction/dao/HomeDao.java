package com.tourInteraction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.Home;

public interface HomeDao{

	List<Home> getTopNews(@Param("limit") int limit,@Param("offset") int offset);

	int insertNews(int i, int j);

}
