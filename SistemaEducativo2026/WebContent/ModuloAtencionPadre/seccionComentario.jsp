<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Atencion Padre de Familia - Comunicados</title>
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
			<li><a href="registroAsistenciaPadres.jsp"><img src="../Imagenes/report.png"    height="30" width="30"><strong>Registro de Asistencia a Padres</strong></a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>


<!-- CUERPO DE PAGINA -->
<div class="container-row"> 
 
  <div class="col-md-2">
  </div>
  
  <div class="col-md-8">
  		
    	<div class="row">
    			
    			<!-- PANEL -->
  				<div class="panel panel-default">
  							
  							<!-- PANEL CABECERA -->
    						<div class="panel-heading">
	  							<h4><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE ALUMNOS</strong></h4>
   							</div>
   							
   							<!-- PANEL CUERPO -->
   							<div class="panel-body">
         						<div class="row">
   	 								<div class="col-md-6">
           								<h4><strong>Curso:</strong></h4>
           								<select class="form-control selectCurso" id="selectCurso">
		   									<option value="" selected disabled hidden>--Seleccionar--</option>
	       								</select>
	     							</div>
	     							<div class="col-md-6">
           								<h4><strong>Seccion:</strong></h4>
           								<select class="form-control selectSeccion" id="selectSeccion">
		   									<option value="" selected disabled hidden>--Seleccionar--</option>
	       								</select><br>
	       								<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	     							</div>
	     						</div>
	     						<div class="row">
	     							<div class="col-md-6">
	     								<h4><strong>Periodo: </strong></h4>
	   	 		 						<select class="form-control selectPeriodo" id="selectPeriodo">
	   	 		 							<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 						</select><br>
	     							</div>
	     							<div class="col-md-6">
	     								<h4><strong>Año:</strong></h4>
           								<select class="form-control selectAnio" id="selectAnio">
		   									<option value="" selected disabled hidden>--Seleccionar--</option>
	       								</select><br>
	     							</div>
   	 							</div>
   	 							<div class="row" id="divBuscarAlumnos">
   	 								<div class="col-md-3"></div>
   	 								<div class="col-md-6">
   	 									<button class="btn btn-success form-control" id="btnBuscar" name="btnBuscar">Buscar</button>
   	 								</div>
   	 							</div>
   	 							<br><br>
   	 							
   	 							<!-- TABLA ALUMNOS -->
         						<div class="row table-responsive" id="divTablaAlumno">
           									<table id="Table" class="table">
            									<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             										<tr>
              			  								<th><center>IDALUMNO</center></th>
              			  								<th><center>NOMBRE</center></th>
              			  								<th><center>APELLIDO PATERNO</center></th>
              			  								<th><center>APELLIDO MATERNO</center></th>
                          								<th></th>
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


<!-- MODAL DE COMENTARIO -->
<div id="myModal" class="modal fade" role="dialog">
 	<div class="modal-dialog">
 	
		<!-- Modal content-->
      	<div class="modal-content">
      	
      		<!-- MODAL CABECERA -->
      		<div class="modal-header" style="background-color: #213758;">
        			<button type="button" class="close" data-dismiss="modal" >&times;</button>
        			<h4 class="modal-title" style="color: white;"><strong>GENERAR COMENTARIO y/u OBSERVACIONES</strong></h4>
      		</div>
      		
      		<!-- MODAL CUERPO -->
      		<div class="modal-body"  id="exportContent">
      			<div class="row">
      				<div class="col-md-6">
        				<h5><strong>Codigo Alumno:</strong></h5>
        				<input type="text" class="form-control" id="idAlum" name="idAlum" value="" disabled>
       				</div>
       			</div><br>
       			<div class="row">
       				<div class="col-md-6">
        				<h5><strong>CODIGO DOCENTE</strong></h5>
        				<input type="text" id="txtcodDocente" name="txtcodDocente" class="form-control"  value="" disabled>
       				</div>
       				<div class="col-md-6">
						<h5><strong>FECHA</strong></h5>
      					<input type="text"  class="form-control"  name="fecha" id="fecha" value="" disabled>
       				</div>
      			</div><br><br>
      			<div class="container-row">
      				<div class="negrita">
                         <textarea name="comment" rows=5 cols=70 id="texto" name="texto" placeholder="Introduzca una observación"></textarea> 
        			</div>
      			</div><br>
      			<div class="row">
       				<div class="col-md-6">
        				<input name="btnEnviarObservacion" id="btnEnviarObservacion" type="button" class="btn btn-success form-control" value="ENVIAR OBSERVACIONES">
       				</div>
       				<div class="col-md-6">
        				<input type="button" class="btn btn-primary form-control" value="LIMPIAR CAMPOS">
       				</div>
      			</div>
      		</div><br>
      		
      		<!-- MODAL FOOTER -->
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     		</div>
    	</div>
 	</div>
