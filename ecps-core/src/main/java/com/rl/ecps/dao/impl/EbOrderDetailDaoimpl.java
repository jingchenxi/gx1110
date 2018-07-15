package com.rl.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbOrderDetailDao;
import com.rl.ecps.model.EbOrderDetail;

@Repository
public class EbOrderDetailDaoimpl extends SqlSessionDaoSupport implements EbOrderDetailDao {

	String ns = "com.ecps.dao.EbOrderDetailMapper.";
	
	@Override
	public void saveOrderDetail(EbOrderDetail orderDetail) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(ns+"insert",orderDetail);
	}

}
