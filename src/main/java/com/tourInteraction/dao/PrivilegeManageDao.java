package com.tourInteraction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tourInteraction.entity.Privilege;

public interface PrivilegeManageDao {

	List<Privilege> getPrivileges();

	int delPrivilegeById(@Param("privilegeId")int privilegeId);

	int updatePrivilege(Privilege privilege);

	int addPrivilege(Map<String, Object> mapParam);

	List<Privilege> getRolePossessPrivileges(@Param("roleId") int roleId);

	int saveRolePrivilege(Map<String, Object> mapParam);

	int delRolePossessedPrivilegeByRoleId(@Param("roleId") int roleId);

}
