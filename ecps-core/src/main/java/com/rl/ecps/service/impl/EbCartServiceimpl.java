package com.rl.ecps.service.impl;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.CaretListener;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbSkuDao;
import com.rl.ecps.model.EbCart;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.model.EbSpecValue;
import com.rl.ecps.service.EbCartService;
import com.rl.ecps.utils.ECPSUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;
 
@Service
public class EbCartServiceimpl implements EbCartService{

	@Autowired
	private EbSkuDao skuDao;
	
	@Override
	public List<EbCart> listCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		           
		           Cookie[] cookies = request.getCookies();
				   //json的配置对象
				   JsonConfig jc = new JsonConfig();
				   //设置要转换的类的class
				   jc.setRootClass(EbCart.class);
				   //设置不需要转换的属性
				   jc.setExcludes(new String[] {"sku"});
				   //把json的数组对象转换成java集合				   
				   List<EbCart> cartList = parseJsonInCookie(cookies, "cart_key", jc);
				   
				   for(EbCart cart:cartList) {
					   //根据skuId查询sku详细信息
					   EbSku sku = skuDao.getSkuDetailById(cart.getSkuId());
					   cart.setSku(sku);
				   }
															 		  
		         return cartList;
	}
	
	//将cookie中的json字符串转换为对应的java对象
	private List<EbCart> parseJsonInCookie(Cookie[] cookies,String cookieKeyName,JsonConfig config){
		List<EbCart> cartList = new ArrayList<>();
		
		String  cookieKey = ECPSUtils.readProp(cookieKeyName);
		if(cookies != null && cookies.length>0) {
			for (Cookie cookie : cookies) {
				
				String name = cookie.getName();
				if(StringUtils.equals(cookieKey, name)) {
					//获得cookie的值
					String result = cookie.getValue();
					//解码处理,处理中文
					result = URLDecoder.decode(result); 
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//把json的数组对象转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,config);
					
				}
								
			}
						
		}
		
		return cartList;
	}
	
	//将集合写回到cookie中
	private void addListToCookie(List<EbCart> cartList,JsonConfig config,String cookieKey,String path,HttpServletResponse response) {
		JSONArray ja = JSONArray.fromObject(cartList,config);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie(cookieKey,result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/"+path);
		response.addCookie(cookie);
	}
	
	
	//校验cookie是否开启
	@Override
	public String validCookie(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String result = "no";
		Cookie cookie = new Cookie("test", "test");
		//不是cookie存储位置，而是你下次获取cookie时的一个标识
		cookie.setPath("/ecps-portal");
		response.addCookie(cookie);
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
		  for(Cookie c:cookies) {
			String name = c.getName();
			String val = c.getValue();
			if("test".equals(name) && "test".equals(val)) {
				result = "yes";
			}
			
		   }
		}
		
		return result;
	}

	
	@Override
	public String addCart(HttpServletRequest request, HttpServletResponse response, Long skuId, Integer quantity) {
		// TODO Auto-generated method stub
		String message = "success";
		
		
        List<EbCart> cartList = new ArrayList<>();
       
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		
		//找到cookie并判断此最小销售单元是否存在
		Cookie[] cookies = request.getCookies();
		
		cartList = parseJsonInCookie(cookies, "cart_key", jc);
		
		//购物车为空
		if(cartList.size() == 0) {
			EbCart cartObj = new EbCart();
			cartObj.setSkuId(skuId);
			cartObj.setQuantity(quantity);
			cartList.add(cartObj);
			
		}
		else {
			
		boolean isExsits = false;
		for(EbCart cart:cartList) {
			//如果cookie中存在此最小销售单元，数量+
			if(cart.getSkuId().longValue()==skuId.longValue()) {
				//判断当前购物车商品数量库存是否充足
				Integer cartQuantity = cart.getQuantity();
				EbSku sku = skuDao.getSkuById(skuId);	
				
				System.err.println(cartQuantity+" "+sku.getStockInventory());
				if(cartQuantity < sku.getStockInventory()) {
					cart.setQuantity(cart.getQuantity()+quantity);	
				}else if(cartQuantity == 100) {
				    message = "success";	
				}				
				else {
					
					message = "notstock";
				}
				
				
				isExsits = true;
			}
		}
		
		//如果此最小销售单元在cookie中不存在,追加
		  if(isExsits == false) {
			EbCart cartObj = new EbCart();
			cartObj.setSkuId(skuId);
			cartObj.setQuantity(quantity);
			cartList.add(cartObj);
			
		  }
		  
		
		}
												
				//将转换完成的json字符串存储到cookie中并返回到浏览器
				JSONArray ja = JSONArray.fromObject(cartList,jc);
				String result = ja.toString();
				result = URLEncoder.encode(result);
				Cookie cookie = new Cookie(ECPSUtils.readProp("cart_key"), result);
				cookie.setMaxAge(Integer.MAX_VALUE);
				cookie.setPath("/ecps-portal");
				response.addCookie(cookie);
				
		return message;					
		
	}

	//删除
	@Override
	public void removeCart(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		// TODO Auto-generated method stub
		List<EbCart> cartList= new ArrayList<>();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		
		Cookie[] cookies = request.getCookies();
		
		cartList = parseJsonInCookie(cookies, "cart_key", jc);
															
		Iterator<EbCart> iter = cartList.iterator();
					
					//使用foreach时不要修改集合元素，add或remove，会有异常抛出,可以用Iterator完成相应操作
		while(iter.hasNext()) {
			EbCart cart = iter.next();
			if (cart.getSkuId().longValue() == skuId.longValue()) {
				iter.remove();
			}
						
		}
					
																																										
		JSONArray ja = JSONArray.fromObject(cartList,jc);
		String jsonStr = ja.toString();
		jsonStr = URLEncoder.encode(jsonStr);
		Cookie cookie = new Cookie(ECPSUtils.readProp("cart_key"), jsonStr);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/ecps-portal");
		
		response.addCookie(cookie);
		
	}
	
	//加
	@Override
	public void addNum(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		List<EbCart> cartList = parseJsonInCookie(cookies, "cart_key", jc);
		
		for (EbCart ebCart : cartList) {
			if(ebCart.getSkuId().longValue() == skuId.longValue()) {
				ebCart.setQuantity(ebCart.getQuantity()+1);
			}
		}
		
		addListToCookie(cartList, jc, ECPSUtils.readProp("cart_key"), "ecps-portal", response);
		
		
	}

	
	//减
	@Override
	public void reduceNum(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		List<EbCart> cartList =parseJsonInCookie(cookies, "cart_key", jc);
		
	    for (EbCart ebCart : cartList) {
			if(ebCart.getSkuId().longValue() == skuId.longValue()) {
				ebCart.setQuantity(ebCart.getQuantity()-1);
			}
		}
	    
	    addListToCookie(cartList,jc,ECPSUtils.readProp("cart_key"),"ecps-portal",response);
	    
	}

	
   //清空购物车
	@Override
	public void clearCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		List<EbCart> cartList =parseJsonInCookie(cookies, "cart_key", jc);
		
		cartList.clear();
	   
	    addListToCookie(cartList,jc,ECPSUtils.readProp("cart_key"),"ecps-portal",response);
	    
	}

	//设置购物车中商品对应的数量
	@Override
	public void setQuantity(HttpServletRequest request, HttpServletResponse response, Long skuId, Integer quantity) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		List<EbCart> cartList = parseJsonInCookie(cookies, "cart_key", jc);
		
		for (EbCart ebCart : cartList) {
			if(ebCart.getSkuId().longValue() == skuId.longValue()) {
				ebCart.setQuantity(quantity);
			}
		}
		
		addListToCookie(cartList, jc, ECPSUtils.readProp("cart_key"), "ecps-portal", response);
	}
   
	//返回值:提示那个商品库存不足
	@Override
	public String validCar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String result = "success";
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[] {"sku"});
		List<EbCart> cartList = parseJsonInCookie(cookies, "cart_key", jc);
		
		for (EbCart ebCart : cartList) {
			EbSku sku = skuDao.getSkuDetailById(ebCart.getSkuId());
			if(sku.getStockInventory().intValue() < ebCart.getQuantity().intValue()) {
				result = sku.getItem().getItemName();
				for(EbSpecValue sv : sku.getSpecList()) {
					result = result + sv.getSpecValue();
				}
				result = result + "库存不足"+ebCart.getQuantity()+",实际库存量"+sku.getStockInventory();
				break;
			}
			
		}
		
		return result;
	}

	




	

}
