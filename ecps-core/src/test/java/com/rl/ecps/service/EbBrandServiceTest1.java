package com.rl.ecps.service;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rl.ecps.model.EbBrand;

public class EbBrandServiceTest1 {
	
	ApplicationContext ctx;

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans.xml");
	}

	@Test
	public void testSaveBrand() {
		EbBrandService service = (EbBrandService) ctx.getBean("ebBrandServiceImpl");
		EbBrand brand = new EbBrand();
		brand.setBrandName("鸭梨");
		brand.setBrandDesc("很大");
		brand.setBrandSort(1);
		brand.setImgs("http://yalihenda");
		brand.setWebsite("http://yalihenda");
		service.saveBrand(brand);
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
