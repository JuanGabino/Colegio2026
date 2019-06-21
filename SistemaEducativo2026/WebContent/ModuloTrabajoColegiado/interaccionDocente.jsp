<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>	
 	
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
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>INTERACCIÓN DOCENTE</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="<%=request.getContextPath()%>/ColegiadoPDF" method="post" target="_blank">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="row table-responsive" id="scroll">
   	 					<table class="table table-hover table-bordered" id="table_docente">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
											<th style="text-align: center;">Curso</th>
											<th style="text-align: center;">Información</th>
											<th style="text-align: center;">Observación</th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
										
									</tbody>
						</table>
   	 					</div><br>
   	 				</div>
   	 			</div>
   	 			</form>
   	 		</div>
   	 		<br><br>
   	 		
   	 		<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>REGISTRAR TRABAJO DE INIVESTIGACIÓN</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni" >               
                          <h4><strong>Nº de Documento</strong></h4> 
                          <div class="row">
                               <div class="col-md-8">
                                    <input type="text" class="form-control" id="txtnumdoc" name="txtnumdoc"  value="<% out.println(session.getAttribute("dni"));  %>">
                               </div>
                          </div>
                    	</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnom" id="txtnom">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpat" id="txtpat">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmat" id="txtmat">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
                    	<div class="col-md-4">
                    		<h4><strong>Área Curricular:</strong></h4>
           					<select class="form-control selectArea" id="selectArea"  onchange="mostrarValor(this.value);">
			   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
	       					<input type="hidden" id="area" name="area">
                    	</div>
                    	<div class="col-md-6">
   	 						<h4><strong>Archivo:</strong></h4>   	 				
							<input class="boton_1" type="file" id="archivo" name="archivo" value="Subir Archivo" required>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-6"> 
   	 						<div class="container-row">
      							 <div class="negrita">
      							 		<h4><strong>Observación:</strong></h4>   
                                       <textarea rows=4 cols=50 id="texto" name="texto" ></textarea>
        						 </div>
      						</div>
   	 					</div>
   	 					<div class="col-md-6" id="botonGuardar">
   	 						<br><br><br>
   	 						<button class="btn btn-success from-control" type="submit" id="btnGuardar" name="btnGuardar" >
   	 								<img src="../Imagenes/descarga.ico"   height="20" width="20">&nbsp;GUARDAR  
   	 						</button>
   	 					</div>
   	 				</div>
   	 			</div>
   	 		</div><br>
   	 		
   	 	</div>
   	</div>
</div>

<!-- SCRIPT -->
<script type="text/javascript">
////////////////////////////////////////////
$(document).ready(function () {
    $("#fechainicio").keyup(function () {
        var value = $(this).val();
        var fe = $("#fechainicio").val();
   	    var inicio = fe.substring(6,10)+"-"+fe.substring(0,2)+"-"+fe.substring(3,5);
        $("#fechareal").val(inicio);
    });
});
/////////////////////////////////////////////////
var mostrarValor = function(x){
       
	document.getElementById('area').value=x;
}
/////////////////////////////////////////////////
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
        }
	});	
});
////////////////////////////////////////////////////
$('#table_docente').on('click', '#btnVer', function(){
	
	var id = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	console.log("codigo: " + id);
	
	document.getElementById("codigo").value = id;
	
});
//////////////////////////////////////////////
$(document).ready(function(){
	
	var numdni = $("#txtnumdoc").val();
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
//////////////////////////////////////////
$(document).ready(function(){
	
	var vacio = "";
	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarInteraccion',
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == vacio)
			{
				alert("No hay registro de archivos en este grupo");
				
			}
			else{
				$('#tbl_docente').empty();
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					var id              = array[i].split("|")[0];
					var dni             = array[i].split("|")[1];
					var nombre          = array[i].split("|")[2];
					var paterno         = array[i].split("|")[3];
					var materno 		= array[i].split("|")[4];
					var area 			= array[i].split("|")[5];
					var archivo 		= array[i].split("|")[6];
					var observacion 	= array[i].split("|")[7];

					$('#tbl_docente').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+id+"<input type='hidden' id='codigo' name='codigo'></center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+dni+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nombre+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+paterno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+materno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+area+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+observacion+"</center></td>" +
	  				  			"</tr>");
		  			
				}
			}
        }
	});
});
/////////////////////////////////////////////////
</script>
</body>
</html>