package com.rl.ecps.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rl.ecps.model.EbShipAddr;
import com.rl.ecps.model.TsPtlUser;
import com.rl.ecps.service.EbShipAddrService;
import com.rl.ecps.service.TsPtlUserService;
import com.rl.ecps.ultis.SCaptcha;
import com.rl.ecps.utils.ECPSUtils;
import com.rl.ecps.utils.MD5;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class EbUserController {
  
	@Autowired
	private TsPtlUserService userService;
	
	@Autowired
	private EbShipAddrService addrService;
	
	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return "passport/login";
	}
	
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setContentType("image/jpeg");
		//禁止图片缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		SCaptcha sCaptcha = new SCaptcha();
		request.getSession().setAttribute("piccode", sCaptcha.getCode());
		
		sCaptcha.write(response.getOutputStream());
	}
	
	@RequestMapping("/login.do")
	public String login(String username,String password,String captcha,
			HttpSession session,Model model) {
		
		String picCode = (String) session.getAttribute("piccode");
		if(StringUtils.equalsIgnoreCase(captcha, picCode)==false) {
			model.addAttribute("tip","caperror");
			return "passport/login";
		}
		
		password = new MD5().GetMD5Code(password);
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("password", password);
		//根据用户名密码查询用户
		TsPtlUser user = userService.selectUserByUserAndPass(map);
		
		if(user == null) {
			model.addAttribute("tip","userpasserror");
			return "passport/login";
		}
		session.setAttribute("user", user);
		return "redirect:/item/toIndex.do";
	}
	
	@RequestMapping("/loginAjax.do")
	public void loginAjax(String username,String password,String captcha,
			HttpSession session,PrintWriter out) {
		
		String picCode = (String) session.getAttribute("piccode");
		if(StringUtils.equalsIgnoreCase(captcha, picCode)==false) {
			out.write("caperror");
			return;
		}
		
		password = new MD5().GetMD5Code(password);
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("password", password);
		//根据用户名密码查询用户
		TsPtlUser user = userService.selectUserByUserAndPass(map);
		
		if(user == null) {
			out.write("userpasserror");
			return;			
		}
		session.setAttribute("user", user);
		
		out.write("success");
	}
	
	
	@RequestMapping("/getUser.do")
	public void getUser(HttpSession session,HttpServletResponse response) {
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		
		JSONObject jo = new JSONObject();
		jo.accumulate("user", user);
		String result = jo.toString();
		ECPSUtils.PrintJSON(result, response);
		
	}
	
	@RequestMapping("/login/toPersonl.do")
	public String toPersonl() {
		
	  return "person/index";	
	}
	
	@RequestMapping("/login/toAddr.do")
	public String toAddr(HttpSession session,Model model) {
	  TsPtlUser user = (TsPtlUser) session.getAttribute("user");
	  
	  List<EbShipAddr> addrList = addrService.selectAddrByUserId(user.getPtlUserId());
	  model.addAttribute("addrList", addrList);
	  return "person/deliverAddress";	
	}
	
	//根据地址id查询收货地址对象
	@RequestMapping("/login/getAddrById.do")
	public void getAddrById(Long shipAddrId,HttpServletResponse response) {
		EbShipAddr addr = addrService.selectShipAddrById(shipAddrId);
		JSONObject jo = new JSONObject();
		jo.accumulate("addr", addr);
		String result = jo.toString();
		ECPSUtils.PrintJSON(result, response);
	}
	
	@RequestMapping("/login/saveOrUpdateAddr.do")
	public String saveOrUpdateAddr(EbShipAddr addr,HttpSession session) {
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(addr.getDefaultAddr() == null) {
			addr.setDefaultAddr((short)0);
		}
		
		addr.setPtlUserId(user.getPtlUserId());
		addrService.saveOrUpdateAddr(addr);		
		return "redirect:/user/login/toAddr.do";
	}
	
	@RequestMapping("/login/updateDefault.do")
	public String updateDefault(Long shipAddrId,HttpSession session) {		
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		addrService.updateDefault(shipAddrId, user.getPtlUserId());				
		return "redirect:/user/login/toAddr.do";
	}
	
	@RequestMapping("/login/deleteAddr.do")
	public String deleteAddr(Long shipAddrId) {	
		addrService.deleteAddrByPrimaryKey(shipAddrId);
		return "redirect:/user/login/toAddr.do";
	}
	
	
}
