<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Asistencia Reforzamiento Academico</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
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

<!-- CUERPO DE LA PAGINA --> 
<div id="modulos" class="container-row">

	<!-- CUERPO -->
	<div class="container-row">
		<div class="col-md-2"></div>
   		<div class="col-md-8">
   			
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>ASISTENCIA DE ALUMNOS NIVELACIÓN</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<h4><strong>Grupos de Nivelación:</strong></h4>
           					<select class="form-control selectNivelacion" id="selectNivelacion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	       					<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   	 					</div>
   	 					<div class="col-md-6">
   	 						<br><br>
   	 						<button class="btn btn-primary" id="btnBuscar" name="btnBuscar" >Buscar Grupo</button>
   	 					</div>
   	 				</div>
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<h4><strong>Fecha:</strong></h4>
   	 						<input type="text" class="form-control" name="fechaNivelacion" id="fechaNivelacion" disabled>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<h4><strong>Clase:</strong></h4>
   	 						<input type="text" class="form-control" name="txtclase" id="txtclase" value="Nivelación" disabled>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<h4><strong>Tema:</strong></h4>
   	 						<input type="hidden" class="form-control" name="txtCurso" id="txtCurso" disabled>
   	 						<input type="text" class="form-control" name="txtTema" id="txtTema" disabled>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<h4><strong>Salón: </strong></h4>
   	 						<select class="form-control selectSalon" id="selectSalon" disabled>
		   						<option value="" selected disabled>--Seleccionar--</option>
		   						<option value="Salon1A">Salón 1° A</option>
		   						<option value="Salon1B">Salón 1° B</option>
		   						<option value="Salon1C">Salón 1° C</option>
		   						<option value="Salon1D">Salón 1° D</option>
		   						<option value="Salon2A">Salón 2° A</option>
		   						<option value="Salon2B">Salón 2° B</option>
		   						<option value="Salon2C">Salón 2° C</option>
		   						<option value="Salon2D">Salón 2° D</option>
		   						<option value="Salon3A">Salón 3° A</option>
		   						<option value="Salon3B">Salón 3° B</option>
		   						<option value="Salon3C">Salón 3° C</option>
		   						<option value="Salon3D">Salón 3° D</option>
		   						<option value="Salon4A">Salón 4° A</option>
		   						<option value="Salon4B">Salón 4° B</option>
		   						<option value="Salon4C">Salón 4° C</option>
		   						<option value="Salon4D">Salón 4° D</option>
		   						<option value="Salon5A">Salón 5° A</option>
		   						<option value="Salon5B">Salón 5° B</option>
		   						<option value="Salon5C">Salón 5° C</option>
		   						<option value="Salon5D">Salón 5° D</option>
	       					</select>
   	 					</div>
   	 				</div>
   	 				<br>
   	 				<div class="row">
   	 					<div class="table-responsive">
  							<table class="table table-bordered" id="Table">
 								<thead>
 									<tr>
 										<th style="text-align: center;">IDALUMNO</th>
 										<th style="text-align: center;">NOMBRE</th>
 										<th style="text-align: center;">AP. PATERNO</th>
 										<th style="text-align: center;">AP. MATERNO</th>
 										<th style="text-align: center;">SECCIÓN</th>
 										<th style="text-align: center;">CURSO</th>
 										<th style="text-align: center;">HORA INICIO</th>
 										<th style="text-align: center;">HORA FIN</th>
 										<th></th>
 									</tr>
 								</thead>
 								<tbody id="tbl_nivelacion"> 
	              
            					</tbody>
  							</table>
						</div>
   	 				</div>
   	 				<br>
   	 				<div class="row">
   	 					<div class="col-md-4"></div>
   	 					<div class="col-md-4">
   	 						<button class="btn btn-success form-control" id="btnRegistrarAsistencia" name="btnRegistrarAsistencia" >Registrar Asistencia</button>
   	 					</div>
   	 				</div>
   	 			</div>
    		</div>
   		</div>
	</div>
</div>


