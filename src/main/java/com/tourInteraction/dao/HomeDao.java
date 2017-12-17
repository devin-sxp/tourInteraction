package com.tourInteraction.dao;

import com.tourInteraction.entity.Home;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HomeDao{

	List<Home> getTopNews(@Param("limit") int limit,@Param("offset") int offset);

	int insertNews(int i, int j);

}
