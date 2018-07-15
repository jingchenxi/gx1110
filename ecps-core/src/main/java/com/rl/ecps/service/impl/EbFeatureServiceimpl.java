package com.rl.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbFeatureDao;
import com.rl.ecps.model.EbFeature;
import com.rl.ecps.service.EbFeatureService;

@Service
public class EbFeatureServiceimpl implements EbFeatureService {

	@Autowired
	private EbFeatureDao featureDao;
	
	@Override
	public List<EbFeature> selectCommFeature() {
		// TODO Auto-generated method stub
		return featureDao.selectCommFeature();
	}

	@Override
	public List<EbFeature> selectSpecFeature() {
		// TODO Auto-generated method stub
		return featureDao.selectSpecFeature();
	}

	@Override
	public List<EbFeature> selectIsSelectFeature() {
		// TODO Auto-generated method stub
		return featureDao.selectIsSelectFeature();
	}

}
