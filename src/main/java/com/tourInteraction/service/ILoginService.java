package com.tourInteraction.service;

import com.tourInteraction.entity.User;

import java.util.Map;

public interface ILoginService {

	User getUser(User user) throws Exception;
	boolean setUser(User user);
	User getUserByUserNameDao(String username);

    int addAutoLogin(Map<String, Object> mapParam);
    String getAutoLogin(Map<String, Object> mapParam);

    void clearOutOfDateAutoLoginData();
}
