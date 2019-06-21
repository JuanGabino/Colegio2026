<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Comunicado Nivelacion</title>
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
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>LISTA DE ALUMNOS</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-3" id="divCurso">
           					<h4><strong>Curso:</strong></h4>
           					<select class="form-control selectCurso" id="selectCurso">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select>
	     				</div>
   	 					<div class="col-md-3">
           					<h4><strong>Seccion:</strong></h4>
           					<select class="form-control selectSeccion" id="selectSeccion" name="selectSeccion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	       					<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	       					<input type="hidden" id="txtcodDocente" name="txtcodDocente" class="form-control" value="" disabled>
	     				</div>
	     				<div class="col-md-3">
	     					<h4><strong>Año:</strong></h4>
           					<select class="form-control selectAnio" id="selectAnio">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	     				</div>
	     				<div class="col-md-3">
	     						<h4><strong>Periodo: </strong></h4>
	   	 		 				<select class="form-control selectPeriodo" id="selectPeriodo">
	   	 		 						<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 				</select><br>
	     				</div>
	     			</div><br><br>
   	 				<div class="row">
   	 					<div class="col-md-3">
   	 						<button class="btn btn-success form-control" id="btnBuscar" name="btnBuscar">Buscar</button>
   	 					</div>
   	 					<div class="col-md-3">
   	 						<button class="btn btn-primary form-control" id="btnCirculo" name="btnCirculo" >Circulo de Estudio</button>
   	 					</div>
   	 					<div class="col-md-3">
   	 						<button class="btn btn-danger form-control" id="btnNivelacion" name="btnNivelacion">Nivelación</button>
   	 					</div>
   	 				</div>
   	 				<br><br>
   	 				<div class="row">
   	 					<div class="table-responsive" id="tablaAlumnos">
  							<table class="table table-bordered" id="Table">
            						<thead>
             							<tr>
              								<th><center>IDALUMNO</center></th>
              								<th><center>NOMBRE</center></th>
              								<th><center>APELLIDO PATERNO</center></th>
              								<th><center>APELLIDO MATERNO</center></th>
              								<th><center>PROGRESO</center></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumno"> 
	              
            						</tbody>
           					</table>
      					</div>
   	 				</div>
   	 			</div>	
    		</div>
   		</div>
  	</div>
</div>

<!-- MODAL CIRCULO DE ESTUDIO -->
<div id="myModal2" class="modal fade" role="dialog">
 	<div class="modal-dialog">
 		
 		<div class="modal-content">
 		
 			<!-- CABECERA MODAL -->
      		<div class="modal-header" style="background-color: #213758;">
        		<button type="button" class="close" data-dismiss="modal" >&times;</button>
        		<h4 class="modal-title" style="color: white;"><strong>GENERAR CIRCULO DE ESTUDIO</strong></h4>
      		</div>
      		
      		<!-- CUERPO MODAL -->
      		<div class="modal-body"  id="cuerpoModal">
      			<div class="row">
      				<div class="col-md-6">
      					<h5><strong>Nombre del Círculo: </strong></h5>
      					<input class="form-control" type="text" id="txtnombre" name="txtnombre">
      				</div>
      				<div class="col-md-6">
      					<h5><strong>Fecha: </strong></h5>
      					<input type="text" class="form-control" name="fecha" id="fecha" disabled>
      				</div>
      			</div><br><br>
      			<div class="row" id="tb_sem">
      				<table class="table" id="table_semana">
                           <thead>
                              <tr id="tr1">
                                   <th>Lunes</th>
                                   <th>Martes</th>
                                   <th>Miércoles</th>
                                   <th>Jueves</th>
                                   <th>Viernes</th>
                                   <th>Sábado</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                <td><input type="checkbox" onclick="check1(this)" value="Lunes" id="1"   name="1"><label for="1"></label></td>
                                <td><input type="checkbox" onclick="check2(this)" value="Martes" id="2"  name="2"><label for="2"></label></td>
                                <td><input type="checkbox" onclick="check3(this)" value="Miercoles" id="3" name="3"><label for="3"></label></td>
                                <td><input type="checkbox" onclick="check4(this)" value="Jueves" id="4"  name="4"><label for="4"></label></td>
                                <td><input type="checkbox" onclick="check5(this)" value="Viernes" id="5" name="5"><label for="5"></label></td>
                                <td><input type="checkbox" onclick="check6(this)" value="Sabado" id="6"  name="6"><label for="6"></label></td>
                             </tr>
                          </tbody>
                    </table>
      			</div>
      			<div class="row">
                    <div class="col-md-6">
                         <h5><strong>Hora Inicio</strong></h5>
                         <input type="time" class="form-control" id="timepicker1" name="timepicker1">
                    </div>
                    <div class="col-md-6">
                         <h5><strong>Hora Fin</strong></h5>
                         <input type="time" class="form-control" id="timepicker2" name="timepicker2">
                    </div>
                </div>
      			<br><br><br>
      			<div class="row">
      				<div class="col-md-2"></div>
      				<div class="col-md-8">
      					<button class="btn btn-success form-control" id="btnRegistrarCirculo" name="btnRegistrarCirculo">Registrar Círculo de Estudio</button>
      				</div>
      				<div class="col-md-2"></div>
      			</div>
      			<div>
      			</div>
      		</div>
      		
       </div>
 	</div>
