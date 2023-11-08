package com.jacaranda.model;

import java.util.List;
import java.util.Map;

public class WorkingList {
	
	private int employeeId;
	private Map<Project, Integer> workList;
	
	
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Map<Project, Integer> getWorkList() {
		return workList;
	}
	public void setWorkList(Map<Project, Integer> workList) {
		this.workList = workList;
	}
	
	

}
