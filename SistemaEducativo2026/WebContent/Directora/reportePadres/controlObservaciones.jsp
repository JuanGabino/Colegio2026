<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../../Imagenes/insignia2026.png" type="image/png">
	<title>Control de Módulo de Observaciones</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 	
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
	  				<h4 style="color: white;"><strong><img src="../../Imagenes/lista.png" height="40" width="50">Control de Observacioness</strong></h4>
   				</div>
   				<div class="panel-body">
   					
   					<form action="<%=request.getContextPath()%>/ConsultaObservacion" method="post">
   					<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni" >               
                             <h4><strong>Docente:</strong></h4>
         					 <select class="form-control selectDocente" id="selectDocente" onchange="mostrarNombre(this.options[this.selectedIndex].innerHTML); mostrarValor(this.value);">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	     					 </select>
	     					 <input type="hidden" id="docente" name="docente">
	     					 <input type="hidden" id="nomdocente" name="nomdocente">
                        </div>
                        <div class="col-md-6" id="divSeccion" >               
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
                             <h4><strong>Mes:</strong></h4>
         					 <select class="form-control selectMes" id="selectMes" onchange="mostrarNombre2(this.options[this.selectedIndex].innerHTML); mostrarValor2(this.value);">
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
	     					 <input type="hidden" id="mes" name="mes">
	     					 <input type="hidden" id="nommes" name="nommes">
                        </div>
                        <div class="col-md-6">               
                             <h4><strong>Año:</strong></h4>
         					 <select class="form-control selectAno" id="selectAno" onchange="mostrarNombre3(this.options[this.selectedIndex].innerHTML); mostrarValor3(this.value);">
		   							<option value="" selected disabled hidden>--Seleccionar Año--</option>
		   							<option value="2018">2018</option>
		   							<option value="2019">2019</option>
		   							<option value="2020">2020</option>				
	     					 </select>
	     					 <input type="hidden" name="ano" id="ano">
	     					 <input type="hidden" name="nomano" id="nomano">
                        </div>
   	 				</div><br><br>
   	 				
   	 				<div class="row">
   	 					<div class="col-md-6" id="divBuscarObservaciones">
   	 						<div class="col-md-6">
   	 							<button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning" >
							    	<img src="../../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar
								</button><br><br>
   	 						</div>
   	 						
                        </div>
   	 				</div><br><br>
   	 				</form>
   	 				
   	 				<div class="row" id="divObservaciones">
						<div class="container-fluid">
   	 						<br>
   	 						<input class="form-control" id="myInput" type="text" placeholder="Buscar Alumno...">
   	 						<br>
   	 						<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 					</div>
   	 					<div class="table-responsive">
   	 							<table class="table table-hover" id="table_docente">
									<thead>
										<tr>
											<th style="text-align: center;">Nro</th>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Descripción</th>
											<th style="text-align: center;">Alumno</th>
											<th style="text-align: center;">Fecha de Observación</th>
											<th style="text-align: center;">Sección</th>
											<th style="text-align: center;">Curso</th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
									</tbody>
								</table>
						</div>
					</div>

   				</div>
   			</div>
   	</div>
  </div>
</div>

<script type="text/javascript">
/////////////////////////////////////////////
var mostrarValor = function(x){
       
	document.getElementById('docente').value=x;
}
var mostrarValor1 = function(x){
    
	document.getElementById('seccion').value=x;
}
var mostrarValor2 = function(x){
    
	document.getElementById('mes').value=x;
}
var mostrarValor3 = function(x){
    
	document.getElementById('ano').value=x;
}
var mostrarNombre = function(x){
    
	document.getElementById('nomdocente').value=x;
}
var mostrarNombre1 = function(x){
    
	document.getElementById('nomseccion').value=x;
}
var mostrarNombre2 = function(x){
    
	document.getElementById('nommes').value=x;
}
var mostrarNombre3 = function(x){
    
	document.getElementById('nomano').value=x;
}
//////////////////////////////////////////
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
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbl_docente tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
});
////////////////////////////////////////////////////////////
$('#divBuscarObservaciones').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var dni = $('#selectDocente').val().trim();
	var mes = $('#selectMes').val().trim();
	
	var vacio = "";
	$('#table_docente tbody tr').remove();
	
	if(sec == vacio || dni == vacio || mes == vacio)
	{
		alert("Campos obligatorios vacios");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/BuscarObservacionMensual',
        data : {
        	dni : dni,
			seccion : sec,
			mes : mes
		},
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == "vacio")
			{
				alert("No hay registro de Observaciones");
				
			}
			else{
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					var codigo      = array[i].split("/")[0];
					var descripcion = array[i].split("/")[1];
					var nombre = array[i].split("/")[2];
					var apellidoPat = array[i].split("/")[3];
					var apellidoMat = array[i].split("/")[4];
					var seccion = array[i].split("/")[5];
					var curso   = array[i].split("/")[6];
					var fecha = array[i].split("/")[7];
	
					var id = 1;

  				    $('#tbl_docente').append("<tr>" +
  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+codigo+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+descripcion+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+nombre+ " " + apellidoPat + " " + apellidoMat + "</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+fecha+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+seccion+"</center></td>" +
	  				  		"<td style='font-size: 15px;'><center>"+curso+"</center></td>" +
	  				  		'<td><center><button class="btn btn-success" >RECIBIDO</button></center></td>'+
	  				  		"</tr>");
  				    j++;
				}
			}
        }
	});
	}	
});
////////////////////////////////////////////////////

</script>

</body>
</html>