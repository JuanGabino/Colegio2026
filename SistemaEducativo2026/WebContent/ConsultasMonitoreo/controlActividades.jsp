<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Control de Actividades Colegiado</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
 	
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="controlActividades.jsp" ><img src="../Imagenes/registro.ico" height="30" width="30"><strong>Control de Actividades</strong></a></li>
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
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Control de Actividades de Trabajo Colegiado</strong></h4>
   				</div>
   				<div class="panel-body">
   					<div class="row">
   						<div class="col-md-6">
   	 						<h4><strong>Área Curricular:</strong></h4>
           					<select class="form-control selectArea" id="selectArea"  >
			   					<option value="" selected disabled hidden>--Seleccionar--</option>
			   					<option value="CU1">Matematica</option>
			   					<option value="CU2">Comunicación</option>
			   					<option value="CU3">Inglés</option>
			   					<option value="CU4">Arte</option>
			   					<option value="CU5">Historia,Geografía y Economía</option>
			   					<option value="CU6">Formación Ciudadana y Civica</option>
			   					<option value="CU7">Persona,Familia y Relaciones Humanas</option>
			   					<option value="CU8">Educación Física</option>
			   					<option value="CU9">Educación Religiosa</option>
			   					<option value="CU10">Ciencia Tecnologia y Ambiente</option>
			   					<option value="CU11">Educación para el Trabajo</option>
	       					</select><br>
	       				</div>
	       				<div class="col-md-6" id="btnBuscarArea">
   	 						<br><br>
   	 						<button class="btn btn-primary" id="btnBuscar" name="btnBuscar" >Buscar Tareas</button>
   	 					</div>
   					</div><br>
   					<h4><strong>Lista de Actividades por Docente</strong></h4>
   					<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   					<div class="row table-responsive">
   	 					<table class="table table-hover table-bordered" id="table_docente">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Docente</th>
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
						</table><br>
   					</div>
   				</div>
   			</div><br>
   			<div class="panel panel-default">
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">Entrega de Documentos Trabajo Colegiado</strong></h4>
   				</div>
   				<div class="panel-body">
   					<div class="row table-responsive">
   						<form action="<%=request.getContextPath()%>/EntregablesColegiado" method="post" target="_blank">
   	 					<table class="table table-hover table-bordered" id="table_entregables">
									<thead class="thead-dark">
										<tr>
											<th style="text-align: center;">N°</th>
											<th style="text-align: center;">Código</th>
											<th style="text-align: center;">Código Docente</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Paterno</th>
											<th style="text-align: center;">Materno</th>
											<th style="text-align: center;">Títu</th>
											<th style="text-align: center;">Fecha Registro</th>
											<th style="text-align: center;">Entregable</th>
											<th style="text-align: center;">Estado</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_entregables">
	
									</tbody>
						</table><br>
						</form>
   					</div>
   				</div>
   			</div>
   	</div>
  </div>
