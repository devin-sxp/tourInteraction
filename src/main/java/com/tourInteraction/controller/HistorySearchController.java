package com.tourInteraction.controller;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.entity.HistorySearch;
import com.tourInteraction.service.IHistorySearchService;
import com.tourInteraction.utils.DateUtil;
import com.tourInteraction.utils.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/historySearch")
public class HistorySearchController {
	
	@Autowired
	private IHistorySearchService historySearchService ;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getHistorySearchList.do")
	@ResponseBody
	public String getHistorySearchList(HttpServletRequest req, @RequestParam("limit") String limit,
									   @RequestParam("offset") String offset){
		logger.info("historySearch/getHistorySearchList.do");
		Map<String,Object> mapParam = new HashMap<String,Object>();
		mapParam.put("limit",limit);
		mapParam.put("offset",offset);
		List<HistorySearch> list = historySearchService.getHistorySearchList(mapParam);
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	@RequestMapping(value="/addOrUpdateHistorySearch.do")
	@ResponseBody
	public String addOrUpdateHistorySearch(HttpServletRequest req,@RequestParam("searchValue") String searchValue){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchValue",searchValue);
		map.put("createTime",new Date());
		map.put("outOfDate", DateUtil.dateAddOrSub(new Date(), GlobalConstantKey.CHANGE_VALUE_THREE,GlobalConstantKey.CHANGE_DAY));
		map.put("status",GlobalConstantKey.STATUS_OPEN);
		int num = historySearchService.addOrUpdateHistorySearch(map);
		String result = "操作历史记录失败";
		if(num > 0){
			result = "操作历史记录成功";
		}
		logger.info(result);
		return result;
	}
}
