package com.tourInteraction.dao;

import java.util.List;

import com.tourInteraction.entity.User;

public interface LoginDao {

	User getUserDao(User user);

	int setUserDao(User user);

	List<User> checkAccount(User user);

}
