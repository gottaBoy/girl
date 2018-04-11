package com.gottaboy.girl.service;
import java.util.List;
import com.github.pagehelper.PageInfo;
import com.gottaboy.girl.bean.User1;

public interface UserService {
	
	int deleteByPrimaryKey(Long id);

    int insert(User1 record);

    int insertSelective(User1 record);

    User1 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User1 record);

    int updateByPrimaryKey(User1 record);

	public PageInfo<User1> getUserPageList(User1 record, int pageNum, int pageSize);
	
	public List<User1> getUserList(int pageNum, int pageSize);
}
