package com.rl.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.rl.ecps.dao.EbSkuDao;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.model.EbSpecValue;

@Repository
public class EbSkuDaoimpl extends SqlSessionDaoSupport implements EbSkuDao {

	String ns="com.rl.ecps.dao.EbSkuMapper.";
	String ns1 = "com.rl.ecps.dao.EbSpecValueMapper.";
	@Override
	public void saveSku(List<EbSku> skuList,Long itemId) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = this.getSqlSession();
       for (EbSku ebSku : skuList) {
    	   ebSku.setItemId(itemId);
    	   sqlSession.insert(ns+"insert", ebSku);
    	   List<EbSpecValue> specList = ebSku.getSpecList();
    	   for (EbSpecValue sv : specList) {
			 sv.setSkuId(ebSku.getSkuId());
			 sqlSession.insert(ns1+"insert", sv);
		   }
    	   
	   }
	}
	
	
	@Override
	public EbSku getSkuById(Long skuId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey", skuId);
	}


	@Override
	public EbSku getSkuDetailById(Long skuId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"getSkuDetailById", skuId);
	}

	
	@Override
	public int updateStock(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().update(ns+"updateStock",map);
	}
}
