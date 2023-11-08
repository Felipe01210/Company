<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.jacaranda.utility.BDConection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.repository.GenericRepository" %>
<%@ page import="com.jacaranda.repository.EmployeeRepository" %>
<%@ page import="com.jacaranda.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
</head>
<body>

<%

session.setAttribute("login", false);

if(request.getParameter("username") != null && request.getParameter("password") != null){

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	try{
		Employee currentEmployee = EmployeeRepository.findByName(username);
		if(!password.equals(currentEmployee.getPassword())){
			session.setAttribute("msg", null);
			session.setAttribute("login", true);
			session.setAttribute("currentEmployee", currentEmployee);
			response.sendRedirect("listCompanies.jsp");
			return;
		}else{
			session.setAttribute("msg", "Empleado o contraseña incorrecta");
			return;
		}
	}catch(Exception e){
		e.getMessage();
	}

}else{ //si no encuentra parametros para username y password, carga el formulario
//inicio de sesion con empleado (mod bd)
//comprobacion de request != null --
//comprobacion de que existe el usuario
//si existe: comprobacion de la contraseña
//guardar usuario en session
//preparar validacion y errores en esta misma pagina

//si todo esta bien pasamos a la lista de compañias (modificar lista de compañias para que sea la tabla con empleados y proyectos)
//hacer el CRUD completo de las empresas -- solo accesible para el empleado con rol ADMIN
//en header poner "mi empresa" -- mostrar proyectos de mi empresa
//en header poner nombre del empleado
//en header poner "empresas" para poder acceder de nuevo a la lista de empresas
//hacer register para registrar un nuevo empleado en una de las empresas
//en header añadir login, register y logout
//pagina para poner en marcha un contador de trabajo de un empleado en un proyecto
//dicha pagina debe poder parar el contador y mandar la información de las horas trabajadas empleado-proyecto a la bd

//al terminar hacer prueba en pagina de incognito
%>

<!-- Cambiar formulario para logearse con datos de empleado -->

<h1>Log In</h1>
<hr>
<%if(session.getAttribute("msg")!=null) {%>

<h2><%=session.getAttribute("msg") %></h2>

<%}%>
<form action="index.jsp" method="get">
<label>First Name</label>
<input type="text" name="username" required>
<label>Password</label>
<input type="password" name="password" required>
<button type="submit">Send</button>
</form>

<%} %>

</body>
</html>