<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Asignaturas Docente</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 
</head>
<body style="background-color: #ECF0F1;">
  
<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="asignaturasDocente.jsp"><img src="../Imagenes/registro.ico" height="40" width="50"><strong>Registro de Notas</strong></a></li>
			<li><a href="reportesCursos.jsp" ><img src="../Imagenes/report.png" height="40" width="50"><strong>Reporte Bimestral</strong></a></li>
			<li><a href="reportesAlumnos.jsp" ><img src="../Imagenes/reportAlumno.png" height="40" width="50"><strong>Reportes Por Alumno</strong></a></li>
			<li></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>
    
<div class="container-row">  
   <div class="col-md-2">
   </div>
   
   <div class="col-md-8" >
       <div class="panel panel-default" >

			<!-- ENCABEZADO -->
			<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE CURSOS DICTADOS</strong></h4>
	  			<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   			</div>
   	
   			<!-- CUERPO -->
   			<div class="panel-body" id="cursos">
				<br><br>
   			</div>
	   </div>
   </div> 
</div>

<!-- SCRIPT -->
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
			    	'<form action="notasCurso.jsp">'+
			    	'<input type="hidden" name="txtcurso" value="'+ curso + '">' +
			        '<center><button type="submit" class="btn btn-warning" style="width:450px; height:120px; font-size: 28px" id="btnCurso" name="txtIdCurso" value="'+ id + '"><strong>'+curso+'</strong></button></center>' +
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
