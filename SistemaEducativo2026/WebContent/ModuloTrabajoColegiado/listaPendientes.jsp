<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Módulo Trabajo Colegiado</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	 
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="listaPendientes.jsp" ><img src="../Imagenes/listaComunicado.png"height="30" width="30"><strong>Lista de Pendientes</strong></a></li>
			<li><a href="entregablesColegiado.jsp"><img src="../Imagenes/observacion.png" width="30" height="30"><strong>Entregables de Trabajo</strong></a></li>
			<li><a href="interaccionDocente.jsp"><img src="../Imagenes/interaccion.png" width="30" height="30"><strong>Interacción Docente</strong></a></li>
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
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>LISTA PENDIENTES TRABAJO COLEGIADO</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<h4><strong>Área Curricular:</strong></h4>
           					<select class="form-control selectArea" id="selectArea">
			   					<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	       					<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	       					<input type="hidden" id="txtcodDocente" name="txtcodDocente" class="form-control" value="" disabled>
   	 					</div>
   	 					<div class="col-md-6" id="btnBuscarArea">
   	 						<br><br>
   	 						<button class="btn btn-primary" id="btnBuscar" name="btnBuscar" >Buscar Tareas</button>
   	 					</div>
   	 				</div><br>
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
											<th style="text-align: center;">Fecha Inicio</th>
											<th style="text-align: center;">Fecha Fin</th>
											<th style="text-align: center;">Estado</th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
									</tbody>
						</table>
   	 				</div><br>
   	 			</div>
   	 		</div>
   	 	</div>
    </div>
</div>


<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
///////////////////////////////////////
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
///////////////////////////////////////
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
			$('#selectArea').empty();
        	$('#selectArea').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectArea').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////
$('#btnBuscarArea').on('click', '#btnBuscar', function(){
	
	var area = $("#selectArea").val();
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarTarea',
	    data: {
	    	
	    	area: area
	    },
		success: function(data)
        { 
			if(data == "vacio"){
				
				alert("No hay registro de pendientes");
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
				var tarea    = array[i].split("/")[6];
				var inicio   = array[i].split("/")[7];
				var fin      = array[i].split("/")[8];
				var estado   = array[i].split("/")[9];
				
				if(estado == 'Caducado')
				{
					$('#tbl_docente').append("<tr>" +
				    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+paterno+"</center></td>"+
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+materno+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nivel+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+curso+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+tarea+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+inicio+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+fin+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center><button class='btn btn-danger'>"+estado+"</button></center></td>" +	
				    "</tr>");
					
					j++;
				}
				else
				{
					$('#tbl_docente').append("<tr>" +
					    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+paterno+"</center></td>"+
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+materno+"</center></td>" +	
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nivel+"</center></td>" +	
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+curso+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+tarea+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+inicio+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+fin+"</center></td>" +	
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center><button class='btn btn-success'>"+estado+"</button></center></td>" +	
					    "</tr>");
						
						j++;
				}
				 
			  }
			}
        }
		
	});
	
});
</script>
</body>
</html>