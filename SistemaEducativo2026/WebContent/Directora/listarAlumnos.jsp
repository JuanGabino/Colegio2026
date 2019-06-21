<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Listar Alumnos</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
</head>
<body style="background-color: #ECF0F1;">

<!-- BARRA DE MENÚ -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
			<li><a href="registrarAlumno.jsp"><img src="../Imagenes/registro.ico" height="30" width="30">Registrar Alumnos&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li><a href="listarAlumnos.jsp"><img src="../Imagenes/cursos.png" height="30" width="30">Mantenimiento Alumnos</a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<!-- CUERPO DE LA PAGINA --> 
<div id="modulos" class="container-row">
<!-- CUERPO -->
	<div class="container-row">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divPadres">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Lista de Alumnos</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="modificarAlumno.jsp"  id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 						<div class="container-fluid">
   	 								<br>
   	 								<input class="form-control" id="myInput" type="text" placeholder="Buscar Alumno...">
   	 								<br>
   	 								<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 						</div>
   	 						<div class="table-responsive">
   	 							<table class="table table-hover" id="table_alumnos">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Edad</th>
											<th style="text-align: center;">Fecha Nac.</th>
											<th style="text-align: center;">Correo</th>
											<th style="text-align: center;">Sección</th>
											<th style="text-align: center;">Padre/Tutor</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_alumnos">
	
									</tbody>
								</table>
							</div>
   	 				</div><br><br>
   	 			</div>
   	 			<input type="hidden" id="txtcodigo"  name="txtcodigo"   value="">
   	 			<input type="hidden" id="txtnombre"  name="txtnombre"   value="">
   	 			<input type="hidden" id="txtpaterno" name="txtpaterno"  value="">
   	 			<input type="hidden" id="txtmaterno" name="txtmaterno"  value="">
   	 			<input type="hidden" id="txtdni"     name="txtdni"      value="">
   	 			<input type="hidden" id="txtedad"    name="txtedad"     value="">
   	 			<input type="hidden" id="txtfechanac" name="txtfechanac" value="">
   	 			<input type="hidden" id="txtcorreo"   name="txtcorreo"   value="">
   	 			<input type="hidden" id="txtseccion"  name="txtseccion"  value="">
   	 			<input type="hidden" id="txtpadre"    name="txtpadre"    value="">
   	 		
   	 			</form>
   	 		</div>
   	 </div>
</div>

<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_alumnos tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarAlumnos',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    		 = array[i].split("|")[0];
				var nombre      	 = array[i].split("|")[1];
				var paterno    		 = array[i].split("|")[2];
				var materno      	 = array[i].split("|")[3];
				var dni			 	 = array[i].split("|")[4];
				var edad     		 = array[i].split("|")[5];
				var fechanac         = array[i].split("|")[6];
				var correo	         = array[i].split("|")[7];
				var seccion     	 = array[i].split("|")[8];
				var padre		  	 = array[i].split("|")[9];
								

				    $('#tbl_alumnos').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+nombre+"</center></td>" +
  				  		"<td><center>"+paterno+"</center></td>" +
  				  		"<td><center>"+materno+"</center></td>" +
  				  	    "<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+edad+"</center></td>" +
  				  		"<td><center>"+fechanac+"</center></td>" +
  				  		"<td><center>"+correo+"</center></td>" +
  				  		"<td><center>"+seccion+"</center></td>" +
  				  		"<td><center>"+padre+"</center></td>" +
  						'<td><center><button type="submit" class="btn btn-primary" id="btnModificar" name="btnModificar">Modificar</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnEliminar" name="btnEliminar" >Eliminar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
///////////////////////////////////////////////////////
$('#table_alumnos').on('click', '#btnModificar', function(){
	
	var codigo    = $(this).closest('tr').find("td").filter(":eq(0)").text();
	var nombre    = $(this).closest('tr').find("td").filter(":eq(1)").text();
	var paterno   = $(this).closest('tr').find("td").filter(":eq(2)").text();
	var materno   = $(this).closest('tr').find("td").filter(":eq(3)").text();
	var dni 	  = $(this).closest('tr').find("td").filter(":eq(4)").text();
	var edad      = $(this).closest('tr').find("td").filter(":eq(5)").text();
	var fechanac  = $(this).closest('tr').find("td").filter(":eq(6)").text();
	var correo    = $(this).closest('tr').find("td").filter(":eq(7)").text();
	var seccion   = $(this).closest('tr').find("td").filter(":eq(8)").text();
	var padre     = $(this).closest('tr').find("td").filter(":eq(9)").text();

	
	document.getElementById("txtcodigo").value = codigo;
	document.getElementById("txtnombre").value = nombre;
	document.getElementById("txtpaterno").value = paterno;
	document.getElementById("txtmaterno").value = materno;
	document.getElementById("txtdni").value = dni;
	document.getElementById("txtedad").value = edad;
	document.getElementById("txtfechanac").value = fechanac;
	document.getElementById("txtcorreo").value = correo;
	document.getElementById("txtseccion").value = seccion;
	document.getElementById("txtpadre").value =  padre;

});
/////////////////////////////////////////////////////
$('#table_alumnos').on('click', '#btnEliminar', function(){
	
	var codigo = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	eliminar=confirm("¿Deseas eliminar este Alumno?");
	
	if(eliminar)
	{
		$.ajax({
			type: 'POST',
			url: '<%=request.getContextPath()%>/EliminarAlumno',
			data: {
				codigo: codigo
			},
			success: function(data)
			{
				if (data != 0)
				{
					
					alert("Alumno Eliminado.");
					location.reload();
				}
				else
				{
					alert("No Existe el Alumno que desea Eliminar");
					
				}
			}
		});
	}
	else
	{
		alert("No se elimino registro");
	}
});
</script>
</body>
</html>