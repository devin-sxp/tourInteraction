package com.tourInteraction.serviceImpl;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.dao.HistorySearchDao;
import com.tourInteraction.entity.HistorySearch;
import com.tourInteraction.service.IHistorySearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("historyServiceImpl")
public class HistorySearchServiceImpl implements IHistorySearchService {

	@Autowired
	private HistorySearchDao historySearchDao;

	@Override
	public List<HistorySearch> getHistorySearchList(Map<String, Object> mapParam) {
		return historySearchDao.getHistorySearchList(mapParam);
	}

	@Override
	@Transactional
	public int addOrUpdateHistorySearch(Map<String, Object> map) {
		int num = 0;
		HistorySearch h = historySearchDao.checkSaveThisHistory((String)map.get("searchValue"));
		if(historySearchDao.checkSaveThisHistory((String)map.get("searchValue")) != null){
			map.put("historySearchAddCount", GlobalConstantKey.HISTORY_SEARCH_COUNT_ADD);
			num = historySearchDao.updateHistorySearch(map);
		}else{
			map.put("historySearchCount",GlobalConstantKey.HISTORY_SEARCH_COUNT_DEFAULT);
			num = historySearchDao.addHistorySearch(map);
		}
		return num;
	}

	@Override
	public int delOutOfdateHistorySearchData() {
		return historySearchDao.delOutOfdateHistorySearchData();
	}
}
