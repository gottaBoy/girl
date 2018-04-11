package com.gottaboy.girl.dao;

import java.util.List;

import com.gottaboy.girl.bean.Resource;
import org.apache.ibatis.annotations.Param;

public interface ResourceMapper {
	public int deleteByPrimaryKey(Long id);

	public int insert(Resource record);

	public int insertSelective(Resource record);

	public Resource selectByPrimaryKey(Long id);

	public int updateByPrimaryKeySelective(Resource record);

	public int updateByPrimaryKey(Resource record);

	public void deleteDescendants(@Param("selfAsParentIds") String selfAsParentIds);

	public List<Resource> findAll();
}