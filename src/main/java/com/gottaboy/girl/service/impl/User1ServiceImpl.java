package com.gottaboy.girl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.gottaboy.girl.bean.User1;
import com.gottaboy.girl.dao.User1Mapper;
import com.gottaboy.girl.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

@Service
public class User1ServiceImpl implements UserService {

  private Logger logger = LoggerFactory.getLogger(this.getClass());
  
  @Autowired
  private User1Mapper user1Mapper;
  
  @Override
  public int deleteByPrimaryKey(Long id){
	  return user1Mapper.deleteByPrimaryKey(id);
  }

  @Override
  public int insert(User1 record){
	  return user1Mapper.insert(record);
  }

  @Override
  public int insertSelective(User1 record){
	  return user1Mapper.insertSelective(record);
  }

  @Override
  public User1 selectByPrimaryKey(Long id){
	  return user1Mapper.selectByPrimaryKey(id);
  }

  @Override
  public int updateByPrimaryKeySelective(User1 record){
	  return user1Mapper.updateByPrimaryKeySelective(record);
  }

  @Override
  public int updateByPrimaryKey(User1 record){
	  return user1Mapper.updateByPrimaryKey(record);
  }
    
    @Override
    public PageInfo<User1> getUserPageList(User1 record, int pageNum, int pageSize){
        List<User1> list = new ArrayList<User1>();
        Map<String, Object> params = new HashMap<>();
        PageHelper.startPage(pageNum, pageSize);
		if(record.getAge()!=null){
			 params.put("age",record.getAge());
		}
        list = user1Mapper.getUserList(params);
		PageInfo<User1> page = new PageInfo<User1>(list);
		logger.debug(page.toString());
		return page;
    }
  
	@Override
	public List<User1> getUserList(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Map<String, Object> params = new HashMap<String, Object>();
//		if(record!=null){
//			params.put("shipperName",record.getShipperName());
//		}
//		PageInfo<User1> page = new PageInfo<User1>(list);
//		logger.debug(page.toString());
		return user1Mapper.getUserList(params);
	}

}
