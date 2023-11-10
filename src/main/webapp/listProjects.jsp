<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.Employee" %>
<%@ page import="com.jacaranda.model.Project" %>
<%@ page import="com.jacaranda.model.EmployeeProject" %>
<%@ page import="com.jacaranda.model.WorkingList" %>
<%@ page import="com.jacaranda.repository.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

//Añadir validacion de login = true

Employee currentEmployee = (Employee) session.getAttribute("currentEmployee"); 
WorkingList workingList = (WorkingList) session.getAttribute("workingList");

if(request.getParameter("project")!=null){
	int idProject = Integer.valueOf(request.getParameter("project"));
	Project project = GenericRepository.find(Project.class, idProject);
	
	if(request.getParameter("work") == "start"){
		workingList.addWork(project, LocalDateTime.now());
	}else if(request.getParameter("work") == "stop"){
		//crear metodo para quitar proyecto del workingList
		//guardar tiempo actual
		//restar tiempo original al tiempo original
		//convertir a horas
		
		
		LocalDateTime beginTime = workingList.removeWork(project);
		//Añadir validacion de que sea el mismo dia
		int hoursWorked = LocalDateTime.now().getHour() - beginTime.getHour();
		
		EmployeeProject jornada = new EmployeeProject(currentEmployee, project, hoursWorked);
		
		//Merge
		//El updateOrSave del GenericRepository no cubre la suma de horas de bd a las nuevas
		//Hacer un EmployeeProjectRepository
		//En EmployeeProjectRepository, hacer un updateOrSave que reciba la jornada y, antes de subirla a bd,
		//compruebe si existe y, en caso afirmativo, modifique la jornada sumandole las horas de la encontrada.
		
	}
}

if(session.getAttribute("currentEmployee") != null){
	Employee currentEmployee = (Employee) session.getAttribute("currentEmployee");
	List<EmployeeProject> listProjects = currentEmployee.getProjects(); %>
	
	<%if(listProjects.size() > 0){ %>
	
	<h1>Lista de proyectos del empleado <%=currentEmployee.getFirstName() %></h1>
	
	<ul>
	
	<%for(EmployeeProject project : listProjects){ %>
	
	<li>
	<p><%=project.getIdProject().getName() %></p>
	<!-- Crear metodo para comprobar si el projecto esta en la workingList -- hecho -->
	<!-- Crear condicional para poner el boton de "trabajar" si no esta en la workingList -- hecho -->
	<!-- Crear condicional para poner el boton de "parar" si esta en la workingList -- hecho -->
	
	<%if(workingList.hasProject(project.getIdProject())){ %>
	
	<form>
	<input name="project" value="<%=project.getIdProject().getId() %>" hidden>
	<input name="work" value="start" hidden>
	<button type="submit">Trabajar</button>
	</form>
	
	<%else{ %>
	
	<form>
	<input name="project" value="<%=project.getIdProject().getId() %>" hidden>
	<input name="work" value="stop" hidden>
	<button type="submit">Parar trabajo</button>
	</form>
	</li>
	
	<%} %>
	<%} %>
	
	</ul>
	
	<%}else{ %>
	
	<h1>El empleado <%=currentEmployee.getFirstName() %> no tiene asignado ningun proyecto</h1>
	
	<%} %>
	
	<form action="listCompanyProjects">
	<button type="submit">Asignar nuevos proyectos</button>
	</form>
	
	
<%}else{
	response.sendRedirect("index.js");
	return;
}

%>

</body>
</html>