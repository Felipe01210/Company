<%@page import="com.jacaranda.utility.BDConection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.User" %>
<%@ page import="com.jacaranda.repository.GenericRepository" %>
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
	User currentUser = new User();
	
	try{
		currentUser = GenericRepository.find(User.class, username);
	}catch(Exception e){
		session.setAttribute("msg","usuario no encontrado");
		//MEJOR QUE UNA PAGINA DE ERROR CREAR UN IF EN EL FORMULARIO QUE, AL RECIBIR UN VALOR EN ERRORMSG QUITE HIDDEN Y MUESTRE EN ROJO EL ERROR
		//ASI CUBRIMOS MÁS ERRORES SIN SACAR AL USUARIO DEL FORMULARIO DE LOGIN
		response.sendRedirect("error.jsp");
	}
	session.setAttribute("login", true);
	session.setAttribute("user", currentUser);
	
	response.sendRedirect("listCompanies.jsp");
	
}else{

%>

<h1>Log In</h1>
<hr>
<form action="index.jsp" method="get">
<label>Username</label>
<input type="text" name="username" required>
<label>Password</label>
<input type="password" name="password" required>
<button type="submit">Send</button>
</form>

<%} %>

</body>
</html>