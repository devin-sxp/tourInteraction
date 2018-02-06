package com.tourInteraction.dao;

import com.tourInteraction.entity.MessageRemind;
import com.tourInteraction.entity.MessageRemindCount;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MessageRemindDao {

	int insertMessageRemind(Map<String,Object> map);

	List<MessageRemind> getMessageRemind(Map<String, Object> mapParam);

	List<MessageRemindCount> getMessageRemindCount(Map<String, Object> mapParam);

	int getMessageRemindAllCount(Map<String, Object> mapParam);

	int getArticleRequestSubmitNewsCount(Map<String, Object> mapParam);

    int delMessageRemind(@Param("id") int id);

	int insertMessageRemindDetail(Map<String, Object> map);

    int delMessageRemindDetail(@Param("msgRemindId")int msgRemindId);
}
