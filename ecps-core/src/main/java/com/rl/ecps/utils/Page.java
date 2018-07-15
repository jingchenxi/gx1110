package com.rl.ecps.utils;

import java.util.List;

/**
 * 分页对象
 * @author new
 *
 */
/**
 * @author new
 *
 */
public class Page {
 
	/**
	 * 当前页码
	 */
	private int PageNo=1;
	
	
	/**
	 * 煤业记录数
	 */
	private int pageSize = 5;
	
	
	/**
	 *查询条件下的记录数 
	 */
	private int totalCount = 0;
	
	
	/**
	 * 指定查询条件下的分页数
	 */
	private int totalPage = 1;
	
	/**
	 * 开始行号
	 */
	private int startNum = 0;
	
	private int endNum = 0;
	
	private List<?> list;

	
	public int getPageNo() {
		return PageNo;
	}

	public void setPageNo(int pageNo) {
		PageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return (int)Math.ceil(totalCount*1.0/pageSize);
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNum() {
		return (this.PageNo-1)*pageSize;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return this.PageNo*pageSize+1;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
}
