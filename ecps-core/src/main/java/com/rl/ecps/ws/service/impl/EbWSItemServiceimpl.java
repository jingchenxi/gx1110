package com.rl.ecps.ws.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.utils.ECPSUtils;
import com.rl.ecps.utils.FMutil;
import com.rl.ecps.ws.service.EbWSItemService;

import freemarker.template.TemplateException;

@Service
public class EbWSItemServiceimpl implements EbWSItemService{

	@Autowired
	private EbItemDao itemDao;
	
	/**
	 * 生成模版web服务的实现类，根据商品id查询商品对象并根据此对象及模版生成对应静态html
	 */
	@Override
	public String publishItem(Long itemId, String password) throws IOException, TemplateException {
		// TODO Auto-generated method stub
		String pass = ECPSUtils.readProp("ws_pass");
		if(StringUtils.equals(password,pass)) {
		   EbItem item = itemDao.selectItemDetailById(itemId);
		   
		   Map<String, Object> map = new HashMap<>();
		   map.put("item", item);
           FMutil fm = new FMutil();
           fm.outputFile("productDetail.ftl",item.getItemId()+".html",map);
		   return "success";
		}else {
			return "pass_error";
		}
		
	}

}
