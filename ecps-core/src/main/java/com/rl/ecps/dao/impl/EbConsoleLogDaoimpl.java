package com.rl.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbConsoleLogDao;
import com.rl.ecps.model.EbConsoleLog;

@Repository
public class EbConsoleLogDaoimpl extends SqlSessionDaoSupport implements EbConsoleLogDao {

	String ns = "com.rl.ecps.dao.EbConsoleLogMapper.";
	
	@Override
	public void saveConsoleLog(EbConsoleLog consoleLog) {
		// TODO Auto-generated method stub
      this.getSqlSession().insert(ns+"insert", consoleLog);
	}

}
