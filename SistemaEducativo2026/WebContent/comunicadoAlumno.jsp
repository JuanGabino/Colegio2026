<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
 	<link rel="icon" href="Imagenes/insignia2026.png" type="image/png">
 	<title>Comunicado Alumno</title>
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

<br><br><br><br>
<div class="container-row">   
  
  <div class="col-md-2">
  </div>
   
  <div class="col-md-8" id="contenido">
    	<div class="row">
    		<div class="panel panel-default">
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><strong><img src="Imagenes/lista.png" height="40" width="50">LISTA DE COMUNICADOS</strong></h4>
   				</div>
   				<div class="panel-body">
   					<div class="row">
   						<div class="col-md-4">
   							<h4><strong>Hijos:</strong></h4>
         					<select class="form-control selectSeccion" id="selectSeccion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	     					</select>
   						</div>
   						<div class="col-md-4">
   							<h4><strong>DNI Padre:</strong></h4>
         					<input type="text" class="form-control" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" disabled>
   						</div>
   						<div class="col-md-4" id="divBuscarComunicado">
   							<br><br>
	    					<button type="button" class="btn btn-primary" id="btnBuscarComunicado"> Buscar Comunicados</button>
   						</div>
   						<div class="col-md-4">
   							<input type="hidden"   id="txtcodPadre" name="txtcodPadre" value="">
   						</div>
   					</div>
   					<br><br>
   					<form action="<%=request.getContextPath()%>/ReportePDF" method="post">
   					<div class="table-responsive" id="divTablaComunicados">		
           						<table id="Table" class="table">
            						<thead style="background-color: #284C61;  color: white;">
             							<tr>
              								<th><center>IdComunicado</center></th>
              								<th><center>Fecha Registro</center></th>
              								<th><center>Descripción</center></th>
              								<th><center>Título</center></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumno"> 
	              
            						</tbody>
           						</table>
           						<input type="hidden" id="idcomunicado" name="idcomunicado">
      				</div>
      				</form>
   				</div>
    		</div>
    	</div>
  </div>
</div>


<script type="text/javascript">
///////////////////////////////////////////////////
//////////////////////////////////////////////
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/BuscarAlumnoPadre',
	    data: {
	    	
	    	dni : numdni
	    },
		success: function(data)
        { 
			$('#selectSeccion').empty();
        	$('#selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split("$");
        	for (var i=0;i<var1.length-1;i++) {
        		var codigo=var1[i].split("/")[0];
			    var nombre=var1[i].split("/")[1];
			    var paterno=var1[i].split("/")[2];
			    var materno=var1[i].split("/")[3];
			    
				    $('#selectSeccion').append('<option value="'+codigo+'">'+nombre+" "+paterno+" "+materno+'</option>');
			}
			
        }
	});	
});
///////////////////////////////////////////////
$('#divBuscarComunicado').on('click', '#btnBuscarComunicado', function(){
	
	var sec = $('#selectSeccion').val().trim();
	
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione un Alumno");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/BuscarComunicadoAlumno',
        data : {
        	codigo: sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			var vacio = "";
			if(data == vacio){
				alert("No hay registro de Comunicados");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var descripcion = array[i].split("/")[1];
					var fecha = array[i].split("/")[2];
					var tipo = array[i].split("/")[3];
	
					
  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+tipo+"</center></td>" +
	  				  		"<td><center>"+descripcion+"</center></td>" +
	  				  		"<td><center>"+fecha+"</center></td>" +
	  				  		'<td><center><button type="button" class="btn btn-success" id="btnModificarComunicado" name="btnModificarComunicado" data-toggle="modal" data-target="#myModal1">Entregado</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
</script>
</body>
</html>