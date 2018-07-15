package com.rl.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbShipAddrDao;
import com.rl.ecps.model.EbShipAddr;

@Repository
public class EbShipAddrDaoimpl extends SqlSessionDaoSupport implements EbShipAddrDao {

	String ns = "com.rl.ecps.dao.EbShipAddrMapper.";
	@Override
	public List<EbShipAddr> selectAddrByUserId(Long userId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"selectAddrByUserId", userId);
	}
	
	@Override
	public EbShipAddr selectShipAddrById(Long shipAddrId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectShipAddrById", shipAddrId);
	}

	@Override
	public void saveAddr(EbShipAddr addr) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(ns+"insert", addr);
	}

	@Override
	public void updateAddr(EbShipAddr addr) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", addr);
	}

	@Override
	public void destoryDefault(Long userId) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+"destoryDefault", userId);
	}

	@Override
	public void deleteAddrByPrimaryKey(Long shipAddrId) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(ns+"deleteAddrByPrimaryKey", shipAddrId);
	}

}
