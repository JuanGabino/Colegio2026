<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Cursos - Reportes Bimestral</title>
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
			<li><a href="asignaturasDocente.jsp"><img src="../Imagenes/registro.ico" height="40" width="50"><strong>Registro de Notas</strong></a></li>
			<li><a href="reportesCursos.jsp" ><img src="../Imagenes/report.png" height="40" width="50"><strong>Reporte Bimestral</strong></a></li>
			<li><a href="reportesAlumnos.jsp" ><img src="../Imagenes/reportAlumno.png" height="40" width="50"><strong>Reportes Por Alumno</strong></a></li>
			<li></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<%
   String curso = request.getParameter("txtcurso");
   String idcurso = request.getParameter("txtIdCurso");
   int    num = 1;

%>   

<!-- CUERPO DE LA PAGINA --> 
<div class="container-row"> 
 
   <!-- INSIGNIA -->
   <div class="container-fluid">
   	<img style="float:left;" src="../Imagenes/insignia2026.png" width="70" height="70"><h3 style="margin-top:20px; font-family: monospace;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
   </div>
   <br><br>
   
   <div class="col-md-2"></div>
   
   <!-- DASHBOARD -->
   <div class="col-md-8">
   
   		<!-- PANEL BUSQUEDA -->
    	<div class="panel panel-default" id="divAlumnos">
    
     		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>LISTA DE ALUMNOS</strong></h4>
   	 		</div>
   	 
   	 		<div class="panel-body">
   	 		
   	   			<div class="row">
   	   				<div class="col-md-6">
       				   <h4><strong>Curso:</strong></h4> 
	   	 			   <input type="text" id="txtcurso" class="form-control" value="<%out.print(curso); %>" name="txtcurso" disabled>
	   	 			   <input type="hidden" id="txtIdcurso" class="form-control" value="<%out.print(idcurso); %>"name="txtIdcurso" disabled>
	   	 		 	</div>
	   	 		 	<div class="col-md-6">
           				<h4><strong>Seccion:</strong></h4>
           				<select class="form-control selectSeccion" id="selectSeccion">
		   					<option value="" selected disabled hidden>--Seleccionar--</option>
	       				</select><br>
	       				<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	     			</div>
       			</div>
       			<br>
       			
       			<div class="row">
       			 <div class="col-md-6">
       			 	<h4><strong>Periodo: </strong></h4>
	   	 		 	<select class="form-control selectPeriodo" id="selectPeriodo">
	   	 		 			<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 	</select>
       			 </div>
       			 <div class="col-md-6">
       			 	<h4><strong>Año: </strong></h4>
	   	 		 	<select class="form-control selectAnio" id="selectAnio">
	   	 		 	 			<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 	</select>
       			 </div>
       			</div>
       			<br><br>
       			
       			<div class="row">
       				<button class="btn btn-success btn-lg" type="button" id="btnBuscar" name="btnBuscar" style="margin-left: 20px;"><strong>Buscar Reportes de Rendimiento</strong></button>
       			</div>
   	       </div>
       </div>
        
       <!-- Alumnos Rendimiento DASHBOARD -->
       <div class="panel panel-default">
       		<!-- TITULO -->
       		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><img src="../Imagenes/rendimiento.png" height="40" width="50"><strong>Rendimiento del Curso</strong>
	  			<input id="flecha1" style="float: right;" type="image" src="../Imagenes/flechadescendente.png"  height="30" width="30"></h4>
   	 		</div>
   	 		<!-- CUERPO -->
   	 		<div class="panel-body" id="rendimientocurso">
   	 			<div class="row" id="divAlumnoRendimiento">
               		<a class="btn btn-primary" id="download" download="Canvas.png" style="margin-left: 20px;">Descargar Imagen</a><br>
               		<canvas id="chartRendimiento"></canvas>
                </div>
   	 		</div>
       </div>
       
       <div class="row">
       
       		<!-- LISTA DE ALUMNOS DESTACADOS -->
       		<div class="col-md-6">
       			<div class="panel panel-default">
       				<!-- TITULO -->
       				<div class="panel-heading" style="background-color: #3E7BC0;">
	  					<h4 style="color: white;"><img src="../Imagenes/destacados.png" height="40" width="50"><strong>Alumnos Destacados del Curso</strong>
	  					<input id="flecha2" style="float: right;" type="image" src="../Imagenes/flechadescendente.png"  height="30" width="30"></h4>
   	 				</div>
   	 				<!-- CUERPO -->
   	 				<div class="panel-body" id="notasmaximas">
   	 					<div class="row" id="divNotasMaximas">
               		 		<a class="btn btn-primary" id="download2" download="CanvasNotasMaximas.png" style="margin-left: 20px;">Descargar Imagen</a><br>
               				<canvas id="chartDestacados"></canvas>
                		</div>
   	 				</div>
   	 				
       			</div>
       		</div>
       		
       		<!-- DASHBOARD ALUMNOS MENOS DESTACADOS -->
       		<div class="col-md-6">
       			<div class="panel panel-default">
       				<!-- TITULO -->
       				<div class="panel-heading" style="background-color: #3E7BC0;">
	  					<h4 style="color: white;"><img src="../Imagenes/bajo.png" height="40" width="50"><strong>Alumnos con Notas mas Bajas del Curso</strong>
	  					<input id="flecha3" style="float: right;" type="image" src="../Imagenes/flechadescendente.png"  height="30" width="30"></h4>
   	 				</div>
   	 				<!-- CUERPO -->
   	 				<div class="panel-body" id="notasminimas">
   	 					<div class="row" id="divNotasMinimas">
               		 		<a class="btn btn-primary" id="download3" download="CanvasNotasMinimas.png" style="margin-left: 20px;">Descargar Imagen</a><br>
               				<canvas id="chartJalados"></canvas>
                		</div>
   	 				</div>
       			</div>
       		</div>
       </div>
       
       
       <div class="row">
       		<!-- ALUMNOS ASISTENCIA/FALTAS -->
       		<div class="col-md-6">
       			<div class="panel panel-default">
       					<div class="panel-heading" style="background-color: #3E7BC0;">
	  						<h4 style="color: white;"><img src="../Imagenes/asistencia.png" height="40" width="50"><strong>Alumnos con mayor Tardanza o Faltas del Curso</strong>
	  						<input id="flecha4" style="float: right;" type="image" src="../Imagenes/flechadescendente.png"  height="30" width="30"></h4>
   	 					</div>
   	 					<div class="panel-body" id="asistencias">
   	 					  <div class="container-fluid">
               		    	<table id="Table" class="table">
               		    		<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             						<tr>
              				  			<th><center>Nombre</center></th>
              							<th><center>Apellido Paterno</center></th>
              							<th><center>Apellido Materno</center></th>
              							<th><center>Cantidad</center></th>
              							<th><center>Estado</center></th>
             						</tr>
            					</thead>
            
		            			<tbody id="tbl_tardanzaFalta"> 
    	         
        	    				</tbody>
               		    	</table>
               			  </div>
   	 					</div>
   	 			</div>
       		</div>
       		
       		<!-- CANTIDAD APROBADOS/DESAPROBADOS -->
       		<div class="col-md-6">
       			<div class="panel panel-default">
       					<div class="panel-heading" style="background-color: #3E7BC0;">
	  						<h4 style="color: white;"><img src="../Imagenes/porcentaje.png" height="40" width="50"><strong>Alumnos Aprobados y Desaprobados </strong>
	  						<input id="flecha5" style="float: right;" type="image" src="../Imagenes/flechadescendente.png"  height="30" width="30"></h4>
   	 					</div>
   	 					<div class="panel-body" id="porcentaje">
   	 					    <br>
               		    	<div id="canvas-container">
               		    		<a class="btn btn-primary" id="download4" download="CanvasPorcentaje.png" style="margin-left: 20px;">Descargar Imagen</a><br>
               		    		<canvas id="graficoAprobados" width="300" height="200"></canvas>
               		    	</div>
               		    	<br><br>
   	 						<table id="Table" class="table">
               		    		<thead>
             						<tr>
              				  			<th><center>Aprobados</center></th>
              							<th><center>Desaprobados</center></th>
              							<th><center>Total</center></th>
             						</tr>
            					</thead>
            
		            			<tbody id="tbl_porcentaje"> 
    	         
        	    				</tbody>
               		    	</table>
   	 					</div>
   	 			</div>
       		</div>
       		
       </div>
   </div>
