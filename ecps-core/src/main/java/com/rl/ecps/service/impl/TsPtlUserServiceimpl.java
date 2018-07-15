package com.rl.ecps.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.TsPtlUserDao;
import com.rl.ecps.model.TsPtlUser;
import com.rl.ecps.service.TsPtlUserService;

@Service
public class TsPtlUserServiceimpl implements TsPtlUserService {

	@Autowired
	private TsPtlUserDao userDao;
	
	@Override
	public TsPtlUser selectUserByUserAndPass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return userDao.selectUserByUserAndPass(map);
	}

}
