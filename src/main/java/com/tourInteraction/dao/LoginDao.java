package com.tourInteraction.dao;

import com.tourInteraction.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LoginDao {

	User getUserDao(User user);

	int setUserDao(User user);

	List<User> checkAccount(User user);

	User getUserByUserNameDao(@Param("username")String username);

	int addAutoLogin(Map<String, Object> mapParam);

    String getAutoLogin(Map<String, Object> mapParam);

    void clearOutOfDateAutoLoginData();
}
