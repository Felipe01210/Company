<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.Employee" %>
<%@ page import="com.jacaranda.model.Project" %>
<%@ page import="com.jacaranda.model.EmployeeProject" %>
<%@ page import="com.jacaranda.repository.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

if(session.getAttribute("currentEmployee") != null){
	Employee currentEmployee = (Employee) session.getAttribute("currentEmployee");
	List<EmployeeProject> listProjects = currentEmployee.getProjects();
}else{
	response.sendRedirect("index.js");
	return;
}

%>

</body>
</html>