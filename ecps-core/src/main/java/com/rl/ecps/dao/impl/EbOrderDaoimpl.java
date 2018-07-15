package com.rl.ecps.dao.impl;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbOrderDao;
import com.rl.ecps.model.EbOrder;

@Repository
public class EbOrderDaoimpl extends SqlSessionDaoSupport implements EbOrderDao{

	String ns = "com.ecps.dao.EbOrderMapper.";
	
	@Override
	public void saveOrder(EbOrder order) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(ns+"insert",order);
	}

	@Override
	public void updateOrder(EbOrder order) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective",order);
	}

	@Override
	public EbOrder selectOrderById(Long orderId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey",orderId);
	}

	@Override
	public EbOrder selectOrderAndDetailById(Long orderId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectOrderAndDetailById",orderId);
	}

	

}
