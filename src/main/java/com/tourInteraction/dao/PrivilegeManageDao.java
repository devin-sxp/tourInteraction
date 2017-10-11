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

}
