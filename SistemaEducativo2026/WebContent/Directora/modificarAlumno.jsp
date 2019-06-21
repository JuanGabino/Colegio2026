<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Modificar Alumno</title>
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

<%
	String codigo 			= request.getParameter("txtcodigo");
	String nombre 			= request.getParameter("txtnombre");
	String paterno 			= request.getParameter("txtpaterno");
	String materno 			= request.getParameter("txtmaterno");
	String dni 	    		= request.getParameter("txtdni");
	String edad  	 		= request.getParameter("txtedad");
	String fechanac 		= request.getParameter("txtfechanac");
	String correo   		= request.getParameter("txtcorreo");
	String seccion			= request.getParameter("txtseccion");
	String padre			= request.getParameter("txtpadre");

%>

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
<div class="container-row">

	<!-- CUERPO -->
	<div class="container-row">
		<div class="col-md-2"></div>
   		<div class="col-md-8">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Datos del Alumno</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<form action=""  id="form1">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divDatosAlum" >               
                             <h4><strong>Codigo del Alumno</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" id="txtcod" name="txtcod" value="<%out.print(codigo); %>" disabled>
                                  </div>
                             </div>
                        </div>
   	 				</div><br><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnombre" id="txtnombre" value="<%out.print(nombre); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtapepat" id="txtapepat" value="<%out.print(paterno); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtapemat" id="txtapemat" value="<%out.print(materno); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha de Nacimiento: </strong></h4>
   	 						<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechaAlum" name="fechaAlum" value="<%out.print(fechanac); %>">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div> 
   	 					<div class="col-md-4">
							<h4><strong>DNI:</strong></h4>
   	 						<input type="text" onKeyPress="return SoloNumeros(event);" class="form-control" value="<%out.print(dni); %>" name="txtdni" id="txtdni">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" onKeyPress="return SoloNumeros(event);" class="form-control" value="<%out.print(edad); %>" name="txtedad" id="txtedad">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="text" class="form-control"  onkeyup="validarEmail(this)" name="txtcorreo" id="txtcorreo" value="<%out.print(correo); %>">
   	 						<a id='resultado' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Código Padre:</strong></h4>
   	 						<input type="text" class="form-control" name="txtpadre" id="txtpadre" value="<%out.print(padre); %>" disabled>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Seccion:</strong></h4>
   	 						<input type="hidden" id="txtseccion" name="txtseccion" value="<%out.print(seccion); %>">
           					<select class="form-control selectSeccion" id="selectSeccion" name="selectSeccion">
		   						<option value="" selected disabled>--Seleccionar--</option>
		   						<option value="SEC1A">1ro de Secundaria A</option>
   	 							<option value="SEC1B">1ro de Secundaria B</option>
   	 							<option value="SEC1C">1ro de Secundaria C</option>
   	 							<option value="SEC1D">1ro de Secundaria D</option>
   	 							<option value="SEC2A">2do de Secundaria A</option>
   	 							<option value="SEC2B">2do de Secundaria B</option>
   	 							<option value="SEC2C">2do de Secundaria C</option>
   	 							<option value="SEC2D">2do de Secundaria D</option>
   	 							<option value="SEC3A">3ro de Secundaria A</option>
   	 							<option value="SEC3B">3ro de Secundaria B</option>
   	 							<option value="SEC3C">3ro de Secundaria C</option>
   	 							<option value="SEC3D">3ro de Secundaria D</option>
   	 							<option value="SEC4A">4to de Secundaria A</option>
   	 							<option value="SEC4B">4to de Secundaria B</option>
   	 							<option value="SEC4C">4to de Secundaria C</option>
   	 							<option value="SEC4D">4to de Secundaria D</option>
   	 							<option value="SEC5A">5to de Secundaria A</option>
   	 							<option value="SEC5B">5to de Secundaria B</option>
   	 							<option value="SEC5C">5to de Secundaria C</option>
   	 							<option value="SEC5D">5to de Secundaria D</option>
	       					</select>
   	 					</div>
   	 				</div><br>
   	 				</form>
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<br>
   	 						<button class="btn btn-success form-control" id="btnModificarAlumno" name="btnModificarAlumno">Modificar Alumno</button>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<br>
   	 						<button class="btn btn-primary form-control" id="btnVolver" name="btnVolver" >Volver</button>
   	 					</div>
   	 				</div>
   	 			</div>
   	 		</div>
   	 	</div>
   	 </div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function (){
	$("#form1").validate({
		  rules: {
			  txtnombre: {required:true, minlength:2},
			  txtpaterno: {required:true, minlength:4},
			  txtmaterno: {required:true, minlength:4},
			  txtfechanac: {required:true}, 
			  txtdni: {required:true, minlength:8, maxlength: 8},
		      txtedad: {required:true, minlength:2, maxlength: 2},
		      txtcorreo: {required:true},
		      selectSeccion: {required:true}
		  },
		  messages: {
			  txtnombre:   { required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
			  txtpaterno:  { required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 4"},
			  txtmaterno:  { required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 4"},
			  txtedad:     { required:"Ingresar edad", minlength:"Minimo de caracteres es de 2", maxlength:"Máximo de caracteres es de 2"},
			  txtdni:      { required:"Ingresar su número de DNI", minlength: "Minimo de caracteres es de 8"},
			  txtfechanac: { required:"Ingresar una fecha"},
		      txtcorreo: {required:"Ingresar un correo electronico"},
		      selectSeccion: {required:"Seleccionar seccion"}
		  }
	});
});
</script>

<script type="text/javascript">
////////////////////////////////////
$(document).ready(function(){
	
	var seccion  = document.getElementById("txtseccion").value;
	
	document.getElementById("selectSeccion").value = seccion;
	
});
//////////////////////////////////////
$('#btnVolver').on('click', function(){
	
	window.location.href = "<%=request.getContextPath()%>/listarAlumnos.jsp";
});
///////////////////////////////////77
function SoloNumeros(evt){
	 if(window.event)
	 {//asignamos el valor de la tecla a keynum
	  keynum = evt.keyCode; //IE
	 }
	 else
	 {
	  keynum = evt.which; //FF
	 } 
	 //comprobamos si se encuentra en el rango numérico y que teclas no recibirá.
	 if((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13 || keynum == 6 )
	 {
	  return true;
	 }
	 else
	 {
	  return false;
	 }
}
//////////////////////////////////
function validarEmail(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado").innerHTML = "";
  }

}
///////////////////////////////////////
$('.soloTexto').keyup(function(e) {
		  var regex = /^[a-zA-Z ]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^a-zA-Z]+/, '');
});
////////////////////////////////////////
$('#btnModificarAlumno').on('click', function(){ 
	
	var flag = $("#form1").valid();
	console.log(flag);
	
	if($("#form1").valid()==true)
	{
		var parametro0= $("#txtnombre").val().trim();
		var parametro1= $("#txtapepat").val().trim();
 		var parametro2= $("#txtapemat").val().trim();
 		var parametro3= $("#fechaAlum").val();
 		var parametro4= $("#txtdni").val();
 		var parametro5= $("#txtedad").val();
 		var parametro6= $("#txtcorreo").val();
 		var parametro7= $("#selectSeccion").val();
 		var parametro8= $("#txtcod").val();
 		
 		$.ajax({
 			type: 'POST',
 			url:  '<%=request.getContextPath()%>/ModificarAlumno',
 			data: {
 				nombre		: parametro0,
     			paterno 	: parametro1,
     			materno 	: parametro2,
     			fecha  	 	: parametro3,
     			dni  		: parametro4,	
     			edad        : parametro5,
     			correo    	: parametro6,
     			seccion 	: parametro7,
     			codigo      : parametro8
     			
 			},
 			success: function(data)
 			{
 				if (data != 0){
 					alert("Mensaje: "+  "La Modificación fue satisfactoria.");
     			}else {
     				alert("Hubo un error, revisar campos obligarios.");
     			}
 			}
 		});
	}
	else
	{
		alert("Datos incompletos. Revisar Datos");
	}

});
</script>
</body>
</html>