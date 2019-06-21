<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Reporte de Módulo de Padres</title>
	<link rel="icon" href="../../Imagenes/insignia2026.png" type="image/png">
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
	<label for="btn-menu"><img src="../../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../../index.jsp"><img src="../../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="reporteModuloPadres.jsp" ><img src="../../Imagenes/registro.ico" height="30" width="30"><strong>Control de Comunicados</strong></a></li>
			<li><a href="controlObservaciones.jsp"><img src="../../Imagenes/observacion.png"width="30" height="30"><strong>Seguimiento de Observaciones por Alumno</strong></a></li>
			<li><a href="controlAsistencia.jsp"><img src="../../Imagenes/listaComunicado.png" width="30" height="30"><strong>Control de Asistencia</strong></a></li>
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
	  				<h4 style="color: white;"><strong><img src="../../Imagenes/lista.png" height="40" width="50">Reporte de Comunicados</strong></h4>
   				</div>
   				<div class="panel-body">
   				
   					<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni" >               
                             <h4><strong>Docente:</strong></h4>
         					 <select class="form-control selectDocente" id="selectDocente">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	     					 </select>
                        </div>
                        <div class="col-md-6" id="divSeccion" >               
                             <h4><strong>Sección:</strong></h4>
         					 <select class="form-control selectSeccion" id="selectSeccion">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	     					 </select>
                        </div>
   	 				</div><br>
   	 				<div class="row">
                        <div class="col-md-6">               
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
                        <div class="col-md-6" id="divBuscarComunicado">
                        	<br><br>
                        	<button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning" >
							    <img src="../../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar
							</button>
                        </div>
   	 				</div><br>
					
					<form action="<%=request.getContextPath()%>/ReportePDF" method="post">
					<div class="row" id="divComunicados">
						
   	 					<div class="table-responsive">
   	 							<table class="table table-hover" id="table_docente">
									<thead>
										<tr>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Título</th>
											<th style="text-align: center;">Tipo</th>
											<th style="text-align: center;">Fecha</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
									</tbody>
								</table>
						</div>
						<input type="hidden" id="idcomunicado" name="idcomunicado">
					</div>
					</form>
                    	
   				</div>
   			</div>
   		</div>
   	</div>
</div>


<!-- MODAL -->
<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

   			<!-- Modal content-->
    		<div class="modal-content">
    		
    			<!-- CABECERA -->
      			<div class="modal-header" style="background-color: #213758;">
        			<button type="button" class="close" data-dismiss="modal" >&times;</button>
        			<h4 class="modal-title" style="color: white;"><strong>Comunicado</strong></h4>
      			</div>	
      			
      			<!-- CUERPO -->									
      			<div class="modal-body">
        			<div class="row">
   	 					<div class="table-responsive">
   	
   	 							<table class="table" id="table_alumnos">
									<thead>
										<tr>
											<th style="text-align: center;" colsan=2>Estudiante</th>
											<th style="text-align: center;" colsan=2>Padre</th>
										</tr>
									</thead>
									<tbody id="tbl_alumno">
	
									</tbody>
								</table>
						</div>
   	 				</div>
      		    </div><br>
      		    
      		    <!-- FOOTER -->
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			</div>
    	    </div>
  		</div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
/////////////////////////////////////////////
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
	
});
/////////////////////////////////////////////////
$('#divBuscarComunicado').on('click', '#btnBuscar', function(){

	var codigo  = $("#selectDocente").val();
	var seccion = $("#selectSeccion").val();
	var fecha   = $("#selectMes").val();
	
	console.log(codigo + "-" + seccion + "-" + fecha );
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarDocenteComunicado',
	    data: {
	    	
	    	codigo: codigo,
	    	seccion: seccion,
	    	fecha: fecha
	    },
		success: function(data)
        { 
			if(data == "vacio")
			{
				alert("No hay comunicados registrados este mes");
				$('#tbl_docente').empty();
			}
			else{
        	var array = data.split("$");
        	$('#tbl_docente').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo      = array[i].split("/")[0];
				var tipo    = array[i].split("/")[1];
				var fecha 	 = array[i].split("/")[2];
				
				    $('#tbl_docente').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>Comunicado - " + seccion + "</center></td>" +
  				  		"<td><center>"+tipo+"</center></td>"+
  				  		"<td><center>"+fecha+"</center></td>" +
				  		'<td><center><button type="submit" class="btn btn-danger"   id="btnPDF" name="btnPDF" >Descargar Comunicado</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-success"  id="btnVisualizar" name="btnVisualizar" data-toggle="modal" data-target="#myModal" >Visualizar Alumnos</button></center></td>'+				  		
  				  		"</tr>");
				}
			}
        }
	});	
});
////////////////////////////////////////////////////////
$('#divComunicados').on('click', '#btnVisualizar', function(){
	
	var codigo = $(this).closest('tr').find("td").filter(":eq(0)").text();
	console.log(codigo);
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/VisualizarComunicado',
	    data: {
	    	
	    	codigo: codigo
	    },
		success: function(data)
        { 
			
        	var array = data.split("$");
        	$('#tbl_alumno').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo   = array[i].split("/")[0];
				var nombre   = array[i].split("/")[1];
				var paterno  = array[i].split("/")[2];
				var materno  = array[i].split("/")[3];
				var cod      = array[i].split("/")[4];
				var padre 	 = array[i].split("/")[5];
				var pat 	 = array[i].split("/")[6];
				var mat  	 = array[i].split("/")[7];
				
				
				    $('#tbl_alumno').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+nombre+" "+paterno+" "+materno+"</center></td>" +
  				  		"<td><center>"+cod+"</center></td>"+
  				  		"<td><center>"+padre+" "+pat+" "+mat+"</center></td>" +			  		
  				  		"</tr>");
			}
        }
		
	})
	 
});
///////////////////////////////////////////////
$('#divComunicados').on('click', '#btnPDF', function(){
	
	var id = "";
	
	id  = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	document.getElementById("idcomunicado").value = id;
});
</script>
</body>
</html>