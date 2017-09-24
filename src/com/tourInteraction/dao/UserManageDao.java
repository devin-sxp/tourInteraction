package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.Role;
import com.tourInteraction.entity.User;

public interface UserManageDao {

	int getUserCount(Map<String, Object> mapParam);

	List<User> getUser(Map<String, Object> mapParam);

	User getUserById(int userId);

	List<Role> getUserRole();

	int updateUser(Map<String, Object> mapParam);

	int addUser(Map<String, Object> mapParam);

	int delUserById(@Param("userId")int userId);

	int lockUserById(@Param("userId")int userId,@Param("status")String status);

	List<User> getUserByInteraction(Map<String, Object> mapParam);

}
