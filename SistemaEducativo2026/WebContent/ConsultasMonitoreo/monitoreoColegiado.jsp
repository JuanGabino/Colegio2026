<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Consulta Módulo Trabajo Colegiado</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	 
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="controlActividades.jsp" ><img src="../Imagenes/registro.ico" height="30" width="30"><strong>Control de Actividades</strong></a></li>
			<!-- <li><a href="consultaNivelacion.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Seguimiento Nivelación</strong></a></li>
			<li><a href="asistenciaNiv.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Control Asistencia</strong></a></li>
			<li><a href="consultaSesion.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Consulta de Sesiones</strong></a></li>-->
		</ul>
	</nav>
</header> 
<br><br><br><br>

<div class="container-fluid">
  		<img src="../Imagenes/insignia2026.png" id="logo" width="100" height="100" style="float:left; margin:10px;">
  		<h3 style="margin-top: 20px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  		<h3><strong>Control y Monitoreo del Módulo de Trabajo Colegiado</strong></h3>
</div>

</body>
</html>