</div>

<!-- MODAL NIVELACION DE ESTUDIO -->
<div id="myModal3" class="modal fade" role="dialog">
 	<div class="modal-dialog">
 		
 		<div class="modal-content">
 		
 			<!-- CABECERA MODAL -->
      		<div class="modal-header" style="background-color: #213758;">
        		<button type="button" class="close" data-dismiss="modal" >&times;</button>
        		<h4 class="modal-title" style="color: white;"><strong>GENERAR GRUPO DE NIVELACIÓN</strong></h4>
      		</div>
      		
      		<!-- CUERPO MODAL -->
      		<div class="modal-body"  id="cuerpoModal">
      			<div class="row">
      				<div class="col-md-6">
      					<h5><strong>Descripción del Grupo de Estudio: </strong></h5>
      					<input class="form-control" type="text" id="txtdescripcion" name="txtdescripcion">
      				</div>
      				<div class="col-md-6">
      					<h5><strong>Fecha: </strong></h5>
      					<input type="text" class="form-control" name="fechaCreacion" id="fechaCreacion" disabled>
      				</div>
      			</div><br><br>
      			<div class="row" id="tb_sem2">
      				<table class="table" id="table_semana2">
                           <thead>
                              <tr id="tr2">
                                   <th>Lunes</th>
                                   <th>Martes</th>
                                   <th>Miércoles</th>
                                   <th>Jueves</th>
                                   <th>Viernes</th>
                                   <th>Sábado</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                <td><input type="checkbox" onclick="check1(this)" value="Lunes" id="1"   name="1"><label for="1"></label></td>
                                <td><input type="checkbox" onclick="check2(this)" value="Martes" id="2"  name="2"><label for="2"></label></td>
                                <td><input type="checkbox" onclick="check3(this)" value="Miercoles" id="3" name="3"><label for="3"></label></td>
                                <td><input type="checkbox" onclick="check4(this)" value="Jueves" id="4"  name="4"><label for="4"></label></td>
                                <td><input type="checkbox" onclick="check5(this)" value="Viernes" id="5" name="5"><label for="5"></label></td>
                                <td><input type="checkbox" onclick="check6(this)" value="Sabado" id="6"  name="6"><label for="6"></label></td>
                             </tr>
                          </tbody>
                    </table>
      			</div>
      			<div class="row">
                    <div class="col-md-6">
                         <h5><strong>Fecha de Inicio</strong></h5>
                         <div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechainicio" name="fechainicio">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 </div>
                    </div>
                    <div class="col-md-6">
                         <h5><strong>Fecha de Finalización</strong></h5>
                         <div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechafin" name="fechafin">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 </div>
                    </div>
                </div>
      			<div class="row">
                    <div class="col-md-6">
                         <h5><strong>Hora Inicio</strong></h5>
                         <input type="time" class="form-control" id="timepicker3" name="timepicker3">
                    </div>
                    <div class="col-md-6">
                         <h5><strong>Hora Fin</strong></h5>
                         <input type="time" class="form-control" id="timepicker4" name="timepicker4">
                    </div>
                </div>
                <div class="row">
                	<div class="container-fluid">
                		 <h5><strong>Comunicado: </strong></h5>
                         <textarea name="comment" rows=5 cols=70 id="texto" name="texto" placeholder="Escriba el comunicado"></textarea>
        			</div>
                </div>
      			<br><br>
      			<div class="row">
      				<div class="col-md-2"></div>
      				<div class="col-md-8">
      					<button class="btn btn-success form-control" id="btnRegistrarNivelacion" name="btnRegistrarNivelacion">Registrar Grupo de Nivelación</button>
      				</div>
      			</div>
      		</div>
      		
       </div>
 	</div>
