package com.tourInteraction.service;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.Role;
import com.tourInteraction.entity.User;

public interface IUserManageService {

	int getUserCount(Map<String, Object> mapParam);

	List<User> getUser(Map<String, Object> mapParam);

	User getUserById(int userId);

	List<Role> getUserRole();

	int updateUser(Map<String, Object> mapParam);

	int addUser(Map<String, Object> mapParam);

	int delUserById(int userId);

	int lockUserById(int userId, String status);

	List<User> getUserByInteraction(Map<String, Object> mapParam);


}
