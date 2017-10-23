package com.tourInteraction.interceptor;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.tourInteraction.entity.User;
import com.tourInteraction.service.ILoginService;

public class ShiroRealm extends AuthorizingRealm{
	@Resource(name="loginServiceImpl")
	private ILoginService loginservice ;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken)token;
		User user = loginservice.getUserByUserNameDao(usernamePasswordToken.getUsername());
		if(user == null){
			return null;
		}else{
			AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user,user.getPassWord(),getName());
			return authenticationInfo;
		}
	}

}
