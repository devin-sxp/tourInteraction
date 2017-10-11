package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.Role;

public interface RoleManageDao {

	public List<Role> getRoles();

	public int delRoleById(@Param("roleId")int roleId);

	public int addRole(Map<String, Object> mapParam);

	public int updateRole(Role role);

}
