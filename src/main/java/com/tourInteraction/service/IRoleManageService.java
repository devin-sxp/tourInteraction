package com.tourInteraction.service;

import java.util.List;
import java.util.Map;

import com.tourInteraction.entity.Role;

public interface IRoleManageService {

	int delRoleById(int roleId);

	int addRole(Map<String, Object> mapParam);

	List<Role> getRoles();

	int updateRole(Role role);


}
