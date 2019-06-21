<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <title>Registro de Notas</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/encabezado.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
 
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
 <script type="text/javascript">
	$('#cursos').on('click', '#btnCurso', function(){
		
		 window.location.href = "asignaturasTemas.jsp";
		 
	});
 </script>
</head>
<body>

  <header id="header" class="header">
   <div class="container">
    <h1><strong>Sistema Educativo 2026</strong></h1>
    <h2>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong></h2>
    <h3>MÓDULO DE REGISTRO DE NOTAS</h3>
   </div>
  </header>
  <br>
    
<div id="modulos" class="container-row">  
  <div class="container-row">
  		<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  </div>
  <br><br> 
  
  <div class="container-row">
  
   <div class="col-md-3">
    <section id="menu">
   
     <ul>
      <a href="asignaturasDocente.jsp"><img src="Imagenes/registro.ico" height="40" width="50"><strong>Registro de Notas</strong></a>
      <a href="asignaturasClases.jsp"><img src="Imagenes/libro.png" height="40" width="50"><strong>Gestión de Clases</strong></a>
      <a href="reportesCursos.jsp" ><img src="Imagenes/report.png" height="40" width="50"><strong>Reporte Bimestral</strong></a>
      <a href="reportesAlumnos.jsp" ><img src="Imagenes/reportAlumno.png" height="40" width="50"><strong>Reportes Por Alumno</strong></a>
      <br>
      <br>
      <a href="index.jsp"><img src="Imagenes/notas.ico" height="40" width="50"><strong>Regresar</strong></a>
     </ul>
  
    </section>
   </div>
   
   <div class="col-md-9" id="contenido">
    	<div class="panel panel-default" >

			<!-- ENCABEZADO -->
			<div class="panel-heading">
	  			<h4><strong><img src="Imagenes/curso.png" height="40" width="50">LISTA DE CURSOS</strong></h4>
	  			<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   			</div>
   			<button></button>
   	
   			<!-- CUERPO -->
   			<div class="panel-body" id="cursos">

   			</div>
		</div>
   </div>
   
  </div>
</div>
<script type="text/javascript">
////////////////////////////////////////
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarCursoDocente',
	    data: {
	    	
	    	dni : numdni
	    },
	    success: function(data)
        { 
        	
	    	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var id    = var1[i].split("-")[0];
			    var curso = var1[i].split("-")[1];
			    
			    $('#cursos').append(
			    	'<div class="row">'+
			    	'<form action="../asignaturasTemas.jsp">'+
			    	'<input type="hidden" name="txtcurso" value="'+ curso + '">' +
			        '<center><button type="submit" class="btn btn-success" style="width:450px; height:120px; font-size: 28px" id="btnCurso" name="txtIdCurso" value="'+ id + '"><strong>'+curso+'<strong></button></center>' +
			        '</form>'+
			        '</div>' +'<br>'
			     
			    );
        	}
        }
		
	});
	
});
/////////////////////////////////
</script>

</body>
</html>