</div>  

<script src="<%=request.getContextPath()%>/dist/Chart.bundle.min.js"></script>
<script type="text/javascript">
////////////////////////////////////////////
$(document).ready(function(){
	
	var canvas = document.getElementById("chartRendimiento");
	
	function downloadCanvas() 
	{
		var data = canvas.toDataURL('image/png');
		/* Change MIME type to trick the browser to downlaod the file instead of displaying it */
		data = data.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
	 
		/* In addition to <a>'s "download" attribute, you can define HTTP-style headers */
		data = data.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');
	 
		this.href = data;
	};
	document.getElementById("download").addEventListener('click', downloadCanvas, false);
});
/////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	var canvas2 = document.getElementById("chartDestacados");
	
	function downloadCanvas2() 
	{
		var data = canvas2.toDataURL('image/png');
		/* Change MIME type to trick the browser to downlaod the file instead of displaying it */
		data = data.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
	 
		/* In addition to <a>'s "download" attribute, you can define HTTP-style headers */
		data = data.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=CanvasNotasMaximas.png');
	 
		this.href = data;
	};
	document.getElementById("download2").addEventListener('click', downloadCanvas2, false);
});
//////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	var canvas3 = document.getElementById("chartJalados");
	
	function downloadCanvas3() 
	{
		var data = canvas3.toDataURL('image/png');
		/* Change MIME type to trick the browser to downlaod the file instead of displaying it */
		data = data.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
	 
		/* In addition to <a>'s "download" attribute, you can define HTTP-style headers */
		data = data.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=CanvasNotasMinimas.png');
	 
		this.href = data;
	};
	document.getElementById("download3").addEventListener('click', downloadCanvas3, false);
});
//////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	var canvas4 = document.getElementById("graficoAprobados");
	
	function downloadCanvas4() 
	{
		var data = canvas4.toDataURL('image/png');
		/* Change MIME type to trick the browser to downlaod the file instead of displaying it */
		data = data.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
	 
		/* In addition to <a>'s "download" attribute, you can define HTTP-style headers */
		data = data.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=CanvasPorcentaje.png');
	 
		this.href = data;
	};
	document.getElementById("download4").addEventListener('click', downloadCanvas4, false);
});
///////////////////////////////////////////
$(document).ready(function(){
	
	$("#rendimientocurso").hide();
	$("#notasmaximas").hide();
	$("#notasminimas").hide();
	$("#asistencias").hide();
	$("#porcentaje").hide();
	
	$("#flecha1").click(function(event) {
		$("#rendimientocurso").slideToggle();
	});
	$("#flecha2").click(function(event) {
		$("#notasmaximas").slideToggle();
	});
	$("#flecha3").click(function(event) {
		$("#notasminimas").slideToggle();
	});
	$("#flecha4").click(function(event) {
		$("#asistencias").slideToggle();
	});
	$("#flecha5").click(function(event) {
		$("#porcentaje").slideToggle();
	});
});
//////////////////////////////////////////
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
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio || cur == vacio || per == vacio || anio == vacio)
	{
		alert("Campos Obligatorios no seleccionados");
		
	}
	else {
		
		alert("Generando Gráficos");
		reporteLogroEstablecidos();
		reporteMaximasNotas();
		reporteMinimasNotas();
		reporteAprobadosDesaprobados();
	}	
	
});
///////////////////////////////////////
function reporteLogroEstablecidos() {
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var dni  = $('#txtdni').val().trim();
	
	$.ajax({
		type: 'POST',
        url: '<%=request.getContextPath()%>/ReportePorCurso',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio,
			idDocente : dni
		},
        success: function(data)
        { 
			var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var excelente   = array[i].split("/")[0];
					var bien        = array[i].split("/")[1];
					var regular     = array[i].split("/")[2];
					var mal         =  array[i].split("/")[3];
				}
				
				var datos = {
		 	 			
		 	 			labels : ["Logro Destacado(18,20)","Logro Previsto(14,17)","Logro en Proceso(11,13)","Logro en Inicio(0,10)"],
		 	 			datasets : [{
		 	 				label : "Cantidad de Alumnos",
		 	 				backgroundColor : "rgba(42, 51, 182)",
		 	 				data : [excelente, bien, regular, mal],
		 	 			}] 			
		 	 	};
		 	 	
		 	 	var canvas = document.getElementById("chartRendimiento").getContext('2d');
		 	 	
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
		 	 			  text : "Gráfica de Logros establecidos"
		 	 		  }
		 	 		}	
		 	 	})	;
			}
        }
		
	});
}
//////////////////////////////////////
function reporteMaximasNotas() {
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ReporteDestacados',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio
			
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var nombre = array[i].split("/")[0];
					var apellidopat = array[i].split("/")[1];
					var apellidomat = array[i].split("/")[2];
					var fina =  array[i].split("/")[3];
				
				
				var datos = {
		 	 			
		 	 			labels : [array[0].split("/")[0]+" "+array[0].split("/")[1], array[1].split("/")[0] + " " + array[1].split("/")[1], array[2].split("/")[0] + " " + array[2].split("/")[1], array[3].split("/")[0] + " " + array[3].split("/")[1], array[4].split("/")[0] + " " + array[4].split("/")[1] ],
		 	 			datasets : [{
		 	 				label : "Promedio Final",
		 	 				backgroundColor : "rgba(88, 196, 88)",
		 	 				data : [array[0].split("/")[3], array[1].split("/")[3], array[2].split("/")[3], array[3].split("/")[3], array[4].split("/")[3] ],
		 	 			}] 			
		 	 	};
		 	 	
		 	 	var canvas = document.getElementById("chartDestacados").getContext('2d');
		 	 	
		 	 	window.bar = new Chart(canvas, {
		 	 		type : "bar",
		 	 		data : datos,
		 	 		options : {
		 	 		 elements :{
		 	 			rectangle : {
		 	 				borderWidth : 1,
		 	 				borderColor : "rgb(0, 255, 0)",
		 	 				borderSkipped : "bottom",
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
		 	 			  text : "Grafica de Alumnos Destacados"
		 	 		  }
		 	 		}	
		 	 	});
		 	  }
			}
        }
	});
}
//////////////////////////////////////////////////////////////
function reporteMinimasNotas() {
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ReporteMenosDestacados',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio
			
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var nombre = array[i].split("/")[0];
					var apellidopat = array[i].split("/")[1];
					var apellidomat = array[i].split("/")[2];
					var fina =  array[i].split("/")[3];
					
					var datos = {
			 	 			
			 	 			labels : [array[0].split("/")[0]+" "+array[0].split("/")[1], array[1].split("/")[0] + " " + array[1].split("/")[1], array[2].split("/")[0] + " " + array[2].split("/")[1]],
			 	 			datasets : [{
			 	 				label : "Promedio Final",
			 	 				backgroundColor : "rgba(159, 50, 30)",
			 	 				data : [array[0].split("/")[3], array[1].split("/")[3], array[2].split("/")[3]],
			 	 			}] 			
			 	 	};
			 	 	
			 	 	var canvas = document.getElementById("chartJalados").getContext('2d');
			 	 	
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
			 	 			  text : "Grafica de Alumnos Menos Destacados"
			 	 		  }
			 	 		}	
			 	 	});
				}
			}
        }
	});	
}
//////////////////////////////////////////////////
function reporteAprobadosDesaprobados() {
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	$.ajax({
			
		 type: 'POST',
	        url: '<%=request.getContextPath()%>/listarAprobadosDesaprobados',
	        data : {
	        	curso : cur,
				seccion : sec,
				periodo : per,
				anio : anio
				
			},
	        success: function(data)
	        {            	
	        	var array = data.split("$");
				
				if(data == "_"){
					alert("No hay registro de Alumnos");
				}else{
					for (var i = 0; i < array.length - 1; i++) {
						var aprobados    = array[i].split("/")[0];
						var desaprobados = array[i].split("/")[1];
						var total        = array[i].split("/")[2];
						
						 $('#tbl_porcentaje').append("<tr>" +
			  				  		"<td><center>"+((aprobados/total)*100)+"%"+"</center></td>" +
			  				  		"<td><center>"+((desaprobados/total)*100)+"%"+"</center></td>" +
			  				  	    "<td><center>"+((total/total)*100)+"%"+"</center></td>" +
			  				  		"</tr>");
					}
					var datos = {
			 	 			
							type : "pie",
			 	 			data : {
			 	 				datasets : [{
			 	 					data : [
			 	 						aprobados,
			 	 						desaprobados,
			 	 					],
			 	 					backgroundColor : [
			 	 						"#F7464A",
			 	 						"#46BFBD",
			 	 					],
			 	 				}],
			 	 				labels : [
			 	 					"Aprobados",
			 	 					"Desaprobados",
			 	 				]
			 	 			},
			 	 			options : {
			 	 				responsive : true,
			 	 			}
			 	 	};
			 	 	
			 	 	var canvas = document.getElementById("graficoAprobados").getContext('2d');
			 	 	
			 	 	window.pie = new Chart(canvas, datos);
				}
	        }
	});
}
////////////////////////////////////////////
</script>
</body>
</html>
