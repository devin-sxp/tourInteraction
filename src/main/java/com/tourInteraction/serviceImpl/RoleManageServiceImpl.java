package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.RoleManageDao;
import com.tourInteraction.entity.Role;
import com.tourInteraction.service.IRoleManageService;

@Service("roleManageServiceImpl")
public class RoleManageServiceImpl implements IRoleManageService {

	@Resource
	private RoleManageDao roleManageDao;

	@Override
	public List<Role> getRoles() {
		// TODO Auto-generated method stub
		return roleManageDao.getRoles();
	}

	@Override
	public int delRoleById(int roleId) {
		// TODO Auto-generated method stub
		return roleManageDao.delRoleById(roleId);
	}

	@Override
	public int addRole(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return roleManageDao.addRole(mapParam);
	}

	@Override
	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleManageDao.updateRole(role);
	}

	

	
}
