package com.rl.ecps.service;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rl.ecps.model.EbBrand;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class EbBrandServiceTest {
	
	@Autowired
	private EbBrandService brandService;

	@Test
	public void testSaveBrand() {
		EbBrand brand = new EbBrand();
		brand.setBrandName("鸭梨");
		brand.setBrandDesc("很大");
		brand.setBrandSort(1);
		brand.setImgs("http://yalihenda");
		brand.setWebsite("http://yalihenda");
		brandService.saveBrand(brand);
	}

	@Test
	public void testGetBrandById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBrand() {
		fail("Not yet implemented");
	}

}
