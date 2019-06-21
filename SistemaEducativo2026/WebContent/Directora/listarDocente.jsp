<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Lista de Docentes</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootsnav.css">
    
    <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery.validate.js"></script>
	
</head>
<body style="background-color: #ECF0F1;">

<!-- BARRA DE MENÚ -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;Sistema Educativo 2026</a></li>
			<li><a href="registrarDocente.jsp"><img src="../Imagenes/docente.png"   height="30" width="30">Registrar Docente&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
      		<li><a href="listarDocente.jsp"><img src="../Imagenes/report.png"    height="30" width="30">Listar Docentes</a></li>
      		<li><a href="asignarCursoDocente.jsp"><img src="../Imagenes/cursos.png" height="30" width="30">Asignar Curso Docente&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
      		<li><a href="listarcursosDocentes.jsp"><img src="../Imagenes/report.png"    height="30" width="30">Listar Cursos por Docentes</a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>


<!-- CUERPO DE LA PAGINA --> 
<div id="modulos" class="container-row">
	<!-- CUERPO -->
	<div class="container-row">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Lista de Docentes</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="modificarDocente.jsp"  id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 						<div class="container-fluid">
   	 								<br>
   	 								<input class="form-control" id="myInput" type="text" placeholder="Buscar Docente..">
   	 								<br>
   	 								<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 						</div>
   	 						<div class="table-responsive">
   	 							<table class="table table-hover" id="table_docente">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Pat.</th>
											<th style="text-align: center;">Apellido Mat.</th>
											<th style="text-align: center;">Correo</th>
											<th style="text-align: center;">Telefono</th>
											<th style="text-align: center;">Edad</th>
											<th style="text-align: center;">Fecha Nac.</th>
											<th style="text-align: center;">Fecha Contrato</th>
											<th style="text-align: center;">Carrera Publica Mag.</th>
											<th style="text-align: center;">Titulado</th>
											<th style="text-align: center;">Magister</th>
											<th style="text-align: center;">Doctorado</th>
											<th style="text-align: center;">Turno</th>
											<th style="text-align: center;">Nivel</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
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
   	 			<input type="hidden" id="txtturno" name="txtturno" value="">
   	 			<input type="hidden" id="txtcorreo" name="txtcorreo" value="">
   	 			<input type="hidden" id="fechacontrato" name="fechacontrato" value="">
   	 			<input type="hidden" id="fechanacimiento" name="fechanacimiento" value="">
   	 			<input type="hidden" id="carrera" name="carrera" value="">
   	 			<input type="hidden" id="titulado" name="titulado" value="">
   	 			<input type="hidden" id="magister" name="magister" value="">
   	 			<input type="hidden" id="doctorado" name="doctorado" value="">
   	 			<input type="hidden" id="telefono" name="telefono" value="">
   	 			<input type="hidden" id="nivel" name="nivel" value="">
   	 			
   	 			</form>
   	 		</div>
   	</div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootsnav.js"></script>

