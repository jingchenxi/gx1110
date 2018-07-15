package com.rl.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbParaValueDao;
import com.rl.ecps.model.EbParaValue;

@Repository
public class EbParaValueDaoimpl extends SqlSessionDaoSupport implements EbParaValueDao {

	String ns = "com.rl.ecps.dao.EbParaValueMapper.";
	
	@Override
	public void saveParaValue(List<EbParaValue> paraValueList, Long itemId) {
		// TODO Auto-generated method stub
      SqlSession sqlSession = this.getSqlSession();
      for (EbParaValue pv : paraValueList) {
		pv.setItemId(itemId);
		sqlSession.insert(ns+"insert", pv);
	   }
      
	}

}
