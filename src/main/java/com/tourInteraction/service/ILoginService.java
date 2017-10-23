package com.tourInteraction.service;

import com.tourInteraction.entity.User;

public interface ILoginService {

	User getUser(User user) throws Exception;
	boolean setUser(User user);
	User getUserByUserNameDao(String username);
	
}
