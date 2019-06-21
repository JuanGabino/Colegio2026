<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Sesiones de Aprendizaje</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estiloBotones.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
 	
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
 	
</head>
<body style="background-color: #ECF0F1;">


<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
      		<li><a href="comunicadoReforzamiento.jsp"><img src="../Imagenes/registro.ico"   height="30" width="30">Círculo de Reforzamiento</a></li>
      		<li><a href="listaComunicadoNivelacion.jsp"><img src="../Imagenes/report.png"   height="30" width="30">Lista de Comunicados Nivelación</a></li>      		
      		<li><a href="asistenciaReforzamiento.jsp"><img src="../Imagenes/asistencia.png" height="30" width="30">Asistencia de Nivelación</a></li>
      		<li><a href="sesionesdeAprendizaje.jsp"><img src="../Imagenes/libro.png"      height="30" width="30">Sesiones de Aprendizaje</a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>


<!-- CUERPO -->
<div class="container-row">  
   
   <div class="col-md-2"></div>
   
   <!-- PANEL -->
   <div class="col-md-8">
     
   		<div class="panel panel-default">
   		
   		    <!-- CABECERA DEL PANEL-->
    		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">DATOS DEL DOCENTE</strong></h4>
   			</div>
   			<!-- CUERPO DEL PANEL -->
   			<div class="panel-body">
   				<div class="row">
   	 				<div class="col-md-6" id="divDocenteDni" >               
                          <h4><strong>Nº de Documento</strong></h4> 
                          <div class="row">
                               <div class="col-md-8">
                                    <input type="text" class="form-control" id="txtnumdoc" name="txtnumdoc"  value="<% out.println(session.getAttribute("dni"));  %>" disabled>
                               </div>
                          </div>
                    </div>
   	 			</div><br>
   	 			<div class="row">
   	 				<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnom" id="txtnom" disabled>
   	 				</div>
   	 				<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpat" id="txtpat" disabled>
   	 				</div>
   	 				<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmat" id="txtmat" disabled>
   	 				</div>
   	 			</div>
   			</div>
   		</div><br>
   		
   		<div class="panel panel-default">
   		
   			<!-- CABECERA DEL PANEL-->
    		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">SESIÓN DE APRENDIZAJE</strong></h4>
   			</div>
   			
   			<!-- CUERPO DEL PANEL -->
   			<form method="post" action="<%=request.getContextPath()%>/SubirArchivos" enctype="multipart/form-data">
   			<div class="panel-body">
   				<div class="row">
   					<br>
   					<label style="margin-left: 20px;"><strong>Descargar Plantilla de Sesión de Aprendizaje</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   					<a href="../PlantillasWord/Historia de Usuario.docx" download="PlantillaWord"><button class="btn btn-primary" id="btnDescargar" name="btnDescargar"><strong>Descargar</strong></button></a>
   					<input type="text"  id="txtcodDocente" name="txtcodDocente">  
   				</div><br>
   				<div class="row">
   				    <div class="col-md-4">
						<h4><strong>Fecha de Creación</strong></h4>
                    	<div class="input-group date fj-date" data-provide="datepicker">
    						<input type="text" class="form-control" id="fechainicio" name="fechainicio">
    						<div class="input-group-addon">
        						<img src="../Imagenes/calendario.ico"   height="20" width="20">
    						</div>
						</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col-md-4" id="divNivelacion">
						<h4><strong>Grupos de Nivelación:</strong></h4>
           				<select class="form-control selectNivelacion" id="selectNivelacion" onchange="mostrarValor(this.value);">
		   					<option value="" selected disabled hidden>--Seleccionar--</option>
	       				</select><br>
	       				<input type="hidden" id="nivelacion" name="nivelacion">
					</div>
					<div class="col-md-4">
   	 					<h4><strong>Sección:</strong></h4>
   	 					<input type="text" class="form-control" name="txtseccion" id="txtseccion" >
   	 				</div>
   	 				<div class="col-md-4">
   	 					<h4><strong>Curso:</strong></h4>
   	 					<input type="text" class="form-control" name="txtcurso" id="txtcurso" >
   	 				</div>
   	 			</div><br>
   	 			<div class="row">
					<div class="col-md-12"> 
   	 					<h4><strong>Título:</strong></h4>
   	 					<input type="text" class="form-control" name="txttitulo" id="txttitulo" placeholder="Escriba un titulo...">
   	 				</div>
   	 			</div><br><br>
   	 			<div class="row">
   	 				<label style="margin-left: 20px;"><strong>Subir Sesión de Aprendizaje</strong></label>&nbsp;
   	 				<input style="margin-left: 20px;" class="boton_1" type="file" id="archivo" name="archivo" value="Subir Archivo" required>
   	 			</div><br><br><br>
   	 			 
   	 			<div class="row">
   	 				<div class="col-md-6">
   	 					<div class="col-md-6">
   	 						<button class="btn btn-success from-control" type="submit" id="btnGuardar" name="btnGuardar" >Guardar Sesión</button>
   	 					</div>
   	 				</div>
   	 			</div>
   	 			
   			</div>
   			</form>
   		</div>
   </div>
</div>

<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>	
<script type="text/javascript">
///////////////////////////////////////////////
var mostrarValor = function(x){
       
	document.getElementById('nivelacion').value=x;
}
///////////////////////////////////////////////
$(document).ready(function(){
	
	var dni = $("#txtnumdoc").val();
	console.log(dni);
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/BuscarDocentexDni',
	    data: {
	    	
	    	dni: dni
	    },
		success: function(data)
        { 
			
        	var array = data.split("$");
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    = array[i].split("/")[0];
				var nombre    = array[i].split("/")[1];
				var apellidopat 	 = array[i].split("/")[2];
				var apellidomat 	 = array[i].split("/")[3];
			
			}
        	
        	document.getElementById("txtnom").value = nombre;
        	document.getElementById("txtpat").value = apellidopat;
        	document.getElementById("txtmat").value = apellidomat;
        	document.getElementById("txtcodDocente").value = codigo;
        }
	});	
	
	////////////////////////////////////////////////////
	
	var numdni = $("#txtnumdoc").val();
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarNivelacion',
	    data: {
	    	
	    	dni : numdni
	    },
		success: function(data)
        { 
			$('#selectNivelacion').empty();
        	$('#selectNivelacion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectNivelacion').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////////////
$('#divNivelacion').on('change', '#selectNivelacion', function(){
		
        if ( $(this).children(":selected").val() === "" ) 
        {
              document.getElementById("txtcurso").value = "";
              document.getElementById("txtseccion").value = "";
        }
        else 
        {
        	$.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/NivelacionSeccionxCurso',
                data: { 
                	
		        	codigo: $("#selectNivelacion").val()
		        },
                success: function(data)
            	{
               			var var1=data.split("$");
	           			for (var i=0;i<var1.length-1;i++) 
	           			{
			    			var grado = var1[i].split("/")[0];
			    			var curso = var1[i].split("/")[1];
	
						}
	           			console.log(grado + "-" + curso);
		    			document.getElementById("txtcurso").value = curso;
		                document.getElementById("txtseccion").value = grado;
         		}
     		});   
     	}
});
//////////////////////////////////////////////////////////////
</script>
</body>
</html>