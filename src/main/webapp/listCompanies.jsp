<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.Company" %>
<%@ page import="com.jacaranda.repository.GenericRepository" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Convertir a lista de tarjetas con el siguiente formato de la imagen -->

<%

boolean loged = (Boolean) session.getAttribute("login");

ArrayList<Company> result = null;

try{
	result = (ArrayList<Company>) GenericRepository.findAll(Company.class);
}catch(Exception e){
	e.getMessage();
}

%>

<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Address</th>
			<th>City</th>
			<th>Employees</th>
			<th></th>
			<th>Projects</th>
			<th></th>
		</tr>
	</thead>
	
	<%for(Company e: result){ %>
	<tr>
		<td><%=e.getId() %></td>
		<td><%=e.getName() %></td>
		<td><%=e.getAddress() %></td>
		<td><%=e.getCity() %></td>
		<td><%=e.getEmployees().size() %></td>
		<td><a href="http://localhost:8080/Company/listEmployees.jsp?idCompany=<%=e.getId() %>">Ver empleados</a></td>
		<td><%=e.getProjects().size() %></td>
		<td><a href="http://localhost:8080/Company/listProjects.jsp?idCompany=<%=e.getId() %>">Ver proyectos</a></td>
	</tr>
	<%}; %>
	
</table>

</body>
</html>