</div>
<!-- FIN MODAL -->

<!-- MODAL 2 - PROGRESO -->
<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

   			<!-- Modal content-->
    		<div class="modal-content">
    		
    			<!-- CABECERA -->
      			<div class="modal-header" style="background-color: #213758;">
        			<button type="button" class="close" data-dismiss="modal" >&times;</button>
        			<h4 class="modal-title" style="color: white;"><strong>PROGRESO DEL CURSO POR ALUMNO</strong></h4>
      			</div>	
      			
      			<!-- CUERPO -->									
      			<div class="modal-body"  id="exportContent">
        			<div class="row">
      			 		<div class="col-md-4">
        					<h5><strong>Codigo Alumno:</strong></h5>
        					<input class="form-control" type="text" id="codAlum" name="codAlum" value="" disabled>
       					</div>
      				</div>	
      														
      				<div class="row">
      					<div class="col-md-4">
        					<h5><strong>Nombre:</strong></h5>
        					<input  class="form-control" type="text" id="nombre" name="nombre" value="" disabled>
       					</div>
       					<div class="col-md-4">
        					<h5><strong>Apellido Paterno:</strong></h5>
        					<input class="form-control" type="text" id="apellidoPat" name="apellidoPat" value="" disabled>
       					</div>
       					<div class="col-md-4">
        					<h5><strong>Apellido Materno:</strong></h5>
        					<input class="form-control" type="text" id="apellidoMat" name="apellidoMat" value="" disabled>
       					</div>
      				</div><br>
      				<div class="row" id="divRendimiento">
               			<br>
               			<canvas id="Rendimiento"></canvas>
                	</div><br>
      		    </div><br>
      		    
      		    <!-- FOOTER -->
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			</div>
    	    </div>
  		</div>
</div>
<!-- FIN MODAL-->

<!-- SCRIPT GRAFICO -->
<script src="<%=request.getContextPath()%>/dist/Chart.bundle.min.js"></script>		

<script type="text/javascript">
	n =  new Date();
	//Año
	y = n.getFullYear();
	//Mes
	m = n.getMonth() + 1;
	//Día
	d = n.getDate();

	//Lo ordenas a gusto.
	document.getElementById("fecha").value = d + "/" + m + "/" + y;
	document.getElementById("fechaCreacion").value = d + "/" + m + "/" + y; 
