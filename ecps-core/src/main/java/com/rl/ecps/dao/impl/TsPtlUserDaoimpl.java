package com.rl.ecps.dao.impl;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.TsPtlUserDao;
import com.rl.ecps.model.TsPtlUser;

@Repository
public class TsPtlUserDaoimpl extends SqlSessionDaoSupport implements TsPtlUserDao {

	String ns = "com.rl.ecps.dao.TsPtlUserMapper.";
	@Override
	public TsPtlUser selectUserByUserAndPass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectUserByUserAndPass", map);
	}

}
