<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 	<title>Reportes Por Alumno</title>
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

<!-- CUERPO DE LA PAGINA --> 
<div class="container-row">
  
   <!-- INSIGNIA -->
   <div class="container-fluid">
   	<img style="float:left;" src="../Imagenes/insignia2026.png" width="70" height="70"><h3 style="margin-top:20px; font-family: monospace;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
   </div>
   <br><br><br>
  	
   <div class="col-md-2"></div>

   <div class="col-md-8">

   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>LISTA DE ALUMNOS</strong></h4>
   	 			</div>
   	 			
   	 			<div class="panel-body">
   	 				<!-- BUSQUEDA -->
   	 				<form action="<%=request.getContextPath()%>/reporteRendimientoAlumno.jsp">
   	 				<div class="row">
   	 					<div class="col-md-3">
           					<h4><strong>Curso:</strong></h4>
           					<select class="form-control selectCurso" id="selectCurso">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select>
	     				</div>
	     				<div class="col-md-3">
           					<h4><strong>Seccion:</strong></h4>
           					<select class="form-control selectSeccion" id="selectSeccion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	       					<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	     				</div>
	     				<div class="col-md-3">
       			 			<h4><strong>Periodo: </strong></h4>
	   	 		 			<select class="form-control selectPeriodo" id="selectPeriodo">
	   	 		 				<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 			</select>
       			 		</div>
	     				<div class="col-md-3">
	     					<h4><strong>Año:</strong></h4>
           					<select class="form-control selectAnio" id="selectAnio">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	     				</div>
   	 				</div>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<br><br>
	    					<button type="button" class="btn btn-success form-control" id="btnBuscar">BUSCAR REPORTES DE NOTAS</button>
   	 					</div>
   	 				</div>
   	 				<br>
   	 				<div class="table-responsive" id="tablaAlumnos">	
   	 								
           						<table id="Table" class="table">
            						<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             							<tr>
              								<th><center>IDALUMNO</center></th>
              								<th><center>NOMBRE</center></th>
              								<th><center>APELLIDO PATERNO</center></th>
              								<th><center>APELLIDO MATERNO</center></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumno"> 
	              
            						</tbody>
           						</table>
           						<input type="hidden" name="txtalumno" id="txtalumno" value="">
           						<input type="hidden" name="txtcurso" id="txtcurso" value="">
           						<input type="hidden" name="txtseccion" id="txtseccion" value="">
           						<input type="hidden" name="txtanio" id="txtanio" value="">
      				</div>
      		        </form>
   	 			</div>
   	 			
    		</div>
   		
   		
   </div>
</div> 


  <!-- MODAL RENDIMIENTO -->
  <div id="myModalRendimiento" class="modal fade" role="dialog">
  	<div class="modal-dialog">
  	
  		<!-- Modal content-->
    	<div class="modal-content">
    		<!-- CABECERA -->
    		<div class="modal-header" style="background-color: #213758;">
        		<button type="button" class="close" data-dismiss="modal" >&times;</button>
        		<h4 class="modal-title" style="color: white;"><strong>RENDIMIENTO ACADEMICO</strong></h4>
      		</div>
      		<!-- CUERPO -->
      		<div class="modal-body">
      			<div class="row" id="divRendimiento">
               		<br><br>
               		<canvas id="Rendimiento"></canvas>
                </div>
      		</div>
    	</div>
    										
  	</div>
  </div>
  
  
<script src="<%=request.getContextPath()%>/dist/Chart.bundle.min.js"></script>
<script type="text/javascript">
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarPeriodo',
		success: function(data)
        { 
			$('#selectPeriodo').empty();
        	$('#selectPeriodo').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectPeriodo').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
///////////////////////////////////////////////////////////7
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarAnio',
		success: function(data)
        { 
			$('#selectAnio').empty();
        	$('#selectAnio').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectAnio').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarSeccionDocente',
	    data: {
	    	
	    	dni : numdni
	    },
		success: function(data)
        { 
			$('#selectSeccion').empty();
        	$('#selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectSeccion').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
//////////////////////////////////////////////7
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
			$('#selectCurso').empty();
        	$('#selectCurso').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectCurso').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#selectCurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var vacio = "";
	
	$('#Table tbody tr').remove();
	
	if(sec == vacio || cur == vacio || per == vacio || anio == vacio)
	{
		alert("Campos Obligatorios no seleccionados");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarAlumnoxSeccion',
        data : {
			seccion : sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("=")[0];
					var nombre = array[i].split("=")[1];
					var apellidopat = array[i].split("=")[2];
					var apellidomat = array[i].split("=")[3];
	
					

  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+nombre+"</center></td>" +
	  				  		"<td><center>"+apellidopat+"</center></td>" +
	  				  	    "<td><center>"+apellidomat+"</center></td>" +
	  				  		'<td><center><button class="btn btn-success" type="button" id="btnVerRendimiento" name="btnVerRendimiento" data-toggle="modal" data-target="#myModalRendimiento">Ver Rendimiento</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
//////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnVerRendimiento', function(){

	var id   = $(this).closest('tr').find("td").filter(":eq(0)").text();
	var sec  = $('#selectSeccion').val().trim();
	var cur  = $('#selectCurso').val().trim();
	var anio = $('#selectAnio').val().trim();
	var dni  = $('#txtdni').val().trim();
	var per = 1;
	
$.ajax({
		
		type: 'POST',
        url: '<%=request.getContextPath()%>/notasPorAlumno',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio,
			idAlumno : id,
			idDocente : dni
			
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else
			{
				for (var i = 0; i < array.length - 1; i++) 
				{
					var p1 = array[i].split("/")[0];
					var p2 = array[i].split("/")[1];
					var p3 = array[i].split("/")[2];
					var t1 = array[i].split("/")[3];
					var t2 = array[i].split("/")[4];
					var t3 = array[i].split("/")[5];
					var ex1 = array[i].split("/")[6];
					var ex2 = array[i].split("/")[7];	
						
				}
				
				var canvas = document.getElementById("Rendimiento").getContext('2d');
				
				window.bar = new Chart(canvas, {
					
					type : 'line',
		 	 		data : {
		 	 			labels : ["PC1", "PC2", "PC3", "Tarea1", "Tarea2", "Tarea3", "Examen 1", "Examen 2"],
		 	 			datasets : [{
		 	 				label : "Bimestre1",
		 	 				data : [p1, p2, p3, t1, t2, t3, ex1, ex2],
		 	 				borderWidth : 4,
		 	 				borderColor :  'green',
		 	 				backgroundColor : 'transparent',
		 	 			    pointBorderColor: 'blue',
		 	 			}]
		 	 		},
					
				});
       		}
	
        }
	});
	
});
//////////////////////////////////////////////
</script>
</body>
</html>