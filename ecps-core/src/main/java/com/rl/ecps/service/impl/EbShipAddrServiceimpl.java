package com.rl.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbShipAddrDao;
import com.rl.ecps.model.EbShipAddr;
import com.rl.ecps.service.EbShipAddrService;

@Service
public class EbShipAddrServiceimpl implements EbShipAddrService {

	@Autowired
	private EbShipAddrDao shipAddrDao;
	
	@Override
	public List<EbShipAddr> selectAddrByUserId(Long userId) {
		// TODO Auto-generated method stub
		return shipAddrDao.selectAddrByUserId(userId);
	}

	@Override
	public EbShipAddr selectShipAddrById(Long shipAddrId) {
		// TODO Auto-generated method stub
		return shipAddrDao.selectShipAddrById(shipAddrId);
	}

	@Override
	public void saveOrUpdateAddr(EbShipAddr addr) {
		// TODO Auto-generated method stub
		if(addr.getDefaultAddr() == 1) {
			shipAddrDao.destoryDefault(addr.getPtlUserId());
		}
		
		if(addr.getShipAddrId() == null) {
			shipAddrDao.saveAddr(addr);
		}else {
			shipAddrDao.updateAddr(addr);
		}
		
		
	}

	@Override
	public void updateDefault(Long shipAddrId, Long userId) {
		// TODO Auto-generated method stub
		shipAddrDao.destoryDefault(userId);
		EbShipAddr addr = new EbShipAddr();
		addr.setShipAddrId(shipAddrId);
		addr.setDefaultAddr((short)1);
		shipAddrDao.updateAddr(addr);
								
	}

	@Override
	public void deleteAddrByPrimaryKey(Long shipAddrId) {
		// TODO Auto-generated method stub
		shipAddrDao.deleteAddrByPrimaryKey(shipAddrId);
	}

	

}
