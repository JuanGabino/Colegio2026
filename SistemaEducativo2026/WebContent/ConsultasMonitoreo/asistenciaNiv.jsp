<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Consulta Asistencia Nivelacion</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	 
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
			<li><a href="consultaDestacados.jsp" ><img src="../Imagenes/registro.ico" height="30" width="30"><strong>Seguimiento Destacados</strong></a></li>
			<!-- <li><a href="consultaNivelacion.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Seguimiento Nivelación</strong></a></li>-->
			<li><a href="asistenciaNiv.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Control Asistencia</strong></a></li>
			<li><a href="consultaSesion.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Consulta de Sesiones</strong></a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<div class="container-row">
	
  <div class="col-md-2">
  </div>
   
  <div class="col-md-8">
  	<div class="row">
    		<div class="panel panel-default">
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Control y Monitoreo Asistencia Reforzamiento</strong></h4>
   				</div>
   				<div class="panel-body">
   					
   					<div class="row">
   	 					<div class="col-md-4" id="divDocenteDni" >               
                             <h4><strong>Docente:</strong></h4>
         					 <select class="form-control selectDocente" id="selectDocente" onchange="mostrarNombre(this.options[this.selectedIndex].innerHTML); mostrarValor(this.value);">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	     					 </select>
	     					 <input type="hidden" id="docente" name="docente">
	     					 <input type="hidden" id="nomdocente" name="nomdocente">
                        </div>
                        <div class="col-md-4" id="divSeccion" >               
                             <h4><strong>Sección:</strong></h4>
         					 <select class="form-control selectSeccion" id="selectSeccion" onchange="mostrarNombre1(this.options[this.selectedIndex].innerHTML); mostrarValor1(this.value);">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	     					 </select>
	     					 <input type="hidden" id="seccion" name="seccion">
	     					 <input type="hidden" id="nomseccion" name="nomseccion">
                        </div>
   	 				</div><br>
   	 				
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Grupo de Nivelación: </strong></h4>
   	 						<select class="form-control selectNivelacion" id="selectNivelacion" name="selectNivelacion" onchange="mostrarNombre2(this.options[this.selectedIndex].innerHTML); mostrarValor2(this.value);">
   	 							<option value="" selected disabled hidden>--Seleccionar--</option>
   	 						</select>
   	 						<input type="hidden" id="nivelacion" name="nivelacion">
	     					 <input type="hidden" id="nomnivelacion" name="nomnivelacion">
   	 					</div>
   	 					<div class="col-md-4">               
                             <h4><strong>Mes:</strong></h4>
         					 <select class="form-control selectMes" id="selectMes">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="1">Enero</option>
		   							<option value="2">Febrero</option>
		   							<option value="3">Marzo</option>
		   							<option value="4">Abril</option>
		   							<option value="5">Mayo</option>
		   							<option value="6">Junio</option>
		   							<option value="7">Julio</option>
		   							<option value="8">Agosto</option>
		   							<option value="9">Septiembre</option>
		   							<option value="10">Octubre</option>
		   							<option value="11">Noviembre</option>
		   							<option value="12">Diciembre</option>  					
	     					 </select>
                        </div>
                        <div class="col-md-4">               
                             <h4><strong>Año:</strong></h4>
         					 <select class="form-control selectAno" id="selectAno">
		   							<option value="" selected disabled hidden>--Seleccionar Año--</option>
		   							<option value="2018">2018</option>
		   							<option value="2019">2019</option>
		   							<option value="2020">2020</option>				
	     					 </select>
                        </div>
                    </div> 
                    
                    <div class="row">
                    	<div class="col-md-4" id="divBuscarAlumnos">
                        	<br><br> 
                        	<button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning" >
							    	<img src="../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar
							</button><br><br>
                        </div>
                    </div>
                    <hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
                    <div class="row">
                    	<div class="col-md-4">
   	 						<h4><strong>Clases de Nivelación: </strong></h4>
   	 						<select class="form-control selectClases" id="selectClases" name="selectClases" >
   	 							<option value="" selected disabled hidden>--Seleccionar--</option>
   	 						</select>
   	 						<input type="hidden" id="idclase" name="idclase">
	     					<input type="hidden" id="nomclase" name="nomclase">
   	 					</div>
   	 					<div class="col-md-4" id="divBuscarAsistencia">
   	 						<br><br>
                        	<button id ="btnAsistencia" name="btnAsistencia" type="button" class="btn btn-success">
							    	<img src="../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar Asistencias
							</button><br><br>
                        </div>
                    </div>
                    <br>
                    <div class="row table-responsive" id="scroll">
   	 					<table class="table table-hover table-bordered" id="table_asistencia">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">A. Paterno</th>
											<th style="text-align: center;">A. Materno</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Fecha</th>
											<th style="text-align: center;">Asignatura</th>
											<th style="text-align: center;">Tema</th>
											<th style="text-align: center;">Estado</th>
										</tr>
									</thead>
									<tbody id="tbl_asistencia">
	
									</tbody>
						</table>
   	 				</div>
   	 				
   				</div>
   			</div>
   	</div>
  </div>
  
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
////////////////////////////////////////////////////
var mostrarValor = function(x){
    
	document.getElementById('docente').value=x;
}
var mostrarValor1 = function(x){
    
	document.getElementById('seccion').value=x;
}
var mostrarValor2 = function(x){
    
	document.getElementById('nivelacion').value=x;
}
var mostrarNombre = function(x){
    
	document.getElementById('nomdocente').value=x;
}
var mostrarNombre1 = function(x){
    
	document.getElementById('nomseccion').value=x;
}
var mostrarNombre2 = function(x){
    
	document.getElementById('nomnivelacion').value=x;
}
//////////////////////////////////////////////////////
$(document).ready(function(){

	$.ajax({
		
		type: 'POST', 
		url:  '<%=request.getContextPath()%>/ListarDocentes',
		success: function(data)
        {
			$('#selectDocente').empty();
        	$('#selectDocente').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split("$");
        	for (var i=0;i<var1.length-1;i++) {
        		var codigo = var1[i].split("|")[0];
			    var nombre = var1[i].split("|")[2];
			    var pat    = var1[i].split("|")[3];
			    var mat    = var1[i].split("|")[4]; 
				    $('#selectDocente').append('<option value="'+codigo+'">'+nombre+" "+pat+" "+mat+" "+'</option>');
			}

        }
	});
	
	///////////////////////////////////////
	
	$('#divDocenteDni').on('change', '#selectDocente', function(){
		
        if ( $(this).children(":selected").val() === "" ) 
        {
              $('.selectSeccion option').remove();
              $('.selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        }
        else 
        {
        	$('.selectSeccion option').remove();
        	$.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/ListarDocenteSeccion',
                data: { 
                	
		        	codigo: $('#selectDocente').val()
		        },
                success: function(data)
            	{
       				$('.selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
               			var var1=data.split("$");
	           			for (var i=0;i<var1.length-1;i++) 
	           			{
			    			var valor=var1[i].split("/")[0];
			    			var descr=var1[i].split("/")[1];
 			    			$('.selectSeccion').append('<option value="'+valor+'">'+descr+'</option>');
						}
         		}
     		});   
     	}
	});
	
	//////////////////////////////////////////////////////////////
	$('#divSeccion').on('change', '#selectSeccion', function(){
		
        if ( $(this).children(":selected").val() === "" ) 
        {
              $('.selectNivelacion option').remove();
              $('.selectNivelacion').append('<option value="'+""+'">--Seleccionar--</option>');
        }
        else 
        {
        	$('.selectNivelacion option').remove();
        	$.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/ListarNivelacionDocente',
                data: { 
                	
		        	docente: $('#selectDocente').val(),
		        	seccion: $('#selectSeccion').val()
		        },
                success: function(data)
            	{
       				$('.selectNivelacion').append('<option value="'+""+'">--Seleccionar--</option>');
               			var var1=data.split("$");
	           			for (var i=0;i<var1.length-1;i++) 
	           			{
			    			var valor=var1[i].split("/")[0];
			    			var descr=var1[i].split("/")[1];
 			    			$('.selectNivelacion').append('<option value="'+valor+'">'+descr+'</option>');
						}
         		}
     		});   
     	}
	});
	//////////////////////////////////////////////////////
});
/////////////////////////////////////////////////////////// 
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var grupo = $("#selectNivelacion").val();
	var mes  = $("#selectMes").val();
	var anio = $("#selectAno").val();
	
	$.ajax({
		
		type: 'POST', 
		url:  '<%=request.getContextPath()%>/ListarClaseNivelacion',
		data: { 
        	
        	nivelacion: grupo,
        	mes: mes,
        	anio: anio
        },
		success: function(data)
        {
			$('#selectClases').empty();
        	$('#selectClases').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split("$");
        	for (var i=0;i<var1.length-1;i++) {
        		var codigo = var1[i].split("/")[0];
			    var fecha  = var1[i].split("/")[1]; 
				    $('#selectClases').append('<option value="'+codigo+'">'+fecha+'</option>');
			}

        }
	});
	
	
});
//////////////////////////////////////////////////////
$('#divBuscarAsistencia').on('click', '#btnAsistencia', function(){
	
	var clase = $("#selectClases").val();
	
$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarAsistenciaNivelacion',
	    data: {
	    	
	    	clase: clase
	    },
		success: function(data)
        { 
			if(data == "vacio"){
				
				alert("No hay registro de asistencia");
				$('#tbl_asistencia').empty(); 
			}
			else{
        	  var array = data.split("$");
        	  $('#tbl_asistencia').empty();
        	  var j = 1;
        	  for (var i = 0; i < array.length - 1; i++) {
				var codigo   = array[i].split("|")[0];
				var nombre   = array[i].split("|")[1];
				var paterno  = array[i].split("|")[2];
				var materno  = array[i].split("|")[3];
				var dni      = array[i].split("|")[4];
				var fecha 	 = array[i].split("|")[5];
				var asignatura 	 	 = array[i].split("|")[6];
				var tema 	 	 = array[i].split("|")[7];
				var estado 	 	 = array[i].split("|")[8];
				
				$('#tbl_asistencia').append("<tr>" +
				    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+codigo+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+paterno+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+materno+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>"+
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+fecha+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+asignatura+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+tema+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+estado+"</center></td>" +
				    "</tr>");
	
				 j++;
			  }
			}
        }
		
	})
});
</script>
</body>
</html>