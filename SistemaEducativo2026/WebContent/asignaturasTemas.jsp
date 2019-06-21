<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <title>Registro de Notas</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/encabezado.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
 <script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
</head>
<body>

  <header id="header" class="header">
   <div class="container">
    <h1><strong>Sistema Educativo 2026</strong></h1>
    <h2>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong></h2>
    <h3>MÓDULO DE REGISTRO DE NOTAS</h3>
   </div>
  </header>
  <br>
<%
   String curso = request.getParameter("txtcurso");
   String idcurso = request.getParameter("txtIdCurso");

%>   
<div id="modulos" class="container-row">  
  <div class="container-row">
  		<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  </div>
  <br><br> 
  
  <div class="container-row">
  
   <div class="col-md-3">
    <section id="menu">
   
     <ul>
      <a href="asignaturasDocente.jsp"><img src="Imagenes/registro.ico" height="40" width="50"><strong>Registro de Notas</strong></a>
      <a href="asignaturasClases.jsp"><img src="Imagenes/libro.png" height="40" width="50"><strong>Gestión de Clases</strong></a>
      <a href="reportesCursos.jsp" ><img src="Imagenes/report.png" height="40" width="50"><strong>Reporte Bimestral</strong></a>
      <a href="reportesAlumnos.jsp" ><img src="Imagenes/reportAlumno.png" height="40" width="50"><strong>Reportes Por Alumno</strong></a>
      <br>
      <br>
      <a href="index.jsp"><img src="Imagenes/notas.ico" height="40" width="50"><strong>Regresar</strong></a>
     </ul>
  
    </section>
   </div>
   
   <div class="col-md-9" id="contenido">
    	<div class="panel panel-default" >

			<!-- ENCABEZADO -->
			<div class="panel-heading">
	  			<h3 style="font-family: fantasy;"><strong><img src="Imagenes/calendar.png" height="40" width="50">Período</strong></h3>
	  			<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   			</div>
   			<button></button>
   	
   			<!-- CUERPO -->
   			<div class="panel-body">
				<div class="row">
				 <div class="col-md-4">
				 	<h4><strong>Curso:</strong></h4>
				 	<input type="text" id="txtcurso" class="form-control" value="<%out.print(curso); %>"name="txtcurso" disabled>
	   	 		 	<input type="hidden" id="txtIdcurso" value="<%out.print(idcurso); %>"name="txtIdcurso" disabled>
				 </div>
				 <div class="col-md-3">
				    <br><br>
				    <a href="asignaturasClases.jsp" style="text-decoration: none;"><button class="btn btn-info" type="button"  style="margin-left: 50px; font-size: 20px;">Regresar a Lista de Cursos</button></a>
				 </div>
				</div>
				<div class="row">
					<div class="col-md-6">
         				<h4><strong>Seccion:</strong></h4>
         				<select class="form-control selectSeccion" id="selectSeccion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	     				</select><br>
	     				<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	   			    </div>	
	   				<div class="col-md-3" id="divBuscarAlumnos">
	    					<br><br>
	    					<button type="button" class="btn btn-primary" id="btnBuscar"> <strong>Buscar</strong> </button>
	   				</div>
				</div>
				<br><br>
				<div class="row">
				 <div class="col-md-3">
				 		<a href="#" style="text-decoration: none;" id="bimestre1"><strong>1ER BIMESTRE</strong></a>
				 </div>
				 <div class="col-md-3">
				 		<a href="#" style="text-decoration: none;" id="bimestre2"><strong>2DO BIMESTRE</strong></a>
				 </div>
				 <div class="col-md-3">
				 		<a href="#" style="text-decoration: none;" id="bimestre3"><strong>3ER BIMESTRE</strong></a>
				 </div>
				 <div class="col-md-3">
				 		<a href="#" style="text-decoration: none;" id="bimestre4"><strong>4TO BIMESTRE</strong></a>
				 </div>
				</div>
				<br><br>
				<div class="row" id="periodos">
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
        						<h4 class="modal-title" style="color: white;"><strong>REGISTRAR CLASE</strong></h4>
      						</div>
      						<div class="modal-body"  id="exportContent">    
      								<div class="row">
      			 						<div class="col-md-4">
        									<h5><strong>BIMESTRE</strong></h5>
        									<input type="text"  class="form-control" name="bimestre" id="bimestre" disabled>
       									</div>	
      								</div>
      						 <form action="" method="post">
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Nombre:</strong></h5>
      								 	<input type="text" class="form-control" placeholder="Nombre de Clase"> 
      								</div>
      								<br>
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Descripcion:</strong></h5>
      								 	<input type="text" class="form-control" placeholder="Descripcion de la Clase"> 
      								</div>
      								<br>
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Fecha:</strong></h5>
      								 	<div class="input-group date fj-date" data-provide="datepicker">
    											<input type="text" class="form-control">
    											<div class="input-group-addon">
        											<span class="glyphicon glyphicon-th"></span>
    											</div>
										</div>
      								</div>
      								<br><br>
      								<div class="row">
      									<div class="col-md-6">
      										<button class="btn btn-success" type="button" id="registrarClase" name="registrarClase">Registrar Clase</button>
      									</div>
      									<div class="col-md-6">
      										<button class="btn btn-primary" type="reset" id="limpiarClase" name="limpiarClase">Limpiar Campos</button>
      									</div>
      								</div>
      							</form>
      					     </div>
      					     <div class="modal-footer">
        				    	<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 			 </div> 
      					</div>
      				</div>
    			   </div>
				   <!-- FIN MODAL -->
				   
				   <!-- Modal -->
					<div id="myModal2" class="modal fade" role="dialog">
 					 <div class="modal-dialog">

   					<!-- Modal content-->
    					<div class="modal-content">
      						<div class="modal-header" style="background-color: #213758;">
        						<button type="button" class="close" data-dismiss="modal" >&times;</button>
        						<h4 class="modal-title" style="color: white;"><strong>MODIFICAR CLASE</strong></h4>
      						</div>
      						<div class="modal-body"  id="exportContent">    
      								<div class="row">
      			 						<div class="col-md-4">
        									<h5><strong>BIMESTRE</strong></h5>
        									<input type="text"  class="form-control" name="txtbimestre" id="txtbimestre" disabled>
       									</div>	
      								</div>
      						 <form action="" method="post">
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Nombre:</strong></h5>
      								 	<input type="text" class="form-control" placeholder="Nombre de Clase"> 
      								</div>
      								<br>
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Descripcion:</strong></h5>
      								 	<input type="text" class="form-control" placeholder="Descripcion de la Clase"> 
      								</div>
      								<br>
      								<div class="container-fluid">
      									<hr style="border-color: #3E7BC0; border-width: 5px;" />
      								 	<h5><strong>Fecha:</strong></h5>
      								 	<div class="input-group date fj-date" data-provide="datepicker">
    											<input type="text" class="form-control">
    											<div class="input-group-addon">
        											<span class="glyphicon glyphicon-th"></span>
    											</div>
										</div>
      								</div>
      								<br><br>
      								<div class="row">
      									<div class="col-md-6">
      										<button class="btn btn-success" type="button" id="registrarClase" name="modificarClase">Modificar Clase</button>
      									</div>
      									<div class="col-md-6">
      										<button class="btn btn-primary" type="reset" id="limpiarClase" name="limpiarClase">Limpiar Campos</button>
      									</div>
      								</div>
      							</form>
      					     </div>
      					     <div class="modal-footer">
        				    	<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 			 </div> 
      					</div>
      				</div>
    			   </div>
				   <!-- FIN MODAL -->
				   
				   <!-- Modal -->
					<div id="myModal4" class="modal fade" role="dialog">
 					 <div class="modal-dialog">

   					<!-- Modal content-->
    					<div class="modal-content">
      						<div class="modal-header" style="background-color: #213758;">
        						<button type="button" class="close" data-dismiss="modal" >&times;</button>
        						<h4 class="modal-title" style="color: white;"><strong>ASISTENCIA A CLASE</strong></h4>
      						</div>
      						<div class="modal-body"  id="exportContent">    
      								<div class="row">
      			 						<div class="col-md-3">
        									<h4><strong>BIMESTRE</strong></h4>
        									<input type="text"  class="form-control" name="txtperiodo" id="txtperiodo" disabled>
       									</div>
      								</div>
      								<br><br>
      								<div class="container-fluid">
           									<table id="Table" class="table">
            									<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             										<tr>
              											<th><center>NOMBRE</center></th>
              											<th><center>APELLIDO PATERNO</center></th>
              											<th><center>APELLIDO MATERNO</center></th>
              											<th></th>
             										</tr>
            									</thead>
            
            									<tbody id="tbl_alumno"> 
              
            									</tbody>
           									</table>
      								</div>
      								<div class="row">
      									<div class="col-md-6">
      										<button class="btn btn-success" type="button" id="registrarClase" name="modificarClase">Modificar Clase</button>
      									</div>
      									<div class="col-md-6">
      										<button class="btn btn-primary" type="reset" id="limpiarClase" name="limpiarClase">Limpiar Campos</button>
      									</div>
      								</div>
      					     </div>
      					     <div class="modal-footer">
        				    	<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 			 </div> 
      					</div>
      				</div>
    			   </div>
				   <!-- FIN MODAL -->
				   
  </div>
