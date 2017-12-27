package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.UserManageDao;
import com.tourInteraction.entity.Role;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IUserManageService;
import org.springframework.transaction.annotation.Transactional;

@Service("userManageServiceImpl")
public class UserManageServiceImpl implements IUserManageService {

	@Resource
	private UserManageDao userManageDao;

	@Override
	public int getUserCount(Map<String, Object> mapParam) {
		return userManageDao.getUserCount(mapParam);
	}

	@Override
	public List<User> getUser(Map<String, Object> mapParam) {
		return userManageDao.getUser(mapParam);
	}

	@Override
	public User getUserById(int userId) {
		return userManageDao.getUserById(userId);
	}

	@Override
	public List<Role> getUserRole() {
		return userManageDao.getUserRole();
	}

	@Override
	public int updateUser(Map<String, Object> mapParam) {
		return userManageDao.updateUser(mapParam);
	}

	@Override
	public int addUser(Map<String, Object> mapParam) {
		return userManageDao.addUser(mapParam);
	}

	@Override
	public int delUserById(int userId) {
		return userManageDao.delUserById(userId);
	}

	@Override
	public int lockUserById(int userId, String status) {
		return userManageDao.lockUserById(userId,status);
	}

	@Override
	public List<User> getUserByInteraction(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return userManageDao.getUserByInteraction(mapParam);
	}

	@Override
	public int updateUserIcon(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return userManageDao.updateUserIcon(mapParam);
	}

	@Override
	@Transactional(readOnly = true)
	public List<User> getUserRand(Map<String, Object> mapParam) {
		return userManageDao.getUserRand(mapParam);
	}


}
