package com.rl.ecps.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.EbItemClob;
import com.rl.ecps.model.EbParaValue;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.stub.IOException_Exception;
import com.rl.ecps.stub.TemplateException_Exception;
import com.rl.ecps.utils.Page;

import freemarker.template.TemplateException;

public interface EbItemService {
 
	public Page selectItemByCondition(QueryCondition queryCondition);
    
	public void saveItem(EbItem item,EbItemClob itemClob,List<EbParaValue> paraList,List<EbSku> skuList);
	
	public void auditItem(Long itemId,Short auditStatus,String notes);
	
	public void showItem(Long itemId,Short showStatus);
	
	/**
	 * price:4000-4999
	 * brandId:1003
	 * paraStr:Andorid4.0,直板,5寸
	 */
	public List<EbItem> listItem(String price,Long brandId,String paraStr);
	
	
	public EbItem selectItemDetailById(Long itemId);
	
	//-------------------
	
	public String publishItem(Long itemId,String password) throws IOException_Exception, TemplateException_Exception;
}
