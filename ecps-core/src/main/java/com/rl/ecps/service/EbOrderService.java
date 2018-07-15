package com.rl.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rl.ecps.exception.EbStockException;
import com.rl.ecps.model.EbOrder;
import com.rl.ecps.model.EbOrderDetail;
import com.rl.ecps.model.TaskBean;

public interface EbOrderService {
    
	/**
	 * 提交订单
	 * @param request
	 * @param response
	 * @param order 
	 * @param orderDetailList
	 * @return 启动的流程实例Id
	 * @throws EbStockException
	 */
	public String saveOrder(HttpServletRequest request,HttpServletResponse response
			,EbOrder order,List<EbOrderDetail> orderDetailList) throws EbStockException;
	
	/**
	 * 订单支付
	 * @param processInstanceId
	 * @param orderId
	 */
	public void pay(String processInstanceId,Long orderId);
	
	
	/**
	 * 查询流程订单
	 */
	public List<TaskBean> selectNoPaidOrder(Short isCall,String assignee);
	
	
	public EbOrder selectOrderAndDetailById(Long orderId);
	
	
	public void updateCall(Long orderId);
	
	
	public List<TaskBean> selectPaidOrder(String assignee);
	
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId,String taskId);
	
	public void completeTask(String taskId,String outcome,Long orderId);
	
}
