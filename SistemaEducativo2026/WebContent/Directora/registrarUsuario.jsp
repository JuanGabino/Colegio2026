<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>  
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Registrar Usuarios</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootsnav.css">
    
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
</head>
<body style="background-color: #ECF0F1;">

<%
    String nombre, apepat, apemat, correo, dni, fecha;
    nombre = request.getParameter("txtnom");
    apepat = request.getParameter("txtpat");
    apemat = request.getParameter("txtmat");
    correo = request.getParameter("txtcorreo");
    dni    = request.getParameter("txtnumdoc");
    fecha  = request.getParameter("fechamysql");
%>

<!-- BARRA DE MENÚ -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
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
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Creacion de Usuario</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni" >               
                             <h4><strong>Nº de Documento</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" value="<%= dni %>" id="txtnumdoc" name="txtnumdoc" disabled>
                                       <input type="hidden" class="form-control" value="<%= fecha %>" id="txtfecha" name="txtfecha" disabled>
                                  </div>
                             </div>
                        </div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control" value="<%= nombre %>" name="txtnombre" id="txtnombre" disabled>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control" value="<%= apepat %>"  name="txtapepat" id="txtapepat" disabled>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control" value="<%= apemat %>" name="txtapemat" id="txtapemat" disabled>
   	 					</div>
   	 				</div><br> 
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="email" class="form-control" value="<%= correo %>"  name="txtemail" id="txtemail" disabled>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha de Creación: </strong></h4>
                         	<input type="text" class="form-control" name="fechaRegistro" id="fechaRegistro" disabled>
   	 					</div>
   	 					<div class="col-md-4">
							<h4><strong>Perfil:</strong></h4>
           					<select class="form-control selectPerfil" id="selectPerfil">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	       					</select><br>
   	 					</div>
   	 				</div><br>
   	 			</div>
   	 		</div>
   	 		<br>
   	 		<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divUsuario">
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Datos de Usuario</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<h4><strong>Contraseña:</strong></h4>
   	 						<input type="password" class="form-control" name="txtcontra" id="txtcontra">
   	 					</div>
   	 					<div class="col-md-6">
   	 						<h4><strong>Confirmar Contraseña:</strong></h4>
   	 						<input type="password" class="form-control" name="txtconfi" id="txtconfi" >
   	 					</div>
   	 				</div><br>
   	 				<div class="row"><br>
   	 					<div class="col-md-6">
   	 						<button class="btn btn-success form-control" id="btnCrear" name="btnCrear">Crear Usuario</button>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<button class="btn btn-danger form-control" id="btnCancelar" name="btnCancelar">Cancelar</button>
   	 					</div>
   	 				</div>
   	 			</div>
    		</div>
   		</div>
	</div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootsnav.js"></script>

<!-- SCRIPT -->
<script type="text/javascript">
	n =  new Date();
	//Año
	y = n.getFullYear();
	//Mes
	m = n.getMonth() + 1;
	//Día
	d = n.getDate();

	//Lo ordenas a gusto.
	document.getElementById("fechaRegistro").value = d + "/" + m + "/" + y;
/////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarPerfil',
		success: function(data)
        { 
			$('#selectPerfil').empty();
        	$('#selectPerfil').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectPerfil').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////7
$('#btnCrear').on('click', function(){
	
	var vacio = "";
	var per   = document.getElementById("selectPerfil");
	var perfildescrip = per.options[per.selectedIndex].innerText;
	var nueva1 = $('#txtcontra').val().trim();
	var nueva2 = $('#txtconfi').val().trim();
	
	
	var linea = [];
	var item = {};
	
	item.dni       = $('#txtnumdoc').val().trim();
	item.password  = $('#txtcontra').val().trim();
	item.nombre    = $('#txtnombre').val().trim();
	item.paterno   = $('#txtapepat').val().trim();
	item.materno   = $('#txtapemat').val().trim();
	item.correo    = $('#txtemail').val().trim();
	item.perfil    = $('#selectPerfil').val();

	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#selectPerfil').val() == vacio || nueva1 ==vacio || nueva2 == vacio)
	{
	  alert("Falta llenar campos obligatorios"); 
	}
	else
	{
		if(nueva1 == nueva2 )
		  {
		 	$.ajax({
			
				type: 'POST',
				url: '<%=request.getContextPath()%>/RegistrarUsuario',
				dataType: 'JSON',
				data: {
					objetojson:JSON.stringify(datosxlinea)
				},
				success: function(data)
				{
				
					if(data == "1")
		    	 	{
		    		 	alert("Se registro al Usuario " + perfildescrip);
		   				window.location.href ="<%=request.getContextPath()%>/index.jsp";
		    	 	}
		    	 	else
		    	 	{
		    		 	alert("No se pudo registrar al Usuario");
		    	 	}
				}
			
		 	});
		  }
		  else
		  {
			  alert("Las contraseñas no coinciden");
			  document.getElementById("txtcontra").value = "";
			  document.getElementById("txtconfi").value = "";
		  }
	}
		
});
</script>
</body>
</html>