package com.gottaboy.girl.dao;

import com.gottaboy.girl.bean.User1;

import java.util.List;
import java.util.Map;

public interface User1Mapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(User1 record);

    int insertSelective(User1 record);

    User1 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User1 record);

    int updateByPrimaryKey(User1 record);
    
    List<User1> getUserList(Map<String, Object> params);
}