<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Reforzamiento Academico</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nuevoEstilosCabecera.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
</head>
<body>

<!-- Cabecera -->
<header id="header" class="header">
   <div class="container">
    	<h1 class="encabezado"><strong>Módulo de Reforzamiento </strong></h1>
    	<h1 class="cuerpo"><strong>Académico</strong></h1>
    	<br><br>
    	<h3><strong><a href="#modulos">Empezar</a></strong></h3>
   </div>
</header>
<br><br>

<!-- CUERPO DE LA PAGINA --> 
<div id="modulos" class="container-row">
	<div class="container-row">
  		<img src="../Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  	</div>
  	<br>
  	
	<!-- CUERPO -->
	<div class="container-row">
   		<div class="col-md-3 atencion">
    		<center><a href="<%=request.getContextPath()%>/ModuloReforzamientoAcademico/comunicadoReforzamiento.jsp"><img src="../Imagenes/grupoestudio.jpg"  id="img1"></a></center>
    		<h2><strong>Círculo de Reforzamiento</strong></h2>
   		</div>
   		<div class="col-md-3 atencion">
    		<center><a href="<%=request.getContextPath()%>/ModuloReforzamientoAcademico/asistenciaReforzamiento.jsp"><img src="../Imagenes/asistencia3.jpg" id="img1"></a></center>
    		<h2><strong>Asistencia Nivelación</strong></h2>
   		</div> 
   		<div class="col-md-3 atencion">
    		<center><a href="<%=request.getContextPath()%>/ModuloReforzamientoAcademico/sesionesdeAprendizaje.jsp"><img src="../Imagenes/sesionesaprendizaje.jpg"  id="img1"></a></center>
    		<h2><strong>Sesiones de Aprendizaje</strong></h2>
   		</div>
   		<div class="col-md-3 atencion">
    		<center><img src="../Imagenes/controlasistencia1.jpeg" id="img1"></center>
    		<h2><strong>Control de Asistencia</strong></h2>
   		</div>
     </div> 
</div>


<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	  $('a[href^="#"]').click(function() {
	    var destino = $(this.hash); //this.hash lee el atributo href de este
	    $('html, body').animate({ scrollTop: destino.offset().top }, 700); //Llega a su destino con el tiempo deseado
	    return false;
	  });
	});
</script>
</body>
</html>