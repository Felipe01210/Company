package com.jacaranda.model;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Map;

public class WorkingList {
	
	private Employee employee;
	private Map<Project, LocalDateTime> workList;
	
	public boolean hasProject(Project project) {
		boolean res = false;
		if(workList.containsKey(project)) {
			res = true;
		}
		return res;
	}
	
	public void addWork(Project project, LocalDateTime workBegin) {
		this.workList.put(project, workBegin);
	}
	
	//Este metodo no solo borra, devuelve el tiempo que tenia asignado el proyecto para facilitar las operaciones
	public LocalDateTime removeWork(Project project) {
		LocalDateTime res = this.workList.get(project);
		this.workList.remove(project);
		return res;
	}
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	public Map<Project, LocalDateTime> getWorkList() {
		return workList;
	}


	public void setWorkList(Map<Project, LocalDateTime> workList) {
		this.workList = workList;
	}


}
