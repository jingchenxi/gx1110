package com.rl.ecps.controller;

import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rl.ecps.exception.EbStockException;
import com.rl.ecps.model.EbCart;
import com.rl.ecps.model.EbOrder;
import com.rl.ecps.model.EbOrderDetail;
import com.rl.ecps.model.EbShipAddr;
import com.rl.ecps.model.EbSpecValue;
import com.rl.ecps.model.TsPtlUser;
import com.rl.ecps.service.EbCartService;
import com.rl.ecps.service.EbOrderService;
import com.rl.ecps.service.EbShipAddrService;
import com.rl.ecps.service.EbSkuService;

@Controller
@RequestMapping("/order")
public class EbOrderController {
  
	@Autowired
	private EbSkuService skuService;
	
	@Autowired
	private EbCartService cartService;
	
	@Autowired
	private EbShipAddrService addrService;
	
	@Autowired
	private EbOrderService orderService;
	
	@RequestMapping("/toSubmitOrder.do")
	public String toSubmitOrder(HttpServletRequest request,HttpServletResponse response
			,Model model,HttpSession session) {
		List<EbCart> cartList = cartService.listCart(request, response);
	    Integer itemNum = 0;
	    BigDecimal totalPrice = new BigDecimal(0);
	    
	    for (EbCart ebCart : cartList) {
			itemNum = itemNum + ebCart.getQuantity();
			totalPrice = totalPrice.add(ebCart.getSku().getSkuPrice().multiply(new BigDecimal(ebCart.getQuantity())));
			
		}
		model.addAttribute("itemNum",itemNum);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("cartList", cartList);
	    
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(user != null) {
			List<EbShipAddr> addrList = addrService.selectAddrByUserId(user.getPtlUserId());
			model.addAttribute("addrList",addrList);
		}else {
			return "redirect:/user/toLogin.do";
		}
		return "shop/confirmProductCase";
	}
	
	@RequestMapping("/submitOrder.do")
	public String submitOrder(EbOrder order,String address,HttpSession session,
			HttpServletRequest request,HttpServletResponse response,Model model) throws IllegalAccessException, InvocationTargetException {
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		
		if(user != null) {
			order.setPtlUserId(user.getPtlUserId());
			order.setUsername(user.getUsername());
			
		}
		
		order.setOrderNum(new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date()));
		
		if(StringUtils.equals("add", address)==false) {
			EbShipAddr addr = addrService.selectShipAddrById(new Long(address));
			BeanUtils.copyProperties(order, addr);
			
		}
		
		List<EbCart> cartList = cartService.listCart(request, response);
		
		List<EbOrderDetail> detailList = new ArrayList<>();
		for (EbCart ebCart : cartList) {
			EbOrderDetail detail = new EbOrderDetail();
			detail.setItemId(ebCart.getSku().getItem().getItemId());
			detail.setItemName(ebCart.getSku().getItem().getItemName());
			detail.setItemNo(ebCart.getSku().getItem().getItemNo());
			detail.setSkuId(ebCart.getSkuId());
			
			String specVal = "";
			List<EbSpecValue> specList = ebCart.getSku().getSpecList();
			for(EbSpecValue spec:specList) {
				specVal = specVal+ spec.getSpecValue()+",";
			}
			specVal = specVal.substring(0, specVal.length()-1);
			detail.setSkuSpec(specVal);
			detail.setQuantity(ebCart.getQuantity());
			detail.setSkuPrice(ebCart.getSku().getSkuPrice());
			detail.setMarketPrice(ebCart.getSku().getMarketPrice());
			
			detailList.add(detail);
		}
		
		try {
		String processInstanceId = orderService.saveOrder(request, response, order, detailList);
		model.addAttribute("order",order);
		model.addAttribute("processInstanceId",processInstanceId);
		}catch(Exception e){
			if(e instanceof EbStockException) {
				model.addAttribute("tip", "stock_error");
			}
		}
		return "shop/confirmProductCase2";
	}
	
	@RequestMapping("/pay.do")
	public void pay(String processInstanceId,Long orderId,PrintWriter out) {
		orderService.pay(processInstanceId, orderId);
		out.write("success");
	}
	
}
