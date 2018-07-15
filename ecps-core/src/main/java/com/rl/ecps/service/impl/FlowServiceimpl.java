package com.rl.ecps.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.model.TaskBean;
import com.rl.ecps.service.FlowService;

@Service
public class FlowServiceimpl implements FlowService {

	@Autowired
	private RepositoryService repositoryService;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private TaskService taskService;
	/**
	 * 部署流程定义
	 */
	@Override
	public void deployFlow() {
		// TODO Auto-generated method stub
       DeploymentBuilder db = repositoryService.createDeployment();
       db.addClasspathResource("com/rl/ecps/diagrams/OrderFlow.bpmn")
		  .addClasspathResource("com/rl/ecps/diagrams/OrderFlow.png");
       
       db.deploy();
	}

	/**
	 * 启动流程实例
	 */
	@Override
	public String startProcess(Long orderId) {
		// TODO Auto-generated method stub
		ProcessInstance processInstance = runtimeService
				.startProcessInstanceByKey("OrderFlow",orderId+"");
		return processInstance.getId();
	}

	/**
	 * 办理任务
	 */
	@Override
	public void completeTaskByProcessInstanceId(String processInstanceId, String outcome) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("outcome", outcome);
	     Task task = taskService.createTaskQuery()
		  .processInstanceId(processInstanceId)
		    .singleResult();
	     taskService.complete(task.getId(), map);
	     
	}

	@Override
	public List<TaskBean> selectTaskBeanByAssignee(String assignee) {
		// TODO Auto-generated method stub
		List<Task> list = taskService.createTaskQuery()
		 .processDefinitionKey("OrderFlow")
		  .taskAssignee(assignee).orderByTaskCreateTime()
		   .desc().list();
		List<TaskBean> tbList = new ArrayList<>();
		
		ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery();
		for (Task task : list) {
			TaskBean taskBean = new TaskBean();
			taskBean.setTask(task);
			String processInstanceId = task.getProcessInstanceId();
			ProcessInstance pi = query.processDefinitionKey("OrderFlow")
			  .processInstanceId(processInstanceId).singleResult();
			taskBean.setBusinessKey(pi.getBusinessKey());
			tbList.add(taskBean);
		}
		return tbList;
	}

	@Override
	public TaskBean selectTaskBeanByTaskId(String taskId) {
		// TODO Auto-generated method stub
		Task task = taskService.createTaskQuery().processDefinitionKey("OrderFlow")
		  .taskId(taskId).singleResult();
		
		TaskBean taskBean = new TaskBean();
		taskBean.setTask(task);
		List<String> outcomes = this.getOutComes(task);
		taskBean.setOutcomes(outcomes);
		
		return taskBean;
	}
	
	
	public List<String> getOutComes(Task task){
		List<String> outcomes = new ArrayList<>();
		
		//获得流程定义的对象
		ProcessDefinitionEntity pe = (ProcessDefinitionEntity) repositoryService
				.getProcessDefinition(task.getProcessDefinitionId());
		
		//获得流程实例对象
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processDefinitionKey("OrderFlow")
		  .processInstanceId(task.getProcessInstanceId()).singleResult();
		
		//获取正在活动的流程节点
		ActivityImpl ai = pe.findActivity(processInstance.getActivityId());
		
		List<PvmTransition> pList = ai.getOutgoingTransitions();
		//获得流程图向外走的线路
		for (PvmTransition pt : pList) {
			String name = (String) pt.getProperty("name");
			outcomes.add(name);
		}
		
		return outcomes;
	}

	@Override
	public void completeTaskByTaskId(String taskId, String outcome) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("outcome", outcome);
		System.out.println("dasdasdasd=="+taskId);
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		System.out.println("taskId=  "+task.getId());
		taskService.complete(task.getId(),map);
	}

}
