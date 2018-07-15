package com.rl.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbFeatureDao;
import com.rl.ecps.model.EbFeature;

@Repository
public class EbFeatureDaoimpl extends SqlSessionDaoSupport implements EbFeatureDao {

	String ns = "com.rl.ecps.dao.EbFeatureMapper.";
	
	@Override
	public List<EbFeature> selectCommFeature() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"selectCommFeature");
	}

	@Override
	public List<EbFeature> selectSpecFeature() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"selectSpecFeature");
	}

	@Override
	public List<EbFeature> selectIsSelectFeature() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(ns+"selectIsSelectFeature");
	}
  
}
