package com.tourInteraction.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tourInteraction.dao.PrivilegeManageDao;
import com.tourInteraction.entity.Privilege;
import com.tourInteraction.service.IPrivilegeManageService;


@Service("privilegeManageServiceImpl")
public class PrivilegeManageServiceImpl implements IPrivilegeManageService {
	
	@Resource
	private PrivilegeManageDao privilegeDao;
	@Override
	public List<Privilege> getPrivileges() {
		// TODO Auto-generated method stub
		return privilegeDao.getPrivileges();
	}

	@Override
	public int delPrivilegeById(int privilegeId) {
		// TODO Auto-generated method stub
		return privilegeDao.delPrivilegeById(privilegeId);
	}

	@Override
	public int updatePrivilege(Privilege privilege) {
		// TODO Auto-generated method stub
		return privilegeDao.updatePrivilege(privilege);
	}

	@Override
	public int addPrivilege(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return privilegeDao.addPrivilege(mapParam);
	}
	
}