</div>
<!-- FIN MODAL -->
			
				
<!-- MODAL 2 - PROGRESO -->
<div id="myModal2" class="modal fade" role="dialog">
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
<!-- FIN MODAL 2 -->



<script src="<%=request.getContextPath()%>/dist/Chart.bundle.min.js"></script>		

	   		 			
<script type="text/javascript">
  var meses = new Array ("01","02","03","04","05","06","07","08","09","10","11","12");
  var f=new Date();
	document.getElementById("fecha").value = f.getFullYear() + "-" +  meses[f.getMonth()] + "-" + f.getDate();
</script>
<script type="text/javascript">
/////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////
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
			$('#selectSeccion').empty();
        	$('#selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectSeccion').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////////////
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

$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#selectCurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio || cur == vacio || per == vacio || anio == vacio)
	{
		alert("Campos Obligatorios vacios");
	
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
	  				  		'<td><center><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2" id="btnProgreso">PROGRESO</button></center></td>'+
  				  			'<td><center><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="btnObservaciones">OBSERVACIONES</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}		
});
////////////////////////////////////////////
$('#divTablaAlumno').on('click', '#btnObservaciones', function(){
	
	var id ="";
    id=$(this).closest('tr').find("td").filter(":eq(0)").text();
    document.getElementById("idAlum").value = id;
});
//////////////////////////////////////////////////////////////////
$('#divTablaAlumno').on('click', '#btnProgreso', function(){
	
	var id ="";
	var nombre = "";
	var apellidoPat = "";
	var apellidoMat = "";
	
    id          = $(this).closest('tr').find("td").filter(":eq(0)").text();
    nombre      = $(this).closest('tr').find("td").filter(":eq(1)").text();
    apellidoPat = $(this).closest('tr').find("td").filter(":eq(2)").text();
    apellidoMat = $(this).closest('tr').find("td").filter(":eq(3)").text();
    
    document.getElementById("codAlum").value = id;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellidoPat").value = apellidoPat;
    document.getElementById("apellidoMat").value = apellidoMat;
	
	
});
/////////////////////////////////////////////////////////////////
$('#btnEnviarObservacion').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.alumno      = $('#idAlum').val().trim();
	item.texto       = $('#texto').val().trim();
	item.fecha       = $('#fecha').val().trim();
	item.selectSeccion = $('#selectSeccion').val();
	item.idcurso       = $('#selectCurso').val();
	item.txtdni        = $('#txtcodDocente').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#texto').val() != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarObservaciones',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro la Observacion");
	    		 document.getElementById("texto").value = "";
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE REGISTRO LA OBSERVACION");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Escriba un mensaje de texto");
	}
		
});
////////////////////////////////////////////////////
$('#divTablaAlumno').on('click', '#btnProgreso', function(){

	var id   = $(this).closest('tr').find("td").filter(":eq(0)").text();
	var sec  = $('#selectSeccion').val().trim();
	var cur  = $('#selectCurso').val().trim();
	var anio = $('#selectAnio').val().trim();
	var per = 1;
	
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
///////////////////////////////////////////////////////////////////////////////
</script>
</body>
</html>
