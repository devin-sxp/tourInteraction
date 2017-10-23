package com.tourInteraction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.User;

public interface LoginDao {

	User getUserDao(User user);

	int setUserDao(User user);

	List<User> checkAccount(User user);

	User getUserByUserNameDao(@Param("username")String username);

}
