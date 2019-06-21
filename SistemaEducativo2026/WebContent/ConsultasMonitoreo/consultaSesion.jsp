<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Consulta Sesiones de Aprendizaje</title>
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
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Control y Monitoreo Sesione de Aprendizaje</strong></h4>
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
   	 					<div class="col-md-4" id="divBuscarAlumnos">
                        	<br><br> 
                        	<button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning" >
							    	<img src="../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar
							</button><br><br>
                        </div>
   	 				</div>
   	 				
   	 				<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   	 				
   	 				<div class="row" id="divEstudiantes">

   	 					<div class="table-responsive">
   	 							<form action="<%=request.getContextPath()%>/VisualizarPDF" method="post" target="_blank">
   	 							<table class="table table-hover" id="table_estudiante">
									<thead>
										<tr>
											<th style="text-align: center;">Nro</th>
											<th style="text-align: center;">Código Sesión</th>
											<th style="text-align: center;">Título Sesión</th>
											<th style="text-align: center;">Código Nivelación</th>
											<th style="text-align: center;">Sección</th>
											<th style="text-align: center;">Curso</th>
											<th style="text-align: center;">Docente</th>
											<th style="text-align: center;">Sesión de Aprendizaje</th>
											<th style="text-align: center;">Fecha de Creación de Sesión</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_estudiante">
	
									</tbody>
								</table>
								</form>
						</div>
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
});

///////////////////////////////////////////
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var doc = $('#docente').val().trim();
	var niv = $('#nivelacion').val().trim();
	var sec = $('#seccion').val().trim();
	
	var vacio = "";
	$('#table_estudiante tbody tr').remove();
	
	if(doc == vacio || niv  == vacio || sec == vacio)
	{
		alert("Campos obligatorios vacios");
	
	}
	else {
		
	console.log(doc + "-" + niv + "-" + sec);
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarSesion',
        data : {
        	docente: doc,
        	nivelacion: niv
        },
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == vacio)
			{
				alert("No hay registro de Sesiones de aprendizaje en este grupo de nivelación");
				
			}
			else{
				$('#tbl_estudiante').empty();
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					var id      = array[i].split("|")[0];
					var titulo  = array[i].split("|")[1];
					var nivelacion      = array[i].split("|")[2];
					var seccion 		= array[i].split("|")[3];
					var curso 			= array[i].split("|")[4];
					var docente 		= array[i].split("|")[5];
					var archivo			= array[i].split("|")[6];
					var fechainicio 	= array[i].split("|")[7];
					var estado          = array[i].split("|")[8];

					if(estado == "No Revisado")
					{
						$('#tbl_estudiante').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+id+"<input type='text' id='codigo' name='codigo'></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nivelacion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+seccion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+curso+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fechainicio+"</center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-danger' id='btnNoRevisado' name='btnNoRevisado'>"+estado+"</button></center></td>"+
	  				  			"</tr>");
		  				
	  				    j++;
					}
					else{
						
						$('#tbl_estudiante').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+id+"<input type='text' id='codigo' name='codigo'></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nivelacion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+seccion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+curso+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fechainicio+"</center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-success'>"+estado+"</button></center></td>"+
	  				  			"</tr>");
		  				
	  				    j++;
					}
				}
			}
        }
	});
	}
});
////////////////////////////////////////////////////
$('#table_estudiante').on('click', '#btnVer', function(){
	
	var id = $(this).closest('tr').find("td").filter(":eq(1)").text();
	
	console.log("codigo: " + id);
	
	document.getElementById("codigo").value = id;
	
});
/////////////////////////////////////////////////////
$('#table_estudiante').on('click', '#btnNoRevisado', function(){
	
	var estado = "Revisado";
	var codigo = $(this).closest('tr').find("td").filter(":eq(1)").text();

	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ModificarEstadoSesion',
        data: { 
        	estado	: estado,
        	codigo  : codigo
        
        },
        success: function(data)
        {
        	if (data == "1"){
        		
				listar2();
 			}else {
 				
 				alert("No se pudo cambiar el estado. Listar la tabla de nuevo");
 			}	
        }
		});   
	
	
});

///////////////////////////////////////////
function listar2()
{
	var doc = $('#docente').val().trim();
	var niv = $('#nivelacion').val().trim();
	var sec = $('#seccion').val().trim();
	
	var vacio = "";
	$('#table_estudiante tbody tr').remove();
		
	console.log(doc + "-" + niv + "-" + sec);
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarSesion',
        data : {
        	docente: doc,
        	nivelacion: niv
        },
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == vacio)
			{
				alert("No hay registro de Sesiones de aprendizaje en este grupo de nivelación");
				
			}
			else{
				$('#tbl_estudiante').empty();
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					var id      = array[i].split("|")[0];
					var titulo  = array[i].split("|")[1];
					var nivelacion      = array[i].split("|")[2];
					var seccion 		= array[i].split("|")[3];
					var curso 			= array[i].split("|")[4];
					var docente 		= array[i].split("|")[5];
					var archivo			= array[i].split("|")[6];
					var fechainicio 	= array[i].split("|")[7];
					var estado          = array[i].split("|")[8];

					if(estado == "No Revisado")
					{
						$('#tbl_estudiante').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+id+"<input type='text' id='codigo' name='codigo'></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nivelacion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+seccion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+curso+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fechainicio+"</center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-danger' id='btnNoRevisado' name='btnNoRevisado'>"+estado+"</button></center></td>"+
	  				  			"</tr>");
		  				
	  				    j++;
					}
					else{
						
						$('#tbl_estudiante').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+id+"<input type='text' id='codigo' name='codigo'></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nivelacion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+seccion+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+curso+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fechainicio+"</center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-success'>"+estado+"</button></center></td>"+
	  				  			"</tr>");
		  				
	  				    j++;
					}
				}
			}
        }
	});
	
}
</script>
</body>
</html>