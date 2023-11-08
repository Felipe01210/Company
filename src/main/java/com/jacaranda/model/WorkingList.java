package com.jacaranda.model;

import java.sql.Date;
import java.util.Map;

public class WorkingList {
	
	private int employeeId;
	private Map<Project, Date> workList;
	
	
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Map<Project, Date> getWorkList() {
		return workList;
	}
	public void setWorkList(Map<Project, Date> workList) {
		this.workList = workList;
	}
	
	

}
