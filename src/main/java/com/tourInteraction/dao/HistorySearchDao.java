package com.tourInteraction.dao;

import com.tourInteraction.entity.HistorySearch;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HistorySearchDao {

	List<HistorySearch> getHistorySearchList(Map<String, Object> mapParam);

	HistorySearch checkSaveThisHistory(@Param("searchValue") String searchValue);

	int updateHistorySearch(Map<String, Object> map);

	int addHistorySearch(Map<String, Object> map);

    int delOutOfdateHistorySearchData();
}
