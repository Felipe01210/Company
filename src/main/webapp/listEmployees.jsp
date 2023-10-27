<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.Employee" %>
<%@ page import="com.jacaranda.model.Company" %>
<%@ page import="com.jacaranda.repository.GenericRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

List<Employee> result = null;

if(request.getParameter("idCompany")!=null){
	Company company = GenericRepository.find(Company.class, Integer.valueOf(request.getParameter("idCompany")));
	result = company.getEmployees();
}else{
	try{
		result = GenericRepository.findAll(Employee.class);
	}catch(Exception e){
		e.getMessage();
	}
	
}

%>

<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Gender</th>
			<th>DateOfBirth</th>
			<th>Company</th>
		</tr>
	</thead>
	
	<%for(Employee e: result){ %>
	<tr>
		<td><%=e.getId() %></td>
		<td><%=e.getFirstName() %></td>
		<td><%=e.getLastName() %></td>
		<td><%=e.getEmail() %></td>
		<td><%=e.getGender() %></td>
		<td><%=e.getDateOfBirth() %></td>
		<td><%=e.getEmployeeCompany().getName() %></td>
	</tr>
	<%}; %>
	
</table>

</body>
</html>