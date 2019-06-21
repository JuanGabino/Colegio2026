<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Consulta Módulo Reforzamiento</title>
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
			<!-- <li><a href="asistenciaNiv.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Seguimiento Nivelación</strong></a></li>-->
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
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Control de Destacados</strong></h4>
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
   	 					<div class="col-md-6">
   	 						<h4><strong>Círculo de Estudio: </strong></h4>
   	 						<select class="form-control selectCirculo" id="selectCirculo" name="selectCirculo" onchange="mostrarNombre2(this.options[this.selectedIndex].innerHTML); mostrarValor2(this.value);">
   	 							<option value="" selected disabled hidden>--Seleccionar--</option>
   	 						</select>
   	 						<input type="hidden" id="circulo" name="circulo">
	     					 <input type="hidden" id="nomcirculo" name="nomcirculo">
   	 					</div>
   	 					<div class="col-md-6" id="divBuscarAlumnos">
                        	<br><br> 
                        	<button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning" >
							    	<img src="../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar
							</button><br><br>
                        </div>
   	 				</div>
   	 				
   	 				<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   	 				
   	 				<div class="row" id="divEstudiantes">
						<div class="container-fluid">
   	 						<br>
   	 						<input class="form-control" id="myInput" type="text" placeholder="Buscar Alumno...">
   	 						<br>
   	 					</div>
   	 					<div class="table-responsive">
   	 							<table class="table table-hover" id="table_estudiante">
									<thead>
										<tr>
											<th style="text-align: center;">Nro</th>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Asignatura</th>
											<th style="text-align: center;">idAlumno</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
											<th style="text-align: center;">Fecha</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_estudiante">
	
									</tbody>
								</table>
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
    
	document.getElementById('circulo').value=x;
}
var mostrarNombre = function(x){
    
	document.getElementById('nomdocente').value=x;
}
var mostrarNombre1 = function(x){
    
	document.getElementById('nomseccion').value=x;
}
var mostrarNombre2 = function(x){
    
	document.getElementById('nomcirculo').value=x;
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
	
	////////////////////////////////////////////////
	$('#divSeccion').on('change', '#selectSeccion', function(){
		
        if ( $(this).children(":selected").val() === "" ) 
        {
              $('.selectCirculo option').remove();
              $('.selectCirculo').append('<option value="'+""+'">--Seleccionar--</option>');
        }
        else 
        {
        	$('.selectCirculo option').remove();
        	$.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/ListarCirculoDocente',
                data: { 
                	
		        	codigo: $('#selectDocente').val(),
		        	seccio: $('#selectSeccion').val()
		        },
                success: function(data)
            	{
       				$('.selectCirculo').append('<option value="'+""+'">--Seleccionar--</option>');
               			var var1=data.split("$");
	           			for (var i=0;i<var1.length-1;i++) 
	           			{
			    			var valor=var1[i].split("/")[0];
			    			var descr=var1[i].split("/")[1];
 			    			$('.selectCirculo').append('<option value="'+valor+'">'+descr+'</option>');
						}
         		}
     		});   
     	}
	});
});
////////////////////////////////////////////////////////////////////////
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var doc = $('#docente').val();
	var cir = $('#circulo').val();
	var sec = $('#seccion').val(); 
	
	var vacio = "";
	$('#table_estudiante tbody tr').remove();
	
	if(doc == vacio || cir  == vacio || sec == vacio)
	{
		alert("Campos obligatorios vacios");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/BuscarAlumnoCirculo',
        data : {
        	docente: doc,
        	circulo: cir
        },
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == "vacio")
			{
				alert("No hay registro de Alumnos en este Círculo de Estudio");
				
			}
			else{
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					var id      = array[i].split("|")[0];
					var asignatura  = array[i].split("|")[1];
					var codigo      = array[i].split("|")[2];
					var nombre = array[i].split("|")[3];
					var apellidoPat = array[i].split("|")[4];
					var apellidoMat = array[i].split("|")[5];
					var fecha = array[i].split("|")[6];
	

  				    $('#tbl_estudiante').append("<tr>" +
  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+id+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+asignatura+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+codigo+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+nombre+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+apellidoPat+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+apellidoMat+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+fecha+"</center></td>" +
	  				  		'<td><center><button class="btn btn-success" >Activo</button></center></td>'+
	  				  		"</tr>");
  				    j++;
				}
			}
        }
	});
	}
});

</script>
</body>
</html>