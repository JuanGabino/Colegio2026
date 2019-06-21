<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reporte Rendimiento por Alumno</title>	
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/encabezado.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
  	  String idalumno = request.getParameter("txtalumno");
      String curso    = request.getParameter("txtcurso");
      String docente  = request.getParameter("txtdni");
      String seccion  = request.getParameter("txtseccion");
      String anio     = request.getParameter("txtanio");
  	%>
  	
	<!-- Cabecera -->
    <header id="header" class="header">
     <div class="container">
    	<h1><strong>Sistema Educativo 2026</strong></h1>
    	<h2>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong></h2>
    	<h3>MÓDULO DE REGISTRO DE NOTAS</h3>
     </div>
  	</header>
  	<br>
  	<!-- CUERPO DE LA PAGINA --> 
  	<div id="modulos" class="container-row">
  		
  		<!-- LOGO -->
  		<div class="container-row">
  			<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  			<br>
  			<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  		</div>
  		<br><br>
  	
  		<!-- CUERPO -->
  		<div class="container-row">
  			<div class="panel panel-default" id="divAlumnos">
  				<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="Imagenes/lista.png" height="40" width="50"><strong>Rendimiento del Alumno </strong></h4>
   	 			</div>
   	 		</div>
   	 		<div class="panel-body">
   	 			<div class="row" id="divRendimiento">
               		<br>
               		<canvas id="Rendimiento"></canvas>
                </div>
   	 			<input  id="idalum" name="idalum" value="<%out.print(idalumno); %>">
  				<input  id="curso" name="curso" value="<%out.print(curso); %>">
  				<input  id="docente" name="docente" value="<%out.print(docente); %>">
  				<input  id="seccion" name="seccion" value="<%out.print(seccion); %>">
  				<input  id="anio" name="anio" value="<% out.print(anio); %>">
  			</div> 			
  		</div>
  	</div>
  	
<script src="<%=request.getContextPath()%>/dist/Chart.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var sec = $('#seccion').val().trim();
	var cur = $('#curso').val().trim();
	var dni  = $('#docente').val().trim();
	var id   = $('#idalum').val().trim();
	var anio = $('#anio').val().trim();
	var per = 1;
	
	

})
</script>
</body>
</html>