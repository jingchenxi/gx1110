package com.rl.ecps.service;

import java.util.Map;

import com.rl.ecps.model.TsPtlUser;

public interface TsPtlUserService {
	public TsPtlUser selectUserByUserAndPass(Map<String, String> map);
}
