package com.tourInteraction.serviceImpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.PrivilegeManageDao;
import com.tourInteraction.entity.Privilege;
import com.tourInteraction.service.IPrivilegeManageService;


@Service("privilegeManageServiceImpl")
public class PrivilegeManageServiceImpl implements IPrivilegeManageService {
	
	@Resource
	private PrivilegeManageDao privilegeDao;
	@Override
	@Transactional(readOnly = true)
	public List<Privilege> getPrivileges(int roleId) {
		// TODO Auto-generated method stub
		List<Privilege> allPrivileges = privilegeDao.getPrivileges();
		List<Privilege> rolePossessPrivileges = privilegeDao.getRolePossessPrivileges(roleId);
		for (Privilege privilege : allPrivileges) {
			privilege.setChecked(false);
			for (Privilege rolePrivilege : rolePossessPrivileges) {
				if(privilege.getId() == rolePrivilege.getId()){
					privilege.setChecked(true);
				}
			}
		}
		return allPrivileges;
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

	@Override
	@Transactional(readOnly = false)
	public int saveRolePrivilege(int roleId, int[] privilegeIds, int userId) {
		// TODO Auto-generated method stub
		int num = 0;
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("roleId", roleId);
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", userId);
		mapParam.put("status", "1");
		num = privilegeDao.delRolePossessedPrivilegeByRoleId(roleId);
		if(privilegeIds != null){
			for (int privilegeId : privilegeIds) {
				mapParam.put("privilegeId", privilegeId);
				num = privilegeDao.saveRolePrivilege(mapParam);
			}
		}

		return num;
	}
	
}
