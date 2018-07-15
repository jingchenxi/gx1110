package com.rl.ecps.service;

import java.util.List;

import com.rl.ecps.model.TaskBean;

/**
 * 流程服务接口
 * @author Administrator
 *
 */
public interface FlowService {
	
	/**
	 * 部署流程定义
	 */
	public void deployFlow();
	
	/**
	 * 启动流程实例
	 * @return
	 */
	public String startProcess(Long orderId);
	
	/**
	 * 办理任务
	 * @param processInstanceId
	 */
	public void completeTaskByProcessInstanceId(String processInstanceId,String outcome);
	
	/**
	 * 根据办理人查询流程订单
	 * @param assignee
	 * @return
	 */
	public List<TaskBean> selectTaskBeanByAssignee(String assignee);
	
	
	public TaskBean selectTaskBeanByTaskId(String taskId);
	
	
	public void completeTaskByTaskId(String taskId,String outcome);
}
