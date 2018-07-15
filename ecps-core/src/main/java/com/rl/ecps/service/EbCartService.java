package com.rl.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.rl.ecps.model.EbCart;

public interface EbCartService {
  
	public List<EbCart> listCart(HttpServletRequest request,HttpServletResponse response);
	
	public String addCart(HttpServletRequest request,HttpServletResponse response,Long skuId,Integer quantity);		
	
	public void addNum(HttpServletRequest request,HttpServletResponse response,Long skuId);
	
	public void reduceNum(HttpServletRequest request,HttpServletResponse response,Long skuId);
			
	public void clearCart(HttpServletRequest request,HttpServletResponse response);
	
	public String validCookie(HttpServletRequest request,HttpServletResponse response);
	
	public void removeCart(HttpServletRequest request,HttpServletResponse response,Long skuId);
	
	public void setQuantity(HttpServletRequest request,HttpServletResponse response,Long skuId,Integer quantity);
	
	//验证购物车结算时的库存是否充足
	public String validCar(HttpServletRequest request,HttpServletResponse response);
}
