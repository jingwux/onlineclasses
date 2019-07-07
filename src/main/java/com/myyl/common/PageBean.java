package com.myyl.common;

import java.util.List;

/**
 * 分页相关数据实体类
 * @author
 * @param <T>
   @date:
   
	   封装成一个PageBean  
	private int currentPage = 1; // 当前页, 默认显示第一页
	private int pageCount = 4;   // 每页显示的行数(查询返回的行数), 默认每页显示4行
	private int totalCount;      // 总记录数
	private int totalPage;       // 总页数 = 总记录数 / 每页显示的行数  (+ 1)
	private List<T> pageData;       // 分页查询到的数据
 */
public class PageBean<T> {
	
    private int currentPage=1; // 当前页, 默认显示第一页
    private int pageSize=10;   // 每页显示的行数(查询返回的行数), 默认每页显示4行
   
    private int totalCount; // 总记录数
    private int totalPage;  //总页数
    private List<T> pageData; //符合条件的分页数据
    
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
		
		if(totalCount % pageSize == 0){
			totalPage = totalCount / pageSize;
		}else{
			totalPage = totalCount / pageSize + 1;
		}
		
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

}
