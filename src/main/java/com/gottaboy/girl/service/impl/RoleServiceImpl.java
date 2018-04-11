package com.gottaboy.girl.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.gottaboy.girl.bean.Role;
import com.gottaboy.girl.dao.RoleMapper;
import com.gottaboy.girl.service.IResourceService;
import com.gottaboy.girl.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * User: Zhang Kaitao
 * <p>
 * Date: 14-1-28
 * <p>
 * Version: 1.0
 */
@Service

public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleDao;
	@Autowired
	private IResourceService resourceService;

	public Role createRole(Role role) {
		int ret = roleDao.insert(role);
		return role;
	}

	public Role updateRole(Role role) {
		int ret = roleDao.updateByPrimaryKey(role);
		return role;
	}

	public void deleteRole(Long roleId) {
		roleDao.deleteByPrimaryKey(roleId);
	}

	@Override
	public Role findOne(Long roleId) {
		return roleDao.selectByPrimaryKey(roleId);
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	@Override
	public Set<String> findRoles(Long... roleIds) {
		Set<String> roles = new HashSet<String>();
		for (Long roleId : roleIds) {
			Role role = findOne(roleId);
			if (role != null) {
				roles.add(role.getRole());
			}
		}
		return roles;
	}

	@Override
	public Set<String> findPermissions(Long[] roleIds) {
		Set<Long> resourceIds = new HashSet<Long>();
		for (Long roleId : roleIds) {
			Role role = findOne(roleId);
			if (role != null) {
				resourceIds.addAll(role.getResourceIds());
			}
		}
		return resourceService.findPermissions(resourceIds);
	}
}
