<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.Company" %>
<%@ page import="com.jacaranda.model.Employee" %>
<%@ page import="com.jacaranda.model.Project" %>
<%@ page import="com.jacaranda.model.CompanyProject" %>
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

<header>

<a href="listProjects.jsp">Ver proyectos</a>

</header>

<%for(Company c: result){ %>

<table>
	<tr>
		<td><h4><%=c.getName() %></h4></td>
		<td><h4>Empleados: <%=c.getEmployees().size() %></h4></td>
		<td><h4>Proyectos: <%=c.getProjects().size() %></h4></td>
	</tr>
	<tr>
		<td colspan=3><h4>Listado de empleados</h4></td>
	</tr>
	<tr> <!-- for empleados -->
		<%for(Employee e: c.getEmployees()){ %>
		<td colspan=3><p><%=e.getId() %> : <%=e.getFirstName() %></p></td>
		<%} %>
	</tr>
	<tr>
		<td colspan=3>
			<h4>Listado de proyectos</h4>
			<form action="listProjects.jsp">
				<button type="submit"></button>
			</form>
		</td>
	</tr>
	<tr> <!-- for proyectos -->
		<%for(CompanyProject cp: c.getProjects()) {%>
		<td colspan=3>
		<p><%=cp.getIdProject().getId() %> : <%=cp.getIdProject().getName() %></p>
		</td>
		<%} %>
	</tr>
</table>

<%}%>

</body>
</html>