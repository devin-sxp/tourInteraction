package com.tourInteraction.controller;

import com.tourInteraction.service.IMessageRemindService;
import com.tourInteraction.utils.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "messageRemind")
public class MessageRemindController {
	@Autowired
	@Qualifier(value = "messageRemindServiceImpl")
	private IMessageRemindService messageRemindServiceImpl;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 获取提醒信息
	 * @param req
	 * @param limit
	 * @param offset
	 * @return
	 */
	@RequestMapping("getMessageRemind.do")
	@ResponseBody
	public String getMessageRemind(HttpServletRequest req,
								@RequestParam("limit") int limit,
								@RequestParam("offset") int offset){
		logger.info("messageRemind/getMessageRemind.do被调用");
		Map<String,Object> mapParam = new HashMap<String, Object>();
		mapParam.put("targetUserId",SignInAndUpController.getSignInUser(req).getId());
		mapParam.put("limit",limit);
		mapParam.put("offset",offset);
		Map<String,Object> map= messageRemindServiceImpl.getMessageRemind(mapParam);
		String result = JSONUtil.map2json(map);
		return result;
	}

	@RequestMapping("getMessageRemindCount.do")
	@ResponseBody
	public String getMessageRemindCount(HttpServletRequest req){
		logger.info("messageRemind/getMessageRemindCount.do被调用");
		Map<String,Object> mapParam = new HashMap<String, Object>();
		mapParam.put("targetUserId",SignInAndUpController.getSignInUser(req).getId());
		int count= messageRemindServiceImpl.getMessageRemindCount(mapParam);
		return count+"";
	}

	/**
	* 删除提醒消息
	* */
    @RequestMapping(value = "delMessageRemind.do")
    @ResponseBody
    public String delMessageRemind(@RequestParam("messageRemindId") int id){
		logger.info("messageRemind/delMessageRemind.do被调用");
		String isSuccess = messageRemindServiceImpl.delMessageRemind(id);
        return isSuccess;
    }
}
