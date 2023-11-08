package com.jacaranda.model;

import java.util.List;

public class WorkingList {
	
	private int employeeId;
	private List<Project> workList;
	
	public void addProject(Project project) {
		this.workList.add(project);
	}
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public List<Project> getWorkList() {
		return workList;
	}
	public void setWorkList(List<Project> workList) {
		this.workList = workList;
	}
	
	

}
