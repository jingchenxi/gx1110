package com.rl.ecps.controller;


import java.io.IOException;
import java.io.Writer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rl.ecps.model.EbBrand;
import com.rl.ecps.service.EbBrandService;



@Controller
@RequestMapping("/brand")
public class EbBrandController {

	@Autowired
	private EbBrandService brandService;
	
	@RequestMapping("/toItemIndex.do")
	public String toItemIndex(){
		return "item/index";
	}
	
	
	/**
	 * 品牌查询
	 * @param model
	 * @return
	 */
	@RequestMapping("/listBrand.do")
	public String listBrand(Model model) {
		
		List<EbBrand> blist = brandService.selectBrand();
		model.addAttribute("bList", blist);		
		return "item/listbrand";
	}
	
	/**
	 * 跳转到添加品牌页面
	 * @return
	 */
	@RequestMapping("/toAddBrand.do")
	public String toAddBrand() {
		return "item/addbrand";
	}
	
	/**
	 * 品牌添加
	 * @param brand
	 * @return
	 */
	@RequestMapping("/addBrand.do")
	public String addBrand(EbBrand brand) {
		brandService.saveBrand(brand);
		
		return "redirect:listBrand.do";
	}
	
	/**
	 * 验证是否有重复名称(ajax)
	 * @param brandName
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping("/validBrandName.do")
	public void validBrandName(String brandName,Writer out) throws IOException {
		List<EbBrand> blist = brandService.selectBrandByName(brandName);
		
		String flag = "no";
		if(blist.size()>0) {
			flag="yes";
		}
		
		out.write(flag);
	}

	/**
	 * 根据要编辑品牌对象的id查询对应品牌对象，并发送给编辑页面展示
	 * @param brandId
	 * @param model
	 * @return
	 */
	@RequestMapping("/getBrandById.do")
	public String getBrandById(Long brandId,Model model) {
		EbBrand brand = brandService.getBrandById(brandId);
		model.addAttribute("brand", brand);
		return "item/editbrand";
	}
	
	@RequestMapping("/updateBrand.do")
	public String updateBrand(EbBrand brand) {
		brandService.updateBrand(brand);
		return "redirect:listBrand.do"; 
	}
	
	@RequestMapping("/deleteBrand.do")
	public String deleteBrand(Long brandId) {
		brandService.deleteBrand(brandId);
		return "redirect:listBrand.do";
	}
}
