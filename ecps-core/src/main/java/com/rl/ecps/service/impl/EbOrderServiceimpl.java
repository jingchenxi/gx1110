package com.rl.ecps.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbOrderDao;
import com.rl.ecps.dao.EbOrderDetailDao;
import com.rl.ecps.dao.EbSkuDao;
import com.rl.ecps.exception.EbStockException;
import com.rl.ecps.model.EbOrder;
import com.rl.ecps.model.EbOrderDetail;
import com.rl.ecps.model.EbSku;
import com.rl.ecps.model.TaskBean;
import com.rl.ecps.service.EbCartService;
import com.rl.ecps.service.EbOrderService;
import com.rl.ecps.service.FlowService;

@Service
public class EbOrderServiceimpl implements EbOrderService {

	@Autowired
	private EbOrderDao orderDao;
	
	@Autowired
	private EbOrderDetailDao orderDetailDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbCartService cartService;
	
	@Autowired
	public FlowService flowService;
	
	/**
	 * 提交订单
	 */
	@Override
	public String saveOrder(HttpServletRequest request,HttpServletResponse response
			,EbOrder order, List<EbOrderDetail> orderDetailList) throws EbStockException {
		// TODO Auto-generated method stub
		if(orderDetailList.size() <=0) {
			return "";
		}
		
		orderDao.saveOrder(order);
		Map<String, Object> map = new HashMap<>();
		for (EbOrderDetail ebOrderDetail : orderDetailList) {
			ebOrderDetail.setOrderId(order.getOrderId());
			orderDetailDao.saveOrderDetail(ebOrderDetail);
			
			//乐观锁解决并发问题
			//select * from eb_sku where sku_id = 1001
			//uodate eb_sku set stock = stock-#{quantity},version=#{version}+1 where
			//sku_id=#{skuId} and version=#{version} and stock >= #{quantity}
			//先查询后修改存在并发问题
			/*EbSku sku = skuDao.getSkuById(ebOrderDetail.getSkuId());
			sku.setStockInventory(sku.getStockInventory() - ebOrderDetail.getQuantity());
			skuDao.update(sku);*/
			map.put("skuId",ebOrderDetail.getSkuId());
			map.put("quantity", ebOrderDetail.getQuantity());
			int flag = skuDao.updateStock(map);
			if(flag == 0) {
				throw new EbStockException("库存不足");
			}
			
		}
		
		//启动流程实例
		String processInstanceId = flowService.startProcess(order.getOrderId());
		
		cartService.clearCart(request, response);
		
		return processInstanceId;
	}

	@Override
	public void pay(String processInstanceId, Long orderId) {
		// TODO Auto-generated method stub
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsPaid((short)1);
		orderDao.updateOrder(order);
		flowService.completeTaskByProcessInstanceId(processInstanceId, "支付");
	}

	@Override
	public List<TaskBean> selectNoPaidOrder(Short isCall, String assignee) {
		// TODO Auto-generated method stub
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assignee);
		List<TaskBean> tbList1 = new ArrayList<>();
		for (TaskBean taskBean : tbList) {
			String businessKey = taskBean.getBusinessKey();
			EbOrder order = orderDao.selectOrderById(new Long(businessKey));
			if(order.getIsCall().shortValue() == isCall.shortValue()) {
				taskBean.setOrder(order);
				tbList1.add(taskBean);
			}
		}
		return tbList1;
	}

	@Override
	public EbOrder selectOrderAndDetailById(Long orderId) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderAndDetailById(orderId);
	}

	@Override
	public void updateCall(Long orderId) {
		// TODO Auto-generated method stub
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsCall((short)1);
		orderDao.updateOrder(order);
	}

	@Override
	public List<TaskBean> selectPaidOrder(String assignee) {
		// TODO Auto-generated method stub
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assignee);
		for (TaskBean tb : tbList) {
			String businessKey = tb.getBusinessKey();
			EbOrder order = orderDao.selectOrderById(new Long(businessKey));
			tb.setOrder(order);
		}
		return tbList;
	}

	@Override
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId, String taskId) {
		// TODO Auto-generated method stub
		EbOrder order = orderDao.selectOrderAndDetailById(orderId);
		TaskBean taskBean = flowService.selectTaskBeanByTaskId(taskId);
		taskBean.setOrder(order);
		
		return taskBean;
	}

	@Override
	public void completeTask(String taskId, String outcome, Long orderId) {
		// TODO Auto-generated method stub
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setUpdateTime(new Date());
		flowService.completeTaskByTaskId(taskId, outcome);
	}
	
	

}