</div>


									<!-- Modal -->
									<div id="myModal" class="modal fade" role="dialog">
 					 					<div class="modal-dialog">

   										<!-- Modal content-->
    										<div class="modal-content">
      											<div class="modal-header" style="background-color: #213758;">
        											<button type="button" class="close" data-dismiss="modal" >&times;</button>
        											<h4 class="modal-title" style="color: white;"><strong>GENERAR COMUNICADO</strong></h4>
      											</div>
      											<div class="modal-body"  id="exportContent">
        					
      												<div class="row">
      			 										<div class="col-md-6">
                         									<h5><strong>Fecha: </strong></h5>
                         									<div class="input-group date fj-date" data-provide="datepicker">
    															<input type="text" class="form-control" id="fechainicio" name="fechainicio">
    															<div class="input-group-addon">
        															<img src="../Imagenes/calendario.ico"   height="20" width="20">
    															</div>
						 									</div>
						 									<input type="hidden" class="form-control" id="fechareal" name="fechareal">
                    									</div>
       													<div class="col-md-6">
        													<h5><strong>CODIGO DOCENTE</strong></h5>
        													<input type="text" id="txtcodDocente" name="txtcodDocente" class="form-control" value="" disabled>
       													</div>
       													
      												</div>
      												<br>
      												<div class="row">
      													<div class="col-md-6">
        													<h5><strong>Titulo</strong></h5>
        													<input type="text" class="form-control" id="titulo" name="titulo">
       													</div>
       													<div class="col-md-6">
        													<h5><strong>Sección</strong></h5>
      														<select class="form-control selectSeccion" id="selectSeccion"  >
			   												<option value="" selected disabled hidden>--Seleccionar--</option>
			   												<option value="SEC1A">1ro Secundaria A</option>
			   												<option value="SEC1B">1ro Secundaria B</option>
			   												<option value="SEC1C">1ro Secundaria C</option>
			   												<option value="SEC1D">1ro Secundaria D</option>
			   												<option value="SEC2A">2do Secundaria A</option>
			   												<option value="SEC2B">2do Secundaria B</option>
			   												<option value="SEC2C">2do Secundaria C</option>
			   												<option value="SEC2D">2do Secundaria D</option>
			   												<option value="SEC3A">3ro Secundaria A</option>
			   												<option value="SEC3B">3ro Secundaria B</option>
			   												<option value="SEC3C">3ro Secundaria C</option>
			   												<option value="SEC3D">3ro Secundaria D</option>
			   												<option value="SEC4A">4to Secundaria A</option>
			   												<option value="SEC4B">4to Secundaria B</option>
			   												<option value="SEC4C">4to Secundaria C</option>
			   												<option value="SEC4D">4to Secundaria D</option>
			   												<option value="SEC5A">5to Secundaria A</option>
			   												<option value="SEC5B">5to Secundaria B</option>
			   												<option value="SEC5C">5to Secundaria C</option>
			   												<option value="SEC5D">5to Secundaria D</option>
	       													</select><br>
	       												</div>
      												</div>
      							    				<div class="container-row">
      							       					<div class="negrita">
                                            				<textarea name="comment" rows=5 cols=70 id="texto" name="texto" ></textarea>
        							   					</div>
      												</div>
      												<br>
      												<br>
      												<div class="row">
       													<button class="btn btn-success form-control" id="btn_registrar" name="btn_registrar">REGISTRAR COMUNICADO</button>
      												</div>
      										     </div>
      											<div class="modal-footer">
        											<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 								</div>
    					                    </div>

  					                    </div>
					                </div>
									<!-- FIN MODAL -->

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
/////////////////////////////////////////////
$(document).ready(function () {
    $("#fechainicio").keyup(function () {
        var value = $(this).val();
        var fe = $("#fechainicio").val();
   	    var inicio = fe.substring(6,10)+"-"+fe.substring(0,2)+"-"+fe.substring(3,5);
        $("#fechareal").val(inicio);
    });
});
///////////////////////////////////////////7
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
  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+" "+paterno+" "+materno+"</center></td>" +
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
        	  listarEntregables();
			}
        }
		
	});
	
});
////////////////////////////////////////////////
////////////////////////////////////////////////
function listarEntregables()
{
	var area = $("#selectArea").val();
	var vacio = "";
	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarActividades',
        data : {
        	area: area
        },
        success: function(data)
        {            	
        	var array = data.split("$");

			if(data == vacio)
			{
				alert("No hay registro de Entregables en esta áera curricular");
				
			}
			else{
				$('#tbl_entregables').empty();
				var  j = 1;
				for (var i = 0; i < array.length - 1; i++) {
					
					var codigo  		= array[i].split("|")[0];
					var docente  		= array[i].split("|")[1];
					var nombre  		= array[i].split("|")[2];
					var paterno         = array[i].split("|")[3];
					var materno  		= array[i].split("|")[4];
					var titulo 			= array[i].split("|")[5];
					var fecha	 		= array[i].split("|")[6];
					var archivo			= array[i].split("|")[7];
					var estado          = array[i].split("|")[8]; 

					if(estado == "No Revisado")
					{
						$('#tbl_entregables').append("<tr>" +
	  				    		"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+codigo+"<input type='hidden' id='codigo' name='codigo'></center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nombre+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+paterno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+materno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fecha+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-danger' id='btnNoRevisado' name='btnNoRevisado'>"+estado+"</button></center></td>"+
	  				  		'<td><center><button type="button" class="btn btn-warning" id="btnComunicado" name="btnComunicado" data-toggle="modal" data-target="#myModal">Comunicado</button></center></td>'+
	  				  			"</tr>");
		  				
	  				    j++;
					}
					else{
						
						$('#tbl_entregables').append("<tr>" +
								"<td style='font-size: 15px;'><center>"+j+"</center></td>" +
								"<td style='font-size: 15px;'><center>"+codigo+"<input type='hidden' id='codigo' name='codigo'></center></td>" +
	  				    		"<td style='font-size: 15px;'><center>"+docente+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+nombre+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+paterno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+materno+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+titulo+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center>"+fecha+"</center></td>" +
		  				  		"<td style='font-size: 15px;'><center><button type='submit' id='btnVer' name='btnVer'><img src='../Imagenes/archivopdf.png' height='40' width='50'></button></center></td>" +
	  				  			"<td><center><button type='button' class='btn btn-success'>"+estado+"</button></center></td>"+
		  				  		'<td><center><button type="button" class="btn btn-warning" id="btnComunicado" name="btnComunicado" data-toggle="modal" data-target="#myModal">Comunicado</button></center></td>'+
	  				  			"</tr>");
		  				
	  				    j++;
					}
				}
			}
        }
	});
	
}
///////////////////////////////////////////////////////
$('#table_entregables').on('click', '#btnComunicado', function(){

	var codigo = $(this).closest('tr').find("td").filter(":eq(2)").text();
	document.getElementById("txtcodDocente").value = codigo;
});
//////////////////////////////////////////////////////////////////
$('#table_entregables').on('click', '#btnNoRevisado', function(){
	
	var estado = "Revisado";
	var codigo = $(this).closest('tr').find("td").filter(":eq(1)").text();

	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ModificarEstadoColegiado',
        data: { 
        	estado	: estado,
        	codigo  : codigo
        
        },
        success: function(data)
        {
        	if (data == "1"){
        		
				listarEntregables();
 			}else {
 				
 				alert("No se pudo cambiar el estado. Listar la tabla de nuevo");
 			}	
        }
	});   
});
///////////////////////////////////////////////////////////////////7
$('#btn_registrar').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.texto       = $('#texto').val().trim();
	item.selectTipo  = $('#titulo').val();
	item.fecha       = $('#fechainicio').val();
	item.selectSeccion = $('#selectSeccion').val();
	item.txtdni        = $('#txtcodDocente').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#titulo').val() != "" || $('#fechareal').val() != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarComunicado',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro el Comunicado");
	    		 document.getElementById("texto").value = "";
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE REGISTRO COMUNICADO");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione un Tipo de Reunion");
	}
		
});
///////////////////////////////////////////////
$('#table_entregables').on('click', '#btnVer', function(){
	
	var id = $(this).closest('tr').find("td").filter(":eq(1)").text();
	
	console.log("codigo: " + id);
	
	document.getElementById("codigo").value = id;
	
});
</script>
</body>
</html>