</script>
<script type="text/javascript">
////////////////////////////////////////////////////
$(document).ready(function(){
	var numdni = $("#txtdni").val();
	$.ajax({
		
		type: 'POST',
		url:  '<%=request.getContextPath()%>/BuscarDocentexDni',
		data: {
		    	
		    	dni : numdni
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
			
			document.getElementById("txtcodDocente").value = codigo;
        }
	});
});
////////////////////////////////////////////////
function check1(box) 
{
	if (box.checked) 
	{
		document.getElementById("2").checked=false
		document.getElementById("3").checked=false
		document.getElementById("4").checked=false
		document.getElementById("5").checked=false
		document.getElementById("6").checked=false
	}
}
function check2(box) 
{
	if (box.checked) 
	{
		document.getElementById("1").checked=false
		document.getElementById("3").checked=false
		document.getElementById("4").checked=false
		document.getElementById("5").checked=false
		document.getElementById("6").checked=false
	}
}
function check3(box) 
{
	if (box.checked) 
	{
		document.getElementById("1").checked=false
		document.getElementById("2").checked=false
		document.getElementById("4").checked=false
		document.getElementById("5").checked=false
		document.getElementById("6").checked=false
	}
}
function check4(box) 
{
	if (box.checked) 
	{
		document.getElementById("1").checked=false
		document.getElementById("2").checked=false
		document.getElementById("3").checked=false
		document.getElementById("5").checked=false
		document.getElementById("6").checked=false
	}
}
function check5(box) 
{
	if (box.checked) 
	{
		document.getElementById("1").checked=false
		document.getElementById("2").checked=false
		document.getElementById("3").checked=false
		document.getElementById("4").checked=false
		document.getElementById("6").checked=false
	}
}
function check6(box) 
{
	if (box.checked) 
	{
		document.getElementById("1").checked=false
		document.getElementById("2").checked=false
		document.getElementById("3").checked=false
		document.getElementById("4").checked=false
		document.getElementById("5").checked=false
	}
}
//////////////////////////////////////////////////////////
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
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
	
	$('#divCurso').on('change', '#selectCurso', function(){
		
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
                url: '<%=request.getContextPath()%>/ListarSeccionxCurso',
                data: { 
                	
		        	curso: $('#selectCurso').val(),
		        	dni: numdni
		        },
                success: function(data)
            	{
       				$('.selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
               			var var1=data.split(":");
	           			for (var i=0;i<var1.length-1;i++) 
	           			{
			    			var valor=var1[i].split("-")[0];
			    			var descr=var1[i].split("-")[1];
 			    			$('.selectSeccion').append('<option value="'+valor+'">'+descr+'</option>');
						}
         		}
     		});   
     	}
});
	
});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#selectCurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione una Sección");
	
	}
	if(cur == vacio)
	{
		alert("Seleccione un Curso");
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarProgresoAlumno',
        data : {
			seccion : sec,
			curso   : cur,
			periodo : per,
			anio    : anio
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var nombre = array[i].split("/")[1];
					var apellidopat = array[i].split("/")[2];
					var apellidomat = array[i].split("/")[3];
					var promedio    = array[i].split("/")[4];
					

  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+nombre+"</center></td>" +
	  				  		"<td><center>"+apellidopat+"</center></td>" +
	  				  	    "<td><center>"+apellidomat+"</center></td>" +
	  				  		//"<td><meter style='width:150px; margin: 0 auto;' value='" +promedio+"' max='20' low='10.49' high='16' optimum='20'></meter></td>"+
	  				  		'<td><center><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnProgreso">Nivel de Progreso</button></center></td>'+
  				  			'<td><center><input type="checkbox" id="alumcheckbox" name="alumcheckbox" ></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
//////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnCirculo', function(){

	var sec = $('#selectSeccion').val().trim();
	var cur = $('#selectCurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var vacio = "";
	
	if(sec == vacio && cur == vacio && per == vacio && anio == vacio)
	{
		alert("Falta completar uno o varios campos obligatorio: Sección, Curso, Periodo, Año");
	}
	else if( $("input[name=alumcheckbox]").is(":checked")) {
	    
		$('#myModal2').modal();
	}
	else
	{
		alert("Seleccione al menos un alumno para el círculo de estudio");	
	}
});
////////////////////////////////////////////////////////////////////
$('#btnRegistrarCirculo').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.seccion       = $('#selectSeccion').val().trim();
	item.curso         = $('#selectCurso').val().trim();
	item.anio          = $('#selectAnio').val().trim();
	item.descripcion   = $('#txtnombre').val().trim(); 
	item.fecha         = $('#fecha').val().trim();
	item.txtdni        = $('#txtcodDocente').val().trim();
	$('#tb_sem :checked').each(function() {	
		var dia = $(this).val();
		item.dia       = dia
	});
	item.inicio        = $('#timepicker1').val();
	item.fin           = $('#timepicker2').val();
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#txtnombre').val() != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarCirculoEstudio',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se creo un círculo de estudio");
	    		 registrarDetalleCirculo();
	    		 document.getElementById("txtnombre").value = "";
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE CREO CÍRCULO DE ESTUDIO");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione un Nombre para el Círculo de Estudio");
	}
		
});
////////////////////////////////////////////////////////////////
function registrarDetalleCirculo(){
	
	 var linea1 = [];
	   $("input[id=alumcheckbox]:checked").each(function(el) { 
		 
		 var itemDetalle = {};
		 var tds = $(this).find("td");
		 
		 itemDetalle.idAlumno = $(this).closest('tr').find("td").filter(":eq(0)").text();
			
		 linea1.push(itemDetalle);
	  }); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarDetalleCirculo',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("SE REGISTRO A LOS ALUMNOS SELECCIONADOS AL CIRCULO");
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE PUDO REGISTRAR A LOS ALUMNOS AL CIRCULO, INTENTE DE NUEVO");
	    	 }
		   }
		 
		 
	 	});
	 
	
};
////////////////////////////////////////////////////////////////
$('#divAlumnos').on('click', '#btnNivelacion', function(){

	var sec = $('#selectSeccion').val().trim();
	var cur = $('#selectCurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var vacio = "";
	
	if(sec == vacio && cur == vacio && per == vacio && anio == vacio)
	{
		alert("Falta completar uno o varios campos obligatorio: Sección, Curso, Periodo, Año");
	}
	else if( $("input[name=alumcheckbox]").is(":checked")) {
	    
		$('#myModal3').modal();
	}
	else
	{
		alert("Seleccione al menos un alumno para el grupo de nivelación");	
	}
});
//////////////////////////////////////////////////////
$('#btnRegistrarNivelacion').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.seccion       = $('#selectSeccion').val().trim();
	item.curso         = $('#selectCurso').val().trim();
	item.periodo       = $('#selectPeriodo').val().trim();
	item.anio          = $('#selectAnio').val().trim();
	item.descripcion   = $('#txtdescripcion').val().trim(); 
	item.txtdni        = $('#txtcodDocente').val().trim();
	$('#tb_sem2 :checked').each(function() {	
		var dia = $(this).val();
		item.dia       = dia
	});
	item.inicio        = $('#timepicker3').val();
	item.fin           = $('#timepicker4').val();
	item.fechaInicio   = $('#fechainicio').val();
	item.fechaFin      = $('#fechafin').val();
	item.fechaCreada   = $('#fechaCreacion').val();
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#txtdescripcion').val() != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarNivelacion',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("SE CREO GRUPO DE NIVELACIÓN");
	    		 registrarDetalleNivelacion();
	    		 registrarComunicadoNivelacion();
	    		 document.getElementById("txtdescripcion").value = "";
	    		 document.getElementById("fechainicio").value = "";
	    		 document.getElementById("fechafin").value = "";
	    		 document.getElementById("timepicker3").value = "";
	    		 document.getElementById("timepicker4").value = "";
	    		 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE CREO EL GRUPO DE NIVELACIÓN");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione un Nombre para el GRUPO de Estudio");
	}
		
});
////////////////////////////////////////////////////////////
function registrarDetalleNivelacion(){
	
	 var linea1 = [];
	   $("input[id=alumcheckbox]:checked").each(function(el) { 
		 
		 var itemDetalle = {};
		 var tds = $(this).find("td");
		 
		 itemDetalle.idAlumno = $(this).closest('tr').find("td").filter(":eq(0)").text();
			
		 linea1.push(itemDetalle);
	  }); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarDetalleNivelacion',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("SE REGISTRO A LOS ALUMNOS SELECCIONADOS AL GRUPO DE NIVELACIÓN");
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE PUDO REGISTRAR A LOS ALUMNOS AL GRUPO DE NIVELACIÓN, INTENTE DE NUEVO");
	    	 }
		   }
		 
		 
	 	});

};
/////////////////////////////////////////////////////////////////
function registrarComunicadoNivelacion(){
	
	var tipo = "Nivelacion";
	var linea = [];
	var item = {};
	
	item.texto         = $('#texto').val().trim();
	item.selectTipo    = tipo;
	item.fecha         = $('#fechaCreacion').val();
	item.selectSeccion = $('#selectSeccion').val();
	item.txtdni        = $('#txtcodDocente').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( tipo != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarComunicado',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 registrarDetalleComunicado();
	    		 document.getElementById("texto").value = "";
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE REGISTRO COMUNICADO");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione un Tipo de Reunion");
	}
};
////////////////////////////////////////////////////////////////
function registrarDetalleComunicado(){
	
	 var linea1 = [];
	   $("input[id=alumcheckbox]:checked").each(function(el) { 
		 
		 var itemDetalle = {};
		 var tds = $(this).find("td");
		 
		 itemDetalle.idAlumno = $(this).closest('tr').find("td").filter(":eq(0)").text();
			
		 linea1.push(itemDetalle);
	  }); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarDetalleComunicado',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("EL COMUNICADO FUE MANDADO A LOS ALUMNOS");
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE PUDO MANDAR EL COMUNICADO A LOS ALUMNOS, INTENTE DE NUEVO");
	    	 }
		   }
		 
		 
	 	});
	 
	
};
////////////////////////////////////////////////////////////////
$('#tablaAlumnos').on('click', '#btnProgreso', function(){

	var id   = $(this).closest('tr').find("td").filter(":eq(0)").text();
	var sec  = $('#selectSeccion').val().trim();
	var cur  = $('#selectCurso').val().trim();
	var anio = $('#selectAnio').val().trim();
	var per = 1;
	
	var idalum ="";
	var nombre = "";
	var apellidoPat = "";
	var apellidoMat = "";
	
    idalum      = $(this).closest('tr').find("td").filter(":eq(0)").text();
    nombre      = $(this).closest('tr').find("td").filter(":eq(1)").text();
    apellidoPat = $(this).closest('tr').find("td").filter(":eq(2)").text();
    apellidoMat = $(this).closest('tr').find("td").filter(":eq(3)").text();
    
    document.getElementById("codAlum").value = idalum;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellidoPat").value = apellidoPat;
    document.getElementById("apellidoMat").value = apellidoMat;
	
$.ajax({
		
		type: 'POST',
        url: '<%=request.getContextPath()%>/notasPorAlumno',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio,
			idAlumno : id
			
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
				
				var datos = {
		 	 			
		 	 			labels : ["PC1", "PC2", "PC3", "Tarea1", "Tarea2", "Tarea3", "Examen 1", "Examen 2"],
		 	 			datasets : [{
		 	 				label : "Bimestre1",
		 	 				backgroundColor : "rgba(88, 196, 88)",
		 	 				data : [p1, p2, p3, t1, t2, t3, ex1, ex2]
		 	 			}] 			
		 	 	};
				
				var canvas = document.getElementById("Rendimiento").getContext('2d');
				
				window.bar = new Chart(canvas, {
		 	 		type : "bar",
		 	 		data : datos,
		 	 		options : {
		 	 		 elements :{
		 	 			rectangle : {
		 	 				borderWidth : 1,
		 	 				borderSkipped : "bottom"
		 	 			}
		 	 		  },
		 	 		  scales: {
		 	 			 xAxes: [{
		 	 	            barPercentage: 0.5
		 	 	        }],
	 	 			      yAxes: [{
	 	 			        ticks: {
	 	 			          beginAtZero: true
	 	 			        }
	 	 			      }]
	 	 			  },
		 	 		  responsive : true,
		 	 		  title : {
		 	 			  display :  true,
		 	 			  text : "Grafica de Notas de Alumnos"
		 	 		  }
		 	 		}	
		 	 	});
       		}
	
        }
	});
	
});
</script>
</body>
</html>