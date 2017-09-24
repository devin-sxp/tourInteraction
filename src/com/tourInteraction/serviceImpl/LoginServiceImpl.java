package com.tourInteraction.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.LoginDao;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.ILoginService;

@Service("loginServiceImpl")
public class LoginServiceImpl implements ILoginService {

	@Resource
	private LoginDao loginDao;
	@Override
	public User getUser(User user) throws Exception {
		User userOut = loginDao.getUserDao(user);
		return userOut;
	}

	@Override
	public boolean setUser(User user) {
		if(user.getUserName() != null && user.getUserName() != "" 
				&& user.getPassWord() != null && user.getPassWord() != ""
				&& user.getPhoneNumber() != null && user.getPhoneNumber() != ""
				&& user.getEmail() != null && user.getEmail() != ""){
			
			List<User> list= loginDao.checkAccount(user);
			if(list == null || list.size()==0){
				int result = loginDao.setUserDao(user);
				if(result > 0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}

		}else{
			return false;
		}
	}



}
