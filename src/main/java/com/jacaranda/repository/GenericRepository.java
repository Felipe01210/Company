package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jacaranda.utility.BDConection;

//GENERIC REPOSITORY HAS METHOD FOR ANY OBJECT GIVEN
//IF THE METHOD DOESN`T WORK FOR AN ESPECIFIC CLASS, CREATE AN ESPECIFIC REPOSITORY
public class GenericRepository {
	
	//Conseguir un unico objeto por su id tipo Integer
	public static <T> T find(Class<T> c, Integer id) throws Exception{
		Transaction transaction = null;
		Session session;
		T result;
		try {
			session = BDConection.getSessionFactory().openSession();
		}catch(Exception e) {
			throw new Exception("error en la base de datos");
		}
		try {
			result = (T) session.find(c, id);
		}catch(Exception e) {
			throw new Exception("error en find");
		}
		return result;
	}
	
	//Conseguir un unico objeto por su id tipo String -- CREADO PARA USER PERO SIRVE PARA CUALQUIER CLASE CON CADENA DE TEXTO COMO PK
		public static <T> T find(Class<T> c, String id) throws Exception{
			Transaction transaction = null;
			Session session;
			T result;
			try {
				session = BDConection.getSessionFactory().openSession();
			}catch(Exception e) {
				throw new Exception("error en la base de datos");
			}
			try {
				result = (T) session.find(c, id);
			}catch(Exception e) {
				throw new Exception("error en find");
			}
			return result;
		}

	//Conseguir toda la lista de una misma clase
	public static <T> List<T> findAll(Class<T> c) throws Exception{
		Transaction transaction = null;
		Session session;
		List<T> resultList;
		try {
			session = BDConection.getSessionFactory().openSession();
		}catch(Exception e) {
			throw new Exception("error en la base de datos");
		}
		try {
			resultList = (List<T>) session.createSelectionQuery("From " + c.getName()).getResultList();
		}catch(Exception e) {
			throw new Exception("error en find");
		}
		return resultList;
	}
	
	//Merge de un objeto
	public static <T> T updateOrSave(Class<T> c, T object) throws Exception{
		Transaction transaction = null;
		Session session;
		T result;
		try {
			session = BDConection.getSessionFactory().openSession();
		}catch(Exception e) {
			throw new Exception("error en la base de datos");
		}
		try {
			result = session.merge(object);
		}catch(Exception e) {
			throw new Exception("error en merge");
		}
		return result;
	}
	
}
