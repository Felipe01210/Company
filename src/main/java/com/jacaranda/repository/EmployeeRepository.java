package com.jacaranda.repository;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Employee;
import com.jacaranda.utility.BDConection;

public class EmployeeRepository {
	
	public static Employee findByName(String name) throws Exception{
		Transaction transaction = null;
		Session session;
		Employee result;
		try {
			session = BDConection.getSessionFactory().openSession();
		}catch(Exception e) {
			throw new Exception("error en la base de datos");
		}
		try {
			SelectionQuery<Employee> q = session.createSelectionQuery("From Employee where name := name", Employee.class);
			q.setParameter("name", name);
			result = q.getSingleResult();
		}catch(Exception e) {
			throw new Exception("error en find");
		}
		return result;
	}

}