<!-- SCRIPT -->
<script type="text/javascript">
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_docente tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
//////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarDocentes',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    = array[i].split("|")[0];
				var dni       = array[i].split("|")[1];
				var nombre    = array[i].split("|")[2];
				var apellidopat 	 = array[i].split("|")[3];
				var apellidomat 	 = array[i].split("|")[4];
				var edad      		 = array[i].split("|")[5];
				var turno            = array[i].split("|")[6];
				var correo           = array[i].split("|")[7];
				var fechacontrato    = array[i].split("|")[8];
				var fechaNacimiento  = array[i].split("|")[9];
				var carrerapublica   = array[i].split("|")[10];
				var titulado         = array[i].split("|")[11] == "1" ? "SI" : "NO";
				var magister         = array[i].split("|")[12] == "1" ? "SI" : "NO";
				var doctorado        = array[i].split("|")[13] == "1" ? "SI" : "NO";
				var telefono    	 = array[i].split("|")[14];		
				var nivel    		 = array[i].split("|")[15];
				
				

				    $('#tbl_docente').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+nombre+"</center></td>" +
  				  		"<td><center>"+apellidopat+"</center></td>" +
  				  	    "<td><center>"+apellidomat+"</center></td>" +
  				  		"<td><center>"+correo+"</center></td>" +
  				  		"<td><center>"+telefono+"</center></td>" +
  				  		"<td><center>"+edad+"</center></td>" +
  				  		"<td><center>"+fechaNacimiento+"</center></td>" +
  				  		"<td><center>"+fechacontrato+"</center></td>" +
  				  		"<td><center>"+carrerapublica+"</center></td>" +
  				  		"<td><center>"+titulado+"</center></td>" +
  						"<td><center>"+magister+"</center></td>" +
  						"<td><center>"+doctorado+"</center></td>" +
  				  		"<td><center>"+turno+"</center></td>" +
  						"<td><center>"+nivel+"</center></td>" +
  						'<td><center><button type="submit" class="btn btn-primary" id="btnModificar" name="btnModificar">Modificar</button></center></td>'+
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnEliminar" name="btnEliminar" >Eliminar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
///////////////////////////////////////////////////////
$('#table_docente').on('click', '#btnModificar', function(){
	
	var cod = $(this).closest('tr').find("td").filter(":eq(1)").text();
	var nom = $(this).closest('tr').find("td").filter(":eq(2)").text();
	var pat = $(this).closest('tr').find("td").filter(":eq(3)").text();
	var mat = $(this).closest('tr').find("td").filter(":eq(4)").text();
	var correo = $(this).closest('tr').find("td").filter(":eq(5)").text();
	var tele = $(this).closest('tr').find("td").filter(":eq(6)").text();
	var edad = $(this).closest('tr').find("td").filter(":eq(7)").text();
	var nac = $(this).closest('tr').find("td").filter(":eq(8)").text();
	var contrato = $(this).closest('tr').find("td").filter(":eq(9)").text();
	var carrera = $(this).closest('tr').find("td").filter(":eq(10)").text();
	var titulado = $(this).closest('tr').find("td").filter(":eq(11)").text();
	var magister = $(this).closest('tr').find("td").filter(":eq(12)").text();
	var doctorado = $(this).closest('tr').find("td").filter(":eq(13)").text();
	var turno = $(this).closest('tr').find("td").filter(":eq(14)").text();
	var nivel = $(this).closest('tr').find("td").filter(":eq(15)").text();	
	
	document.getElementById("txtcodigo").value = cod;
	document.getElementById("txtnombre").value = nom;
	document.getElementById("txtpaterno").value = pat;
	document.getElementById("txtmaterno").value = mat;
	document.getElementById("txtedad").value = edad;
	document.getElementById("txtturno").value = turno;
	document.getElementById("txtcorreo").value = correo;
	document.getElementById("fechacontrato").value = contrato;
	document.getElementById("fechanacimiento").value = nac;
	document.getElementById("carrera").value = carrera;
	document.getElementById("titulado").value = titulado;
	document.getElementById("magister").value = magister;
	document.getElementById("doctorado").value = doctorado;
	document.getElementById("telefono").value = tele;
	document.getElementById("nivel").value = nivel;
});
//////////////////////////////////////////////////////////////
$('#table_docente').on('click', '#btnEliminar', function(){
	
	var codigo = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	eliminar=confirm("¿Deseas eliminar este Docente?");
	
	if(eliminar)
	{
		$.ajax({
			type: 'POST',
			url: '<%=request.getContextPath()%>/EliminarDocente',
			data: {
				codigo: codigo
			},
			success: function(data)
			{
				if (data != 0)
				{
					
					alert("Usuario Eliminado.");
					location.reload();
				}
				else 
				{
					alert("No se encontró al Usuario");
					
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