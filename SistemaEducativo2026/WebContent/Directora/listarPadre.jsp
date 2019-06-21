<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Listar Padre</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">

 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery.validate.js"></script>
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
			<li><a href="registrarPadre.jsp"><img src="../Imagenes/padre.png"   height="30" width="30">Registrar Padre</a></li>
			<li><a href="listarPadre.jsp"><img src="../Imagenes/cursos.png" height="30" width="30">Listar Padre</a></li>
			<li><a href="#"><img src="../Imagenes/report.png"    height="30" width="30">Lista Padres por Sección</a></li>
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
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Lista de Padres</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="modificarPadre.jsp"  id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 						<div class="container-fluid">
   	 								<br>
   	 								<input class="form-control" id="myInput" type="text" placeholder="Buscar Padre de Familia..">
   	 								<br>
   	 								<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 						</div>
   	 						<div class="table-responsive">
   	 							<table class="table table-hover" id="table_padres">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Pat.</th>
											<th style="text-align: center;">Apellido Mat.</th>
											<th style="text-align: center;">Edad</th>
											<th style="text-align: center;">Correo</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Direccion</th>
											<th style="text-align: center;">Telefono</th>
											<th style="text-align: center;">Fecha Nac.</th>
											<th style="text-align: center;">Trabaja</th>
											<th style="text-align: center;">Ocupación</th>
											<th style="text-align: center;">Tel.Trabajo</th>
											<th style="text-align: center;">Dire.Trabajo</th>
											<th style="text-align: center;">Estado Civil</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Pat.</th>
											<th style="text-align: center;">Apellido Mat.</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Edad</th>
											<th style="text-align: center;">Fecha Nac.</th>
											<th style="text-align: center;">Correo</th>
											<th style="text-align: center;">Ocupacion</th>
											<th style="text-align: center;">Telefono</th>
											<th style="text-align: center;">Casa Propia</th>
											<th style="text-align: center;">Cantidad de Personas Conviven</th>
											<th style="text-align: center;">Cantidad Hijos</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_padres">
	
									</tbody>
								</table>
							</div>
   	 				</div><br><br>
   	 			</div>
   	 			<input type="hidden" id="txtcodigo" name="txtcodigo" value="">
   	 			<input type="hidden" id="txtnombre" name="txtnombre" value="">
   	 			<input type="hidden" id="txtpaterno" name="txtpaterno" value="">
   	 			<input type="hidden" id="txtmaterno" name="txtmaterno" value="">
   	 			<input type="hidden" id="txtedad"   name="txtedad" value="">
   	 			<input type="hidden" id="txtcorreo" name="txtcorreo" value="">
   	 			<input type="hidden" id="txtdni" name="txtdni" value="">
   	 			<input type="hidden" id="txtdireccion" name="txtdireccion" value="">
   	 			<input type="hidden" id="txttelefono" name="txttelefono" value="">
   	 			<input type="hidden" id="fechanac" name="fechanac" value="">
   	 			<input type="hidden" id="trabaja" name="trabaja" value="">
   	 			<input type="hidden" id="ocupacion" name="ocupacion" value="">
   	 			<input type="hidden" id="teletrabajo" name="teletrabajo" value="">
   	 			<input type="hidden" id="direcciontrabajo" name="direcciontrabajo" value="">
   	 			<input type="hidden" id="estado" name="estado" value="">
   	 			<input type="hidden" id="nombremadre" name="nombremadre" value="">
   	 			<input type="hidden" id="paternomadre" name="paternomadre" value="">
   	 			<input type="hidden" id="maternomadre" name="maternomadre" value="">
   	 			<input type="hidden" id="dnimadre" name="dnimadre" value="">
   	 			<input type="hidden" id="edadmadre" name="edadmadre" value="">
   	 			<input type="hidden" id="fechamadre" name="fechamadre" value="">
   	 			<input type="hidden" id="correomadre" name="correomadre" value="">
   	 			<input type="hidden" id="ocupacionmadre" name="ocupacionmadre" value="">
   	 			<input type="hidden" id="telemadre" name="telemadre" value="">
   	 			<input type="hidden" id="casapropia" name="casapropia" value="">
   	 			<input type="hidden" id="personas" name="personas" value="">
   	 			<input type="hidden" id="hijos" name="hijos" value="">
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
    $("#tbl_padres tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarPadres',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    		 = array[i].split("|")[0];
				var nombre      	 = array[i].split("|")[1];
				var paterno    		 = array[i].split("|")[2];
				var materno      	 = array[i].split("|")[3];
				var edad		 	 = array[i].split("|")[4];
				var correo     		 = array[i].split("|")[5];
				var dni		         = array[i].split("|")[6];
				var direccion        = array[i].split("|")[7];
				var telefono    	 = array[i].split("|")[8];
				var nacimiento  	 = array[i].split("|")[9];
				var trabaja	   		 = array[i].split("|")[10] == "SI" ? "SI" : "NO";
				var ocupacion        = array[i].split("|")[11];
				var teletrabajo      = array[i].split("|")[12];
				var direccionTrabajo = array[i].split("|")[13];
				var estado		  	 = array[i].split("|")[14];		
				var nombremadre 	 = array[i].split("|")[15];
				var paternomadre 	 = array[i].split("|")[16];
				var maternomadre 	 = array[i].split("|")[17];
				var dnimadre	 	 = array[i].split("|")[18];
				var edadmadre 	 	 = array[i].split("|")[19];
				var fechamadre	 	 = array[i].split("|")[20];
				var correomadre 	 = array[i].split("|")[21];
				var ocupacionmadre 	 = array[i].split("|")[22];
				var telefonomadre 	 = array[i].split("|")[23];
				var casapropia	 	 = array[i].split("|")[24] == "1" ? "SI" : "NO";
				var cantidadcasa 	 = array[i].split("|")[25];
				var cantidadhijo 	 = array[i].split("|")[26];
				
				
				

				    $('#tbl_padres').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+nombre+"</center></td>" +
  				  		"<td><center>"+paterno+"</center></td>" +
  				  		"<td><center>"+materno+"</center></td>" +
  				  		"<td><center>"+edad+"</center></td>" +
  				  		"<td><center>"+correo+"</center></td>" +
  				  	    "<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+direccion+"</center></td>" +
  				  		"<td><center>"+telefono+"</center></td>" +
  				  		"<td><center>"+nacimiento+"</center></td>" +
  				  		"<td><center>"+trabaja+"</center></td>" +
  				  		"<td><center>"+ocupacion+"</center></td>" +
  				  		"<td><center>"+teletrabajo+"</center></td>" +
  				  		"<td><center>"+direccionTrabajo+"</center></td>" +
  						"<td><center>"+estado+"</center></td>" +
  						"<td><center>"+nombremadre+"</center></td>" +
  						"<td><center>"+paternomadre+"</center></td>" +
  						"<td><center>"+maternomadre+"</center></td>" +
  				  		"<td><center>"+dnimadre+"</center></td>" +
  						"<td><center>"+edadmadre+"</center></td>" +
  						"<td><center>"+fechamadre+"</center></td>" +
  						"<td><center>"+correomadre+"</center></td>" +
  						"<td><center>"+ocupacionmadre+"</center></td>" +
  						"<td><center>"+telefonomadre+"</center></td>" +
  						"<td><center>"+casapropia+"</center></td>" +
  						"<td><center>"+cantidadcasa+"</center></td>" +
  						"<td><center>"+cantidadhijo+"</center></td>" +
  						'<td><center><button type="submit" class="btn btn-primary" id="btnModificar" name="btnModificar">Modificar</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnEliminar" name="btnEliminar" >Eliminar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
///////////////////////////////////////////////////////////////////
$('#table_padres').on('click', '#btnModificar', function(){
	
	var codigo    = $(this).closest('tr').find("td").filter(":eq(0)").text();
	var nombre    = $(this).closest('tr').find("td").filter(":eq(1)").text();
	var paterno   = $(this).closest('tr').find("td").filter(":eq(2)").text();
	var materno   = $(this).closest('tr').find("td").filter(":eq(3)").text();
	var edad 	  = $(this).closest('tr').find("td").filter(":eq(4)").text();
	var correo    = $(this).closest('tr').find("td").filter(":eq(5)").text();
	var dni		  = $(this).closest('tr').find("td").filter(":eq(6)").text();
	var direccion = $(this).closest('tr').find("td").filter(":eq(7)").text();
	var telefono  = $(this).closest('tr').find("td").filter(":eq(8)").text();
	var fechanac  = $(this).closest('tr').find("td").filter(":eq(9)").text();
	var trabaja   = $(this).closest('tr').find("td").filter(":eq(10)").text();
	var ocupacion      = $(this).closest('tr').find("td").filter(":eq(11)").text();
	var teletrabajo    = $(this).closest('tr').find("td").filter(":eq(12)").text();
	var diretrabajo    = $(this).closest('tr').find("td").filter(":eq(13)").text();
	var estado	       = $(this).closest('tr').find("td").filter(":eq(14)").text();
	var nombremadre    = $(this).closest('tr').find("td").filter(":eq(15)").text();
	var paternomadre   = $(this).closest('tr').find("td").filter(":eq(16)").text();
	var maternomadre   = $(this).closest('tr').find("td").filter(":eq(17)").text();
	var dnimadre       = $(this).closest('tr').find("td").filter(":eq(18)").text();
	var edadmadre      = $(this).closest('tr').find("td").filter(":eq(19)").text();
	var fechamadre     = $(this).closest('tr').find("td").filter(":eq(20)").text();
	var correomadre    = $(this).closest('tr').find("td").filter(":eq(21)").text();
	var ocupacionmadre = $(this).closest('tr').find("td").filter(":eq(22)").text();
	var telemadre 	   = $(this).closest('tr').find("td").filter(":eq(23)").text();
	var casapropia	   = $(this).closest('tr').find("td").filter(":eq(24)").text();
	var cantidad	   = $(this).closest('tr').find("td").filter(":eq(25)").text();
	var hijos 		   = $(this).closest('tr').find("td").filter(":eq(26)").text();
	
	document.getElementById("txtcodigo").value = codigo;
	document.getElementById("txtnombre").value = nombre;
	document.getElementById("txtpaterno").value = paterno;
	document.getElementById("txtmaterno").value = materno;
	document.getElementById("txtedad").value = edad;
	document.getElementById("txtcorreo").value = correo;
	document.getElementById("txtdni").value = dni;
	document.getElementById("txtdireccion").value = direccion;
	document.getElementById("txttelefono").value = telefono;
	document.getElementById("fechanac").value = fechanac;
	document.getElementById("trabaja").value = trabaja;
	document.getElementById("ocupacion").value = ocupacion;
	document.getElementById("teletrabajo").value = teletrabajo;
	document.getElementById("direcciontrabajo").value = diretrabajo;
	document.getElementById("estado").value = estado;
	document.getElementById("nombremadre").value = nombremadre;
	document.getElementById("paternomadre").value = paternomadre;
	document.getElementById("maternomadre").value = maternomadre;
	document.getElementById("dnimadre").value = dnimadre;
	document.getElementById("edadmadre").value = edadmadre;
	document.getElementById("fechamadre").value = fechamadre;
	document.getElementById("correomadre").value = correomadre;
	document.getElementById("ocupacionmadre").value = ocupacionmadre;
	document.getElementById("telemadre").value = telemadre;
	document.getElementById("casapropia").value = casapropia;
	document.getElementById("personas").value = cantidad;
	document.getElementById("hijos").value = hijos;
	
	
});
//////////////////////////////////////////////////////////////
$('#table_padres').on('click', '#btnEliminar', function(){
	
	var codigo = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	eliminar=confirm("¿Deseas eliminar este Padre de Familia?");
	
	if(eliminar)
	{
		$.ajax({
			type: 'POST',
			url: '<%=request.getContextPath()%>/EliminarPadre',
			data: {
				codigo: codigo
			},
			success: function(data)
			{
				if (data != 0)
				{
					
					alert("Padre Eliminado");
					location.reload();
				}
				else 
				{
					alert("No se encontró al Padre de Familia");
					
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