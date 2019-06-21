<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Listar Actividades Docentes</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
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
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
			<li><a href="registrarDocente.jsp"><img src="../Imagenes/docente.png"   height="30" width="30">Registrar Docente&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
      		<li><a href="listarDocente.jsp"><img src="../Imagenes/report.png"    height="30" width="30">Listar Docentes</a></li>
      		<li><a href="asignarCursoDocente.jsp"><img src="../Imagenes/cursos.png" height="30" width="30">Asignar Curso Docente&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
      		<li><a href="listarcursosDocentes.jsp"><img src="../Imagenes/report.png"    height="30" width="30">Docentes Area Curricular</a></li>
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
   			<div class="panel panel-default" id="divPadres">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Área Curricular Docente</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divAreaCurricular" >               
                             <h4><strong>Área Curricular</strong></h4> 
                                  <select class="form-control selectArea" id="selectArea">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="CU1">Area Curricular Matematica</option>
		   							<option value="CU2">Area Curricular Comunicacion</option>
		   							<option value="CU10">Area Curricular Ciencia</option>
		   							<option value="CU11">Area Curricular Educacion para el Trabajo</option>
		   							<option value="CU5">Area Curricular Historia, Geografia y Economia</option>
		   							<option value="CU6">Area Curricular Formacion Ciudadana y Civica</option>
		   							<option value="CU7">Area Curricular de Desarrollo Personal</option>
		   							<option value="CU3">Area Curricular Ingles</option>
		   							<option value="CU4">Area Curricular Arte</option>
		   							<option value="CU8">Area Curricular Educacion Fisica</option>
		   							<option value="CU9">Area Curricular Educacion Religiosa</option>
	     					 	</select>
                        </div>
                        <div class="col-md-2" id="botonBuscar">
                        	<br><br>
                        	<button class="btn btn-primary" id="btnBuscar" name="btnBuscar"><img src="../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar</button>
                        </div>
   	 				</div><br>
   	 				
                    <h3><strong>Lista de Docentes: </strong></h3>
   	 				<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   	 				<div class="row table-responsive" id="scroll">
   	 					<table class="table table-hover table-bordered" id="table_docente">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
											<th style="text-align: center;">Nivel</th>
											<th style="text-align: center;">Curso</th>
											<th style="text-align: center;">Tarea</th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
									</tbody>
						</table>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Inicio:</strong></h4>
   	 						<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechainicio" name="fechainicio">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Fin:</strong></h4>
   	 						<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechafin" name="fechafin">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 					<div class="col-md-4" id="botonGuardar">
   	 						<br><br>
   	 						<button class="btn btn-success btn-block"  id="btnGuardar" name="btnGuardar">Guardar Tareas</button><br>
   	 					</div>
   	 				</div>
   	 			</div>
			</div>
		</div>
	</div>
</div>



<!-- SCRIPTS -->
<script type="text/javascript">
////////////////////////////////////////////////
$('#botonBuscar').on('click', '#btnBuscar', function(){
	
	var area = $("#selectArea").val().trim();

	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarAreaCurricular',
	    data: {
	    	
	    	area: area
	    },
		success: function(data)
        { 
			if(data == "vacio"){
				
				alert("No hay registro de docentes en esta área");
				$('#tbl_docente').empty(); 
			}
			else{
        	  var array = data.split("$");
        	  $('#tbl_docente').empty();
        	  var j = 1;
        	  for (var i = 0; i < array.length - 1; i++) {
				var dni      = array[i].split("/")[0];
				var nombre   = array[i].split("/")[1];
				var paterno  = array[i].split("/")[2];
				var materno  = array[i].split("/")[3];
				var nivel    = array[i].split("/")[4];
				var curso    = array[i].split("/")[5];

				
				$('#tbl_docente').append("<tr>" +
				    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+paterno+"</center></td>"+
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+materno+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nivel+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+curso+"</center></td>" +
  				  		'<td><center><select class="form-control" id="selectTarea" name="selectTarea">' +
		  		   			'<option value="" selected disabled hidden>--Seleccionar--</option>' +
		  		   			'<option value="Programación Curricular y Unidades">Programación Curricular y Unidades</option>'+
		  		   			'<option value="Elaboracion de Sesiones de Aprendizaje">Elaboracion de Sesiones de Aprendizaje</option>'+
		  		   			'<option value="Estrategia de Sistematizacón de Aprendizaje">Estrategia de Sistematizacón de Aprendizaje y Buenas Prácticas</option>'+		  		   			
		  		   			'<option value="Mejoramiento del desempeño docente">Mejoramiento del desempeño docente</option>'+
		  		   			'<option value="Elaboración de instrumentos de evaluación">Elaboración de instrumentos de evaluación</option>'+
		  		   			'<option value="Aplicación eficiente del enfoque de resolución de problemas ">Aplicación eficiente del enfoque de resolución de problemas </option>'+
		  					'</select></center></td>' +
				    "</tr>");
  				 
				 j++;
			  }
			}
        }
		
	})
});
///////////////////////////////////////////////////////////
$('#botonGuardar').on('click', '#btnGuardar', function(){
	
	 var linea1 = [];
	 var fe = $("#fechainicio").val();
	 var inicio = fe.substring(6,10)+"-"+fe.substring(0,2)+"-"+fe.substring(3,5);
	 
	 var fi = $("#fechafin").val();
	 var fin = fi.substring(6,10)+"-"+fi.substring(0,2)+"-"+fi.substring(3,5);
	 
	 console.log("fec: "+inicio+"-"+fin);
	 
	$("#tbl_docente tr").each(function(el) { 
	 var itemDetalle = {};
	 
	 itemDetalle.area    = $("#selectArea").val().trim();
	 itemDetalle.dni     = $(this).closest('tr').find("td").filter(":eq(1)").text();
	 itemDetalle.nombre  = $(this).closest('tr').find("td").filter(":eq(2)").text();
	 itemDetalle.paterno = $(this).closest('tr').find("td").filter(":eq(3)").text();
	 itemDetalle.materno = $(this).closest('tr').find("td").filter(":eq(4)").text();
	 itemDetalle.nivel   = $(this).closest('tr').find("td").filter(":eq(5)").text();
	 itemDetalle.curso   = $(this).closest('tr').find("td").filter(":eq(6)").text();
	 itemDetalle.tarea   = $(this).children().find("select").find(":selected").text();
	 itemDetalle.fechainicio = inicio;
	 itemDetalle.fechafin   = fin;
		
	 linea1.push(itemDetalle);
	}); 
	
	var datosxlinea1 = {};
	datosxlinea1.linea = linea1;

	var datatable1 = JSON.stringify(datosxlinea1);
	console.log(datatable1);

	$.ajax({
	
	 	type: 'POST',
	 	url: '<%=request.getContextPath()%>/RegistrarTareaDocente',
	 	dataType: 'JSON',
	 	data: {
			objetojson:JSON.stringify(datosxlinea1)
			},
		
		success: function(data){
		
		if(data == "1")
   	 {
   		 alert("Se registro la actividades del docente");
   		 document.getElementById("fechainicio").value = "";
   		 document.getElementById("fechafin").value = "";
   	 }
   	 else
   	 {
   		 alert("No se pudo registrar las actividades");
   	 }
	   }
	  
	});	
});
</script>
</body>
</html>