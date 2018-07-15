package com.rl.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbItemClobDao;
import com.rl.ecps.model.EbItemClob;

@Repository
public class EbItemClobDaoimpl extends SqlSessionDaoSupport implements EbItemClobDao {

	String ns = "com.rl.ecps.dao.EbItemClobMapper.";
	
	@Override
	public void saveItemClob(EbItemClob itemClob, Long itemId) {
		// TODO Auto-generated method stub
	   itemClob.setItemId(itemId);
       this.getSqlSession().insert(ns+"insert", itemClob);
	}

}
