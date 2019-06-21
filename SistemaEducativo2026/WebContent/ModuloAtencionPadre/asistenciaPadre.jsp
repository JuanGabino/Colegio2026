<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 	<title>Registrar Padre de Familia</title>
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
			<li><a href="seccionComunicado.jsp" ><img src="../Imagenes/registro.ico" height="30" width="30"><strong>Generar Comunicado</strong></a></li>
			<li><a href="seccionComentario.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Generar Observaciones por Alumno</strong></a></li>
			<li><a href="comentarioObservaciones.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Lista de Comunicados</strong></a></li>
			<li><a href="listaObservaciones.jsp"><img src="../Imagenes/listaObservacion.png" width="30" height="30"><strong>Lista de Observaciones por Alumno</strong></a></li>
			<li><a href="asistenciaPadre.jsp"><img src="../Imagenes/report.png"    height="30" width="30"><strong>Registro de Asistencia a Padres</strong></a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<div class="container-row">  
   <div class="col-md-2">
   </div>
   
   <div class="col-md-8" >
   	 <div class="row">
    	  <div class="panel panel-default">
    	  
    	  	<!-- CABECERA -->
    	  	<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">REGISTRO DE ASISTENCIA - PADRES DE FAMILIA</strong></h4>
   			</div>
   			
   			<!-- CUERPO -->
   			<div class="panel-body">
   				<div class="row">
   						<div class="col-md-4">
   							<h4><strong>Seccion:</strong></h4>
         					<select class="form-control selectSeccion2" id="selectSeccion2">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	     					</select>
   						</div>
   						<div class="col-md-4" id="divBuscarObservacion">
   							<br><br>
	    					<button type="button" class="btn btn-primary" id="btnBuscarObservacion"> Buscar Padres</button>
   						</div>
   						<div class="col-md-4">
   							<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   							<input type="hidden" id="txtcodDocente" name="txtcodDocente" value="" >
   						</div>
   				</div>
   				<br><br>
   				<div class="table-responsive" id="divTableAsistencia">		
   								<input class=form-control id=myInput type=text placeholder=Buscar..>
   								<br>
   								<table id="Table2" class="table">
            						<thead style="background-color: #213758;  color: white;">
             							<tr>
              								<th><center>Codigo Padre</center></th>
              								<th><center>Nombre</center></th>
              								<th><center>Apellido Pat.</center></th>
              								<th><center>Apellido Mat.</center></th>
              								<th><center>Estado</center></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_padres"> 
	              
            						</tbody>
           						</table>
   				</div>
   			</div>
    	  </div>
     </div>
   </div>
</div>


<!-- SCRIPT -->
<script type="text/javascript">
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbl_padres tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
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
///////////////////////////////////////////////////
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
			$('#selectSeccion2').empty();
        	$('#selectSeccion2').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectSeccion2').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////////////////////
</script>
</body>
</html>