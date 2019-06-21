<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Control de Asistencia Padres</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<style>
		#scroll {
    		overflow:scroll !important;
     		height:400px !important;
     		width: 100% !important;
     	
		}
		#scroll table {
	    	width:100% !important;
	    	margin-left: 10px;
		}

</style>
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="dashboardDocentes.jsp" ><img src="../Imagenes/rendimiento.png"height="30" width="30"><strong>Dashboard</strong></a></li>
			<li><a href="asistenciaPadres.jsp" ><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Reporte Asistencia Padres</strong></a></li>
			<li><a href="reporteObseracion.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Seguimiento de Observaciones por Alumno</strong></a></li>
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
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Reporte de Asistencia</strong></h4>
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
                        <div class="col-md-6">               
                             <h4><strong>Año:</strong></h4>
         					 <select class="form-control selectAno" id="selectAno">
		   							<option value="" selected disabled hidden>--Seleccionar Año--</option>
		   							<option value="2018">2018</option>
		   							<option value="2019">2019</option>
		   							<option value="2020">2020</option>				
	     					 </select>
                        </div>
   	 				</div><br><br>

   	 				<div class="row" id="divBotones">
   	 					<div class="col-md-6">
   	 						<div class="col-md-6 text-center">
   	 							<button class="btn btn-primary" id="btnBuscar" name="btnBuscar"><img src="../../Imagenes/buscar.ico"   height="20" width="20">&nbsp;Buscar Asistencias</button><br><br>
   	 						</div>
   	 						<div class="col-md-6 text-center">
   	 							<button class="btn btn-success" id="btnExcel" name="btnExcel"><img src="../../Imagenes/descarga.ico"   height="20" width="20">&nbsp;Descargar Excel</button>
   	 						</div>
   	 					</div>
   	 				</div><br><br>
   	 				
   	 				<div class="row table-responsive" id="scroll">
   	 					<table class="table table-hover table-bordered" id="table_docente">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Padre y/o Tutor</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Asistencia</th>
											<th style="text-align: center;">Faltas</th>
											<th style="text-align: center;">Total</th>
											<th style="text-align: center;">Estado</th>
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
$('#divBotones').on('click', '#btnBuscar', function(){
	
	var docente = $("#selectDocente").val().trim();
	var seccion = $("#selectSeccion").val().trim();
	var mes     = $("#selectMes").val().trim();
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ReporteAsistencia',
	    data: {
	    	
	    	docente: docente,
	    	seccion: seccion,
	    	mes: mes
	    },
		success: function(data)
        { 
			if(data == "vacio"){
				
				alert("No hay registro de asistencia");
				$('#tbl_docente').empty(); 
			}
			else{
        	  var array = data.split("$");
        	  $('#tbl_docente').empty();
        	  var j = 1;
        	  for (var i = 0; i < array.length - 1; i++) {
				var codigo   = array[i].split("/")[0];
				var nombre   = array[i].split("/")[1];
				var paterno  = array[i].split("/")[2];
				var materno  = array[i].split("/")[3];
				var dni      = array[i].split("/")[4];
				var asistencia 	 = array[i].split("/")[5];
				var falta 	 	 = array[i].split("/")[6];
				var total  	 	 = array[i].split("/")[7];
				var estado 	 	 = array[i].split("/")[8];
				
				if(estado == "Activo")
			  	{
				    $('#tbl_docente').append("<tr>" +
				    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+codigo+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+" "+paterno+" "+materno+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>"+
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+asistencia+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+falta+"</center></td>" +	
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+total+"</center></td>" +
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center><button class='btn btn-success'>"+estado+"</button></center></td>" +
				    "</tr>");
  				 }
  				 else
  				 {		
  					$('#tbl_docente').append("<tr>" +
  					    	"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+j+"</center></td>" +
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+codigo+"</center></td>" +
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+" "+paterno+" "+materno+"</center></td>" +
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+dni+"</center></td>"+
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+asistencia+"</center></td>" +	
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+falta+"</center></td>" +	
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+total+"</center></td>" +
  	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center><button class='btn btn-danger'>"+estado+"</button></center></td>" +
  						"</tr>");
  				 }
  				  		
				 j++;
			  }
			}
        }
		
	})
});
//////////////////////////////////////////////////////////
$('#btnExcel').click(function(){ 
	
	 var mes		  = document.getElementById("selectMes");	
	 var mesid        = mes.value;
	 var mesasi	      = mes.options[mes.selectedIndex].innerText; 
	 
	 var docente      = document.getElementById("selectDocente");
	 var docenteid    = docente.value;
	 var docasi 	  = docente.options[docente.selectedIndex].innerText;
	 
	 var seccion      = document.getElementById("selectSeccion");
	 var seccionid    = seccion.value;
	 var secasi   	  = seccion.options[seccion.selectedIndex].innerText;
	 
	 
	 alert("Exportando Asistencias a Excel en Escritorio")
	 
	 $.ajax({
		type : 'POST',
		url : '<%=request.getContextPath()%>/ReporteAsistenciaExcel',
		data : {
			seccion : $("#selectSeccion").val(),
			docente : $("#selectDocente").val(),
			mes     : $("#selectMes").val(),
			mesnom  : mesasi,
			secnom  : secasi,
			docnom  : docasi,
			anio    : $("#selectAno").val()
			
		}
	});
});

</script>
</body>
</html>