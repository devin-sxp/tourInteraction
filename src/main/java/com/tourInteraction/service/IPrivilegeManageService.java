package com.tourInteraction.service;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.Privilege;

public interface IPrivilegeManageService {

	List<Privilege> getPrivileges();

	int delPrivilegeById(int privilegeId);

	int updatePrivilege(Privilege privilege);

	int addPrivilege(Map<String, Object> mapParam);

}