<!-- COMIENZA SCRIPT -->
<script type="text/javascript">
	n =  new Date();
	//Año
	y = n.getFullYear();
	//Mes
	m = n.getMonth() + 1;
	//Día
	d = n.getDate();

	//Lo ordenas a gusto.
	document.getElementById("fechaNivelacion").value = d + "/" + m + "/" + y;
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
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
////////////////////////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnBuscar', function(){
	
	var grupo = $('#selectNivelacion').val().trim();
	$("#txtTema").prop('disabled', false);
	$("#selectSalon").prop('disabled', false);
	
	var vacio = "";
	
	if(grupo == vacio)
	{
		alert("Seleccione su grupo de Nivelación");
	}
	else
	{
		$.ajax({
	        type: 'POST',
	        url: '<%=request.getContextPath()%>/ListarAlumnosNivelacion',
	        data : {
				grupo : grupo
			},
	        success: function(data)
	        {            	
	        	var array = data.split("$");
				
				if(data == "_")
				{
					alert("No hay registro de Alumnos");
				}
				else
				{
					$('#tbl_nivelacion').empty();
					for (var i = 0; i < array.length - 1; i++) {
						var id     = array[i].split("/")[0];
						var nombre = array[i].split("/")[1];
						var apellidopat = array[i].split("/")[2];
						var apellidomat = array[i].split("/")[3];
						var seccion    = array[i].split("/")[4];
						var curso      = array[i].split("/")[5];
						var horaInicio = array[i].split("/")[6];
						var horaFin    = array[i].split("/")[7];
						
						$('#tbl_nivelacion').append("<tr>" +
		  				  		"<td><center>"+id+"</center></td>" +
		  				  		"<td><center>"+nombre+"</center></td>" +
		  				  		"<td><center>"+apellidopat+"</center></td>" +
		  				  	    "<td><center>"+apellidomat+"</center></td>" +
		  				  		"<td><center>"+seccion+"</center></td>" +
		  				  		"<td><center>"+curso+"</center></td>" +
		  				  		"<td><center>"+horaInicio+"</center></td>" +
		  				  		"<td><center>"+horaFin+"</center></td>" +
		  				  		'<td><center><select class="form-control" id="selectAsistencia" name="selectAsistencia">' +
	  				  		   		'<option value="" selected disabled hidden>Seleccionar</option>' +
	  				  		   		'<option value="Asistio">Asistio</option>'+
	  				  		   		'<option value="Tardanza">Tardanza</option>'+
	  				  		   		'<option value="Faltó">Falto</option>'+
	  				  				'</select></center></td>' +
		  				  		"</tr>");
						
						}
				}
				document.getElementById("txtCurso").value = curso;
	        }
		});
	}
});
/////////////////////////////////////////////////////
$('#btnRegistrarAsistencia').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.grupo         = $('#selectNivelacion').val().trim();
	item.fecha         = $('#fechaNivelacion').val().trim();
	item.clase         = $('#txtclase').val().trim();
	item.tema          = $('#txtTema').val().trim(); 
	item.salon         = $('#selectSalon').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#txtTema').val() != "" || $('#selectSalon').val() != "")
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarAsistenciaNivelacion',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro la asistencia del grupo");
	    		 registrarDetalleAsistenciaNivelacion();
	    		 document.getElementById("txtTema").value = "";
	    		 document.getElementById("selectNivelacion").value = "";
	    		 document.getElementById("selectSalon").value = "";
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE REGISTRO LA ASISTENCIA DEL GRUPO");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione el TEMA que se trabajo en la clase de Nivelación");
	}
});
////////////////////////////////////////////////////
function registrarDetalleAsistenciaNivelacion(){
	
	 	var linea1 = [];
	
	 	$("#tbl_nivelacion tr").each(function(){
	 		
	 		var itemDetalle = {};
	 		var tds = $(this).find("td");
	 		
			itemDetalle.alumno   = tds.filter(":eq(0)").text();
			itemDetalle.estado   = $(this).children().find("select").find(":selected").text();
			
			linea1.push(itemDetalle);
   		});
			
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarDetalleAsistenciaNivelacion',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data)
			{
			
			 if(data == "1")
	    	 {
	    		 alert("SE REGISTRO A LA ASISTENCIA DE LOS ALUMNOS");
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE PUDO REGISTRAR LA ASISTENCIA, INTENTE DE NUEVO");
	    	 }
		   }
		 
		 
	 	});
};
</script>
</body>
</html>