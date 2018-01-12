package com.tourInteraction.serviceImpl;

import com.tourInteraction.dao.MessageRemindDao;
import com.tourInteraction.entity.MessageRemind;
import com.tourInteraction.entity.MessageRemindCount;
import com.tourInteraction.service.IMessageRemindService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(value="messageRemindServiceImpl")
public class MessageRemindServiceImpl implements IMessageRemindService {

	@Resource(name="messageRemindDao")
	private MessageRemindDao messageRemindDao;
	@Override
	@Transactional
	public Map<String,Object> getMessageRemind(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		List<MessageRemind> list = messageRemindDao.getMessageRemind(mapParam);
		List<MessageRemindCount> countList = messageRemindDao.getMessageRemindCount(mapParam);
		int allCount = messageRemindDao.getMessageRemindAllCount(mapParam);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("count",countList);
		map.put("list",list);
		map.put("allCount",allCount);
		return map;
	}

	@Override
	public String delMessageRemind(int id) {
		int num = messageRemindDao.delMessageRemind(id);
		if(num>0){
			return "success";
		}else{
			return "failed";
		}
	}

	@Override
	public int getMessageRemindCount(Map<String,Object> mapParam) {
		return messageRemindDao.getMessageRemindAllCount(mapParam) + messageRemindDao.getArticleRequestSubmitNewsCount(mapParam);
	}

}
