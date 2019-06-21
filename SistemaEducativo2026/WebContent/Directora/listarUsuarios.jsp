<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Listar Usuarios</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">

 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
</head>
<body>

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
			<li><a href="modificarUsuarios.jsp"><img src="../Imagenes/report.png"    height="30" width="30">Lista de Usuarios</a></li>
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
    			<div class="panel-heading">
	  				<h4><img src="../Imagenes/lista.png" height="40" width="50"><strong>Modificar Usuarios</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="container-fluid" id="divBotones">
   	 					<div class="col-md-6">
   	 						<br>
   	 						<button class="form-control btn btn-success" id="listarDocentes" name="listarDocentes"><strong>Listar Usuario Docente</strong></button><br>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<br>
   	 						<button class="form-control btn btn-success" id="listarPadres" name="listarPadres"><strong>Listar Usuario Padres</strong></button>
   	 					</div>
   	 				</div>
   	 				<div class="container-fluid">
   	 					<br><br><br>
   	 					<input class="form-control" id="myInput" type="text" placeholder="Buscar..">
   	 					<br>
   	 				</div><br>
   	 				<div class="row">
   	 						<div class="table-responsive">
   	 							<table class="table table-hover" id="table_usuarios">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">Usuario</th>
											<th style="text-align: center;">Contraseña</th>
											<th style="text-align: center;">Nombre y Apellidos</th>
											<th style="text-align: center;">Correo</th>
											<th style="text-align: center;">Perfil</th>
											<th style="text-align: center;">Fecha de Creación</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_usuario">
	
									</tbody>
								</table>
							</div>
   	 				</div><br><br>
   	 			</div>
   	 		</div>
   		</div>
   	</div>
</div>

<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_usuario tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
$('#divBotones').on('click', '#listarDocentes', function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarUsuarioDocente',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	var per = "";
        	$('#tbl_usuario').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    		 = array[i].split("|")[0];
				var dni       		 = array[i].split("|")[1];
				var pass    		 = array[i].split("|")[2];
				var nombre      	 = array[i].split("|")[3];
				var apellidopat 	 = array[i].split("|")[4];
				var apellidomat      = array[i].split("|")[5];
				var correo           = array[i].split("|")[6];
				var perfil           = array[i].split("|")[7];
				var fechacreada      = array[i].split("|")[8];
				if(perfil == 2)
				{
					per = "Docente";
				}
				    $('#tbl_usuario').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+pass+"</center></td>" +
  				  		"<td><center>"+nombre+" "+apellidopat+" "+apellidomat+"</center></td>" +
  						"<td><center>"+correo+"</center></td>" +
  						"<td><center>"+per+"</center></td>" +
  				  		"<td><center>"+fechacreada+"</center></td>" +
  						'<td><center><button type="submit" class="btn btn-primary" id="btnModificar" name="btnModificar">Modificar</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnEliminar" name="btnEliminar" >Eliminar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
///////////////////////////////////////////////////////
$('#divBotones').on('click', '#listarPadres', function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarUsuarioPadres',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	var per = "";
        	$('#tbl_usuario').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    		 = array[i].split("|")[0];
				var dni       		 = array[i].split("|")[1];
				var pass    		 = array[i].split("|")[2];
				var nombre      	 = array[i].split("|")[3];
				var apellidopat 	 = array[i].split("|")[4];
				var apellidomat      = array[i].split("|")[5];
				var correo           = array[i].split("|")[6];
				var perfil           = array[i].split("|")[7];
				var fechacreada      = array[i].split("|")[8];
				if(perfil == 3)
				{
					per = "Padre";
				}
				
				    $('#tbl_usuario').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+pass+"</center></td>" +
  				  		"<td><center>"+nombre+" "+apellidopat+" "+apellidomat+"</center></td>" +
  						"<td><center>"+correo+"</center></td>" +
  						"<td><center>"+per+"</center></td>" +
  				  		"<td><center>"+fechacreada+"</center></td>" +
  						'<td><center><button type="submit" class="btn btn-primary" id="btnModificar" name="btnModificar">Modificar</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnEliminar" name="btnEliminar" >Eliminar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
</script>
</body>
</html>