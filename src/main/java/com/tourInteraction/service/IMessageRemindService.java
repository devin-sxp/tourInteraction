package com.tourInteraction.service;

import java.util.Map;

public interface IMessageRemindService {

	Map<String,Object> getMessageRemind(Map<String, Object> mapParam);

    String delMessageRemind(int id);

    int getMessageRemindCount(Map<String,Object> mapParam);
}
