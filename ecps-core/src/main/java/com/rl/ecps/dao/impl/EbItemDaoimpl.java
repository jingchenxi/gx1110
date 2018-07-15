package com.rl.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.QueryCondition;

@Repository
public class EbItemDaoimpl extends SqlSessionDaoSupport implements EbItemDao {

	String ns = "com.ecps.dao.EbItemMapper.";
	
	@Override
	public List<EbItem> selectItemByCondition(QueryCondition queryCondition) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"selectItemByCondition",queryCondition);
	}

	@Override
	public Integer selectItemByConditionCount(QueryCondition queryCondition) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectItemByConditionCount",queryCondition);
	}

	@Override
	public void saveItem(EbItem item) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(ns+"insert",item);
	}

	@Override
	public void updateItem(EbItem item) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", item);
	}

	@Override
	public List<EbItem> listItem(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"listItem", map);
	}

	@Override
	public EbItem selectItemDetailById(Long itemId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectItemDetailById", itemId);
	}

}
