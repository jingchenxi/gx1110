package com.rl.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbBrandDao;
import com.rl.ecps.model.EbBrand;
import com.rl.ecps.service.EbBrandService;
import com.rl.ecps.utils.ECPSUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

@Service
public class EbBrandServiceImpl implements EbBrandService {

	@Autowired
	private EbBrandDao brandDao;
	
	public void saveBrand(EbBrand brand) {
		brandDao.saveBrand(brand);
	}

	public EbBrand getBrandById(Long brandId) {
		return brandDao.getBrandById(brandId);
	}

	public void updateBrand(EbBrand brand) {
		brandDao.updateBrand(brand);
	}

	

	public List<EbBrand> selectBrand() {
		return brandDao.selectBrand();
	}

	@Override
	public List<EbBrand> selectBrandByName(String brandName) {
		// TODO Auto-generated method stub
		
		return brandDao.selectBrandByName(brandName);
	}

	@Override
	public void deleteBrand(Long brandId) {
		// TODO Auto-generated method stub
		EbBrand brand = this.getBrandById(brandId);
		brandDao.deleteBrand(brandId);
		Client client = Client.create();
		WebResource webService = client.resource(ECPSUtils.readProp("file_path")+brand.getImgs());
		webService.delete();
	}

	

}
