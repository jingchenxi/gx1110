package com.rl.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rl.ecps.model.EbCart;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.service.EbCartService;
import com.rl.ecps.service.EbSkuService;
import com.rl.ecps.utils.ECPSUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/cart")
public class EbCartController {

	@Autowired
	private EbSkuService skuService;
	
	@Autowired
	private EbCartService cartService;
	
	@RequestMapping("/listCart.do")
	public String listCart(HttpServletRequest request,HttpServletResponse response,Model model) {
		List<EbCart> cartList = cartService.listCart(request, response);
		Integer itemNum = 0;
		BigDecimal totalPrice = new BigDecimal(0);
		for (EbCart ebCart : cartList) {
			itemNum = itemNum + ebCart.getQuantity();
			totalPrice = totalPrice.add(ebCart.getSku().getSkuPrice().multiply(new BigDecimal(ebCart.getQuantity())));
		}
		
		model.addAttribute("cartList",cartList);
		model.addAttribute("itemNum",itemNum);
		model.addAttribute("totalPrice",totalPrice);
		return "shop/car";
	}
	
	//库存验证
	@RequestMapping("/validStock.do")
	public void validStock(Long skuId,Integer quantity,PrintWriter out) {
		EbSku sku = skuService.getSkuById(skuId);
		String result = "yes";
		if(sku.getStockInventory() < quantity) {
			result = "no";
		}
		
		out.write(result);
	}
	
	//购物车库存验证
		@RequestMapping("/validStockCar.do")
		public void validStockCar(Long skuId,Integer quantity,PrintWriter out) {
			EbSku sku = skuService.getSkuById(skuId);
			String result = "yes";
			if(sku.getStockInventory() < quantity) {
				result = "no";
			}
			JSONObject obj = new JSONObject();
			obj.accumulate("result", result);
			obj.accumulate("stock", sku.getStockInventory());
			
			result = obj.toString();
			out.write(result);
		}
		
		
	
	//验证cookie是否开启
	@RequestMapping("/validCookie.do")
	public void validCookie(HttpServletRequest request,HttpServletResponse response,PrintWriter out) {
		String result = cartService.validCookie(request, response);
		out.write(result);
	}
	
	@RequestMapping("/addCart.do")
	public void addCart(HttpServletRequest request,HttpServletResponse response,
			Long skuId,Integer quantity,PrintWriter out) {
		String message = cartService.addCart(request, response, skuId, quantity);
		out.write(message);
	}
	
	@RequestMapping("/removeCart.do")
	public String removeCart(HttpServletRequest request,HttpServletResponse response,Long skuId) {
		cartService.removeCart(request, response, skuId);
		
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/reduceNum.do")
	public String reduceNum(HttpServletRequest request,HttpServletResponse response,Long skuId) {
		cartService.reduceNum(request, response, skuId);
		
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/addNum.do")
	public String addNum(HttpServletRequest request,HttpServletResponse response,Long skuId) {
		cartService.addNum(request, response, skuId);
		
		return "redirect:listCart.do";
	}
	
	//清空购物车
	@RequestMapping("/clearCart")
	public String clearCart(HttpServletRequest request,HttpServletResponse response) {
		cartService.clearCart(request, response);
		
		return "redirect:listCart.do";
	}
	
	//设置购物车某样商品的数量
	@RequestMapping("/setQuantity.do")
	public String setQuantity(HttpServletRequest request,HttpServletResponse response,Long skuId,Integer quantity) {
		cartService.setQuantity(request, response, skuId, quantity);
		
		return "redirect:listCart.do";
	}
	
	//验证购物车结算时库存是否充足
	@RequestMapping("/validCar.do")
	public void validCar(HttpServletRequest request,HttpServletResponse response) {
		String result = cartService.validCar(request, response);
		
		ECPSUtils.PrintJSON(result, response);		
	}
}
