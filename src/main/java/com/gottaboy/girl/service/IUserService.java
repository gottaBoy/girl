package com.gottaboy.girl.service;

import com.github.pagehelper.PageInfo;
import com.gottaboy.girl.bean.User;
import com.gottaboy.girl.bean.UserCost;
import com.gottaboy.girl.bean.UserLevel;
import com.gottaboy.girl.bean.VoUserLevel;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Set;

public interface IUserService {
	/**
	 * 创建用户
	 * 
	 * @param user
	 */
	public User createUser(User user);

	public User updateUser(User user);

	public void deleteUser(Long userId);

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param newPassword
	 */
	public void changePassword(Long userId, String newPassword);

	User findOne(Long userId);

	List<User> findAll();

	PageInfo<User> getPageInfo(int pageNum, int pageSize);

	/**
	 * 根据用户名查找用户
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(String username);

	/**
	 * 根据用户名查找其角色
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> findRoles(String username);

	/**
	 * 根据用户名查找其权限
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> findPermissions(String username);

//	public List<UserCost> findUserCosts(Long userId);
//
//	public void createUserCost(UserCost userCost, Boolean chgSheetCost);
//
//	public List<VoUserLevel> findUserLevels(Long userId);
//
//	public void createUserLevel(UserLevel userLevel, Boolean chgSheetCost);
//
//	public BigDecimal findUserCost(Long userId, Date costDate);
//
//	public UserLevel findUserLevel(Long userId, Date levelDate);
}