</div>
<script type="text/javascript">
$('#bimestre1').on('click', function(){
	
  var bim = 1;
  $.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarBimestre',
	    data: {
	    	
	    	bimestre : bim
	    },
	    success: function(data)
        { 
      	
	    	var array = data.split("$");
	    	$('#periodos').empty();
      		for (var i=0; i< array.length - 1; i++) 
      		{
      			var descr  = array[i].split("-")[0];
			    var seman  = array[i].split("-")[1];
			    for( var j = 1; j<=seman; j++)
			    {
      				$('#periodos').append(
      					 '<div class="container-fluid">'+
      					 	'<hr style="border-color: #3E7BC0; border-width: 5px;" />'+
      					 	'<h3 style="color: #3E7BC0;"><strong><img src="Imagenes/semanas.png" height="40" width="50">Semana'+j+'</strong></h3>'+
      					 	'<div class="container-fluid">' +
      					 	    '<br><br>' +
      					 	    '<input type="hidden" value="' + j +'" id="semana">' +
					 			'<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnRegistrar">Registrar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 			'<button class="btn btn-primary" data-toggle="modal" data-target="#myModal2" >Modificar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 			'<button class="btn btn-warning" data-toggle="modal" data-target="#myModal3" >Visualizar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 			'<button class="btn btn-danger"  data-toggle="modal" data-target="#myModal4" >Asistencia</button>' +
					 		'</div>' +
      					 '</div>'
      			 		
      			 	);
			    }
      		}
      	}
		
	});
	document.getElementById("bimestre").value = "Primer Bimestre";
	document.getElementById("txtbimestre").value = "Primer Bimestre";
	document.getElementById("txtperiodo").value = "Primer Bimestre";
});
////////////////////////////////////////////////////////////
$('#bimestre2').on('click', function(){
	
  var bim = 2;
  $.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarBimestre',
	    data: {
	    	
	    	bimestre : bim
	    },
	    success: function(data)
        { 
      	
	    	var array = data.split("$");
	    	$('#periodos').empty();
      		for (var i=0; i< array.length - 1; i++) 
      		{
      			var descr  = array[i].split("-")[0];
			    var seman  = array[i].split("-")[1];
			    for( var j = 1; j<=seman; j++)
			    {
      				$('#periodos').append(
      					 '<div class="container-fluid">'+
      					 	'<hr style="border-color: #3E7BC0; border-width: 5px;" />'+
      					 	'<h3 style="color: #3E7BC0;"><strong><img src="Imagenes/semanas.png" height="40" width="50">Semana'+j+'</strong></h3>'+
      					 	'<div class="container-fluid">' +
      					 	    '<br><br>' +
      					 		'<input type="hidden" value="' + j +'" id="semana">' +
				 				'<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnRegistrar">Registrar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
				 				'<button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">Modificar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
				 				'<button class="btn btn-warning" data-toggle="modal" data-target="#myModal3">Visualizar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 			'<button class="btn btn-danger"  data-toggle="modal" data-target="#myModal4" >Asistencia</button>' +
					 		'</div>' +
      					 '</div>'
      			 		
      			 	);
			    }
      		}
      	}
		
	});
  document.getElementById("bimestre").value = "Segundo Bimestre";
  document.getElementById("txtbimestre").value = "Segundo Bimestre";
  document.getElementById("txtperiodo").value = "Segundo Bimestre";
});
///////////////////////////////////////////////////////////////
$('#bimestre3').on('click', function(){
	
  var bim = 3;
  $.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarBimestre',
	    data: {
	    	
	    	bimestre : bim
	    },
	    success: function(data)
        { 
      	
	    	var array = data.split("$");
	    	$('#periodos').empty();
      		for (var i=0; i< array.length - 1; i++) 
      		{
      			var descr  = array[i].split("-")[0];
			    var seman  = array[i].split("-")[1];
			    for( var j = 1; j<=seman; j++)
			    {
      				$('#periodos').append(
      					 '<div class="container-fluid">'+
      					 	'<hr style="border-color: #3E7BC0; border-width: 5px;" />'+
      					 	'<h3 style="color: #3E7BC0;"><strong><img src="Imagenes/semanas.png" height="40" width="50">Semana'+j+'</strong></h3>'+
      					 	'<div class="container-fluid">' +
      					 	    '<br><br>' +
      					 		'<input type="hidden" value="' + j +'" id="semana">' +
				 				'<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnRegistrar">Registrar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
				 				'<button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">Modificar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
				 				'<button class="btn btn-warning" data-toggle="modal" data-target="#myModal3">Visualizar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 			'<button class="btn btn-danger"  data-toggle="modal" data-target="#myModal4" >Asistencia</button>' +
					 		'</div>' +
      					 '</div>'
      			 		
      			 	);
			    }
      		}
      	}
	    
	});
  document.getElementById("bimestre").value = "Tercer Bimestre";
  document.getElementById("txtbimestre").value = "Tercer Bimestre";
  document.getElementById("txtperiodo").value = "Tercer Bimestre";
});
/////////////////////////////////////////////////////////////
$('#bimestre4').on('click', function(){
	
  var bim = 4;
  $.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarBimestre',
	    data: {
	    	
	    	bimestre : bim
	    },
	    success: function(data)
        { 
      	
	    	var array = data.split("$");
	    	$('#periodos').empty();
      		for (var i=0; i< array.length - 1; i++) 
      		{
      			var descr  = array[i].split("-")[0];
			    var seman  = array[i].split("-")[1];
			    for( var j = 1; j<=seman; j++)
			    {
      				$('#periodos').append(
      					 '<div class="container-fluid">'+
      					 	'<hr style="border-color: #3E7BC0; border-width: 5px;" />'+
      					 	'<h3 style="color: #3E7BC0;"><strong><img src="Imagenes/semanas.png" height="40" width="50">Semana'+j+'</strong></h3>'+
      					 		'<div id="registroClase" class="container-fluid">' + 
      					 		    '<br><br>' +
      					 			'<input type="hidden" value="' + j +'" id="semana">' +
					 				'<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnRegistrar">Registrar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 				'<button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">Modificar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
					 				'<button class="btn btn-warning" data-toggle="modal" data-target="#myModal3">Visualizar Clase</button>&nbsp&nbsp&nbsp&nbsp' +
						 			'<button class="btn btn-danger"  data-toggle="modal" data-target="#myModal4" >Asistencia</button>' +
      					 		'</div>' +
      					 '</div>'
      			 		
      			 	);
			    }
      		}
      	}
		
	});
  document.getElementById("bimestre").value = "Cuarto Bimestre";
  document.getElementById("txtbimestre").value = "Cuarto Bimestre";
  document.getElementById("txtperiodo").value = "Cuarto Bimestre";
});
//////////////////////////////////
  $('.fj-date').datepicker({
	  
	  format: "dd/mm/yy"
  });
////////////////////////////////////////////////
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
///////////////////////////////////////////////////
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione una Sección");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarAlumnoxSeccion',
        data : {
			seccion : sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("=")[0];
					var nombre = array[i].split("=")[1];
					var apellidopat = array[i].split("=")[2];
					var apellidomat = array[i].split("=")[3];
	
					

  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+nombre+"</center></td>" +
	  				  		"<td><center>"+apellidopat+"</center></td>" +
	  				  	    "<td><center>"+apellidomat+"</center></td>" +
	  				  		'<td><center><select class="form-control" id="selectAsistencia" name="selectAsistencia">' +
	  				  		   '<option value="" selected disabled hidden>Seleccionar</option>' +
	  				  		   '<option value="Asistio">Asistio</option>'+
	  				  		   '<option value="Tardanza">Tardanza</option>'+
	  				  		   '<option value="Faltó">Falto</option>'+
	  				  		'</select></center></td>' +
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
/////////////////////////////////////////////////////////////////////
</script>

</body>
</html>
