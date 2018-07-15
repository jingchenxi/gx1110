package com.rl.ecps.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbConsoleLogDao;
import com.rl.ecps.dao.EbItemClobDao;
import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.dao.EbParaValueDao;
import com.rl.ecps.dao.EbSkuDao;
import com.rl.ecps.model.EbConsoleLog;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.EbItemClob;
import com.rl.ecps.model.EbParaValue;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.service.EbItemService;
import com.rl.ecps.utils.Page;
import com.rl.ecps.stub.*;

import freemarker.template.TemplateException;

@Service
public class EbItemServiceimpl implements EbItemService {

	@Autowired
	private EbItemDao itemDao;
	
	@Autowired
	private EbParaValueDao paraValueDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbItemClobDao itemClobDao;
	
	@Autowired
	private EbConsoleLogDao consoleLogDao;
	
	@Override
	public Page selectItemByCondition(QueryCondition queryCondition) {
		// TODO Auto-generated method stub
		Integer totalCount = itemDao.selectItemByConditionCount(queryCondition);
		Page page = new Page();
		page.setPageNo(queryCondition.getPageNo());
		page.setTotalCount(totalCount);
		
		Integer startNum = page.getStartNum();
		Integer endNum = page.getEndNum();
		
		queryCondition.setStartNum(startNum);
		queryCondition.setEndNum(endNum);
		
		List<EbItem> itemList = itemDao.selectItemByCondition(queryCondition);
		
		page.setList(itemList);
				
		return page;
	}

	@Override
	public void saveItem(EbItem item, EbItemClob itemClob, List<EbParaValue> paraList, List<EbSku> skuList) {
		// TODO Auto-generated method stub
		itemDao.saveItem(item);
		paraValueDao.saveParaValue(paraList, item.getItemId());
		itemClobDao.saveItemClob(itemClob, item.getItemId());
		skuDao.saveSku(skuList, item.getItemId());
	}

	@Override
	public void auditItem(Long itemId, Short auditStatus, String notes) {
		// TODO Auto-generated method stub
		//修改商品的审核状态，审核时间,审核人id
		EbItem item = new EbItem();
		item.setItemId(itemId);
		item.setAuditStatus(auditStatus);
		item.setCheckTime(new Date());
		item.setCheckUserId(1l);
		itemDao.updateItem(item);
		
		//添加操作日志
		EbConsoleLog log = new EbConsoleLog();
		log.setEntityId(item.getItemId());
		log.setEntityName("商品表");
		log.setNotes(notes);
		log.setOpTime(new Date());
		if(auditStatus == 1) {
			log.setOpType("审核通过");
		}else {
			log.setOpType("审核不通过");
		}
		
		log.setTableName("EB_ITEM");
		log.setUserId(1l);
		consoleLogDao.saveConsoleLog(log);
	}

	
	@Override
	public void showItem(Long itemId, Short showStatus) {
		// TODO Auto-generated method stub
		EbItem item = new EbItem();
		item.setItemId(itemId);
		item.setShowStatus(showStatus);
		item.setOnSaleTime(new Date());
		item.setUpdateUserId(1l);
		itemDao.updateItem(item);
		
		EbConsoleLog log = new EbConsoleLog();
		log.setEntityName("商品表");
		log.setOpTime(new Date());
		if(showStatus == 1) {
			log.setOpType("下架");
		}else {
			log.setOpType("上架");
		}
		
		log.setTableName("EB_ITEM");
		log.setUserId(1l);
		consoleLogDao.saveConsoleLog(log);
	}

	@Override
	public List<EbItem> listItem(String price, Long brandId, String paraStr) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		if(StringUtils.isNotBlank(price) && StringUtils.equals(price, "") == false) {
			String[] prices = price.split("-");
			map.put("minPrice", prices[0]);
			map.put("maxPrice", prices[1]);
		} 
		map.put("brandId", brandId);
		
		if(StringUtils.isNotBlank(paraStr) && StringUtils.equals(paraStr, "") == false) {
			String[] paraList = paraStr.split(",");
			map.put("paraList", paraList);
		}
		
		return itemDao.listItem(map);
	}

	@Override
	public EbItem selectItemDetailById(Long itemId) {
		// TODO Auto-generated method stub
		return itemDao.selectItemDetailById(itemId);
	}

	
	
	/**
	 * 调用生成freemarket模版的web服务
	 */
	@Override
	public String publishItem(Long itemId, String password) throws IOException_Exception, TemplateException_Exception {
		// TODO Auto-generated method stub
		FreemarketService service = new FreemarketService();
		FreemarketPortType port = service.getFreemarketPort();
		
		return port.publishItem(itemId, password);
	}

	
	
	
	

}
