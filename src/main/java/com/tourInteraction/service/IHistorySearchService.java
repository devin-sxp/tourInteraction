package com.tourInteraction.service;

import com.tourInteraction.entity.HistorySearch;

import java.util.List;
import java.util.Map;

public interface IHistorySearchService {

	List<HistorySearch> getHistorySearchList(Map<String,Object> mapParam);

	int addOrUpdateHistorySearch(Map<String, Object> map);

	int delOutOfdateHistorySearchData();
}
