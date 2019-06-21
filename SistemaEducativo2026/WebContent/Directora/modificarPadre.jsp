<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Modificar Padre</title>
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
<body>

<%
	String codigo 			= request.getParameter("txtcodigo");
	String nombre 			= request.getParameter("txtnombre");
	String paterno 			= request.getParameter("txtpaterno");
	String materno 			= request.getParameter("txtmaterno");
	String edad 			= request.getParameter("txtedad");
	String correo	 		= request.getParameter("txtcorreo");
	String dni 				= request.getParameter("txtdni");
	String direccion		= request.getParameter("txtdireccion");
	String tele 			= request.getParameter("txttelefono");
	String nacimiento 		= request.getParameter("fechanac");
	String trabaja 			= request.getParameter("trabaja");
	String ocupacion 		= request.getParameter("ocupacion");
	String teletrabajo 		= request.getParameter("teletrabajo");
	String direcciontrabajo = request.getParameter("direcciontrabajo");
	String estado 			= request.getParameter("estado");
	String nombremadre 		= request.getParameter("nombremadre");
	String paternomadre 	= request.getParameter("paternomadre");
	String maternomadre 	= request.getParameter("maternomadre");
	String dnimadre 		= request.getParameter("dnimadre");
	String edadmadre 		= request.getParameter("edadmadre");
	String fechamadre 		= request.getParameter("fechamadre");
	String correomadre 	    = request.getParameter("correomadre");
	String ocupacionmadre   = request.getParameter("ocupacionmadre");
	String telefonomadre    = request.getParameter("telemadre");
	String casapropia 	    = request.getParameter("casapropia");
	String cantidad 		= request.getParameter("personas");
	String hijo 			= request.getParameter("hijos");
%>


<!-- MENU -->
<header>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;I.E 2026</a></li>
			<li><a href="registrarPadre.jsp"><img src="../Imagenes/padre.png"   height="30" width="30">Registrar Padre</a></li>
			<li><a href="listarPadre.jsp"><img src="../Imagenes/cursos.png" height="30" width="30">Listar Padre</a></li>
			<li><a href="#"><img src="../Imagenes/report.png"    height="30" width="30">Lista de Padres por Sección</a></li>
		</ul>
	</nav>
</header>
<br><br><br><br>

<!-- CUERPO DE LA PAGINA --> 
<div id="cuerpo" class="container-row">
	<!-- CUERPO -->
	<div class="container-row">
		<div class="col-md-1"></div>
   		<div class="col-md-8">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Mantenimiento Padres</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action=""  id="form1">
   	 			<div class="panel-body" >
   	 				<div class="row" id="divPadreDni" >
   	 					<div class="col-md-6">               
                             <h4><strong>DNI Padre</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtnumdoc" name="txtnumdoc" value="<%out.print(dni); %>" disabled>
                                  </div>
                             </div>
                        </div>
                        <div class="col-md-6">               
                             <h4><strong>DNI Madre</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtdni" name="txtdni" value="<%out.print(dnimadre); %>" disabled><br>
                                  </div>
                             </div>
                        </div>
   	 				</div><br><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control" name="txtnom" id="txtnom" value="<%out.print(nombre); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control" name="txtpat" id="txtpat" value="<%out.print(paterno); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control" name="txtmat" id="txtmat" value="<%out.print(materno); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" class="form-control" name="txtedad" id="txtedad" onKeyPress="return SoloNumeros(event);" maxlength="2" value="<%out.print(edad); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="text" class="form-control" onkeyup="validarEmail(this)" name="txtcorreo" id="txtcorreo" value="<%out.print(correo); %>">
   	 						<a id='resultado' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Dirección:</strong></h4>
   	 						<input type="text" class="form-control" name="txtdireccion" id="txtdireccion" value="<%out.print(direccion); %>">
   	 					</div>
   	 				</div><br><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Telefono Celular:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtfone" id="txtfone" maxlength="9" value="<%out.print(tele); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Nacimiento: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanac" name="fechanac" value="<%out.print(nacimiento); %>"> 
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
							<h4><strong>Actualmente esta trabajando:</strong></h4>
							<input type="hidden" id="txtrad" name="txtrad" value="<%out.print(trabaja); %>">
   	 						<input type="radio" class="trabaja1" id="trabaja" name="trabaja" value="SI" ><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="trabaja2" id="trabaja" name="trabaja" value="NO" ><label>NO</label>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Trabaja en:</strong></h4>
   	 						<input type="text" class="form-control" name="txttrabajo" id="txttrabajo" disabled required value="<%out.print(ocupacion); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Teléfono Trabajo:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txttele" name="txttele"  maxlength="8" disabled value="<%out.print(teletrabajo); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Lugar de Trabajo:</strong></h4>
   	 						<input type="text" class="form-control" id="txtlugar" name="txtlugar" disabled required value="<%out.print(direcciontrabajo); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Estado Civil:</strong></h4>
   	 						<input type="hidden" id="txtest" name="txtest" value="<%out.print(estado); %>">
   	 						<select class="form-control selectEstado" id="selectEstado" name="selectEstado">
   	 							<option value="" selected disabled>--Seleccionar--</option>
   	 							<option value="soltero">Soltero(a)</option>
   	 							<option value="divorciado">Divorciado(a)</option>
   	 							<option value="casado">Casado(a)</option>
   	 							<option value="viudo">Viudo(a)</option>
   	 						</select> 
   	 						
   	 					</div>
   	 				</div><br>
   	 				<div class="container-row">
   	 					<h3><strong>Datos del Esposo(a)</strong></h3>
   	 					<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 				</div>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnommadre" id="txtnommadre" required value="<%out.print(nombremadre); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpatmadre" id="txtpatmadre" required value="<%out.print(paternomadre); %>">
   	 					</div> 
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmatmadre" id="txtmatmadre" required value="<%out.print(maternomadre); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtedad1" name="txtedad1" maxlength="2" value="<%out.print(edadmadre); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Nacimiento:</strong></h4>
   	 						<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanacmad" name="fechanacmad" required value="<%out.print(fechamadre); %>"> 
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Correos:</strong></h4>
   	 						<input type="text" class="form-control" onkeyup="validar2(this)" id="txtemail" name="txtemail" required value="<%out.print(correomadre); %>">
   	 						<a id='resultado1' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Ocupación de Esposo/a:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" id="txttrabajo2" name="txttrabajo2" required value="<%out.print(ocupacionmadre); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Teléfono Celular:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtfone1" name="txtfone1" maxlength="9" value="<%out.print(telefonomadre); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="container-row">
   	 					<h3><strong>Datos del Hogar</strong></h3>
   	 					<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 				</div>
   	 				<div class="row">
   	 					<div class="col-md-2">
   	 						<h4><strong>Casa Propias:</strong></h4>
   	 						<input type="hidden" id="txtpropia" name="txtpropia" value="<%out.print(casapropia); %>">
   	 						<input type="radio" class="casa1" id="txtcasa" name="txtcasa" value="SI" onclick="apagar(this);" ><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="casa2" id="txtcasa" name="txtcasa" value="NO" onclick="apagar(this);" ><label>NO</label>
   	 						
   	 					</div>
   	 					<div class="col-md-5">
   	 						<h4><strong>Número de Personas que viven en su hogar:</strong></h4>
   	 						<input type="text" class="form-control" id="txtpersona" name="txtpersona" onKeyPress="return SoloNumeros(event);" required maxlength="2" value="<%out.print(cantidad); %>">
   	 					</div>
   	 					<div class="col-md-5">
   	 						<h4><strong>Número de Hijos:</strong></h4>
   	 						<input type="text" class="form-control" id="txthijo" name="txthijo" onKeyPress="return SoloNumeros(event);" required maxlength="2" value="<%out.print(hijo); %>">
   	 					</div>
   	 				</div><br><br>
   	 			</div>
   	 			</form>
   	 		</div>
   	 	</div>
   	 	<div class="col-md-2">
   	 		<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divBotones">
				<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Opciones</strong></h4>
   	 			</div>
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<br><br>
   	 					<button class="btn btn-success form-control" id="btnModificarPadre" name="btnModificarPadre">MODIFICAR PADRE</button>
   	 					<br><br>
   	 					<button class="form-control btn btn-primary" id="btnRegresar" name="btnRegresar"><strong>REGRESAR</strong></button>
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
			  txtnom: {required:true, minlength:2},
			  txtpat: {required:true, minlength:4},
			  txtmat: {required:true, minlength:4},
			  txtedad: {required:true, minlength:2, maxlength:2},
			  txtcorreo: {required:true},
		      txtnumdoc: {required:true, minlength:8, maxlength: 8},
		      txtdireccion: {required:true, minlength:3, maxlength: 40},
		      txtfone: {required:true, maxlength: 9},
		      fechanac: {required:true},
		      trabaja: {required:true},
		      txttrabajo: {required:true, minlength:4},
		      txttele: {required:true, minlength:7, minlength:8},
		      txtlugar: {required:true, minlength:4},
		      selectEstado: {required:true},
		      txtnommadre: {required:true, minlength:2},
		      txtpatmadre: {required:true, minlength:3},
		      txtmatmadre: {required:true, minlength:3},
		      txtedad1: {required:true, minlength:1, maxlength:2},
		      fechanacmad: {required:true},
		      txtemail: {required:true},
		      txttrabajo2: {required:true, minlength:2},
		      txtfone1: {required:true, minlength:9, maxlength:9},
		      txtcasa:  {required:true},
		      txtpersona: {required:true},
		      txthijo: {required:true}
		  },
		  messages: {
			  txtnom: { required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
			  txtpat: { required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 4"},
			  txtmat: { required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 4"},
			  txtedad: { required:"Ingresar edad", minlength:"Minimo de caracteres es de 2", maxlength:"Máximo de caracteres es de 2"},
			  txtcorreo: { required:"Ingresar un correo electronico"},
		      txtnumdoc: { required:"Ingresar su número de DNI", minlength: "Minimo de caracteres es de 8"},
		      txtdireccion: { required:"Ingresar su dirección", minlength: "Minimo de caracteres es de 3", maxlength: "Máximo de caracteres es de 40"},
		      txtfone: {required:"Ingresar su teléfono", minlength: "Minimo de caracteres es de 7", maxlength: "Minimo de caracteres es de 9"},
		      fechanac: {required:"Ingresar fecha de nacimiento"},
		      trabaja: {required:"Seleccionar Si o No"},
		      txttrabajo: {required:"Ingresar su ocupación", minlength: "Minimo de caracteres es de 4"},
		      txttele: {required:"Ingresar su teléfono", minlength: "Minimo de caracteres es de 7", maxlength:"Máximo de caracteres es de 8"},
		      txtlugar: {required:"Ingresar su dirección", minlength: "Minimo de caracteres es de 4"},
		      selectEstado: {required:"Ingresar su estado civil"},
		      txtnommadre: {required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
		      txtpatmadre: {required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 3"},
		      txtmatmadre: {required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 3"},
		      txtedad1:    {required:"Ingrese la edad", minlength:"Minimo de caracteres es 1", maxlength:"Minimo de caracteres es 2"},
		      fechanacmad: {required:"Ingrese la fecha de nacimiento"},
		      txtemail:    {required:"Ingrese el correo"},
		      txttrabajo2: {required:"Ingresar su ocupación", minlength: "Minimo de caracteres es de 2"},
		      txtfone1: {required:"Ingresar su teléfono", minlength: "Número de caracteres es de 9", maxlength: "Número de caracteres es de 9"},
		      txtcasa:  {required:"Seleccionar una opción"},
		      txtpersona: {required:"Ingresar cantidad de personas que viven con usted"},
		      txthijo: {required:"Ingresar cantidad de hijos"}
		  }
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	var estado     = document.getElementById("txtest").value;
	var trabajando = document.getElementById("txtrad").value;
	var propia	   = document.getElementById("txtpropia").value;
	
	document.getElementById("selectEstado").value = estado;
	
	if(trabajando == "SI")
	{
		$(".trabaja1").prop("checked", true);
		
		$("#txttrabajo").prop('disabled', false);
		$("#txttele").prop('disabled', false);
		$("#txtlugar").prop('disabled', false);
	}
	else if(trabajando == "NO")
	{
		$(".trabaja2").prop("checked", true);
		
		$("#txttrabajo").prop('disabled', true);
		$("#txttele").prop('disabled', true);
		$("#txtlugar").prop('disabled', true);
	}
	
	if(propia == "SI")
	{
		$(".casa1").prop("checked", true);
	}
	else if(propia == "NO")
	{
		$(".casa2").prop("checked", true);
	}
});
/////////////////////////////////////////////////
$(".trabaja2").click(function(){
	
		$("#txttrabajo").prop('disabled', true);
		$("#txttele").prop('disabled', true);
		$("#txtlugar").prop('disabled', true);
		
		document.getElementById("txttrabajo").value = "";
		document.getElementById("txttele").value = "";
		document.getElementById("txtlugar").value = "";
});
///////////////////////////////////////////////////
$(".trabaja1").click(function(){
	
	$("#txttrabajo").prop('disabled', false);
	$("#txttele").prop('disabled', false);
	$("#txtlugar").prop('disabled', false);
	
});
////////////////////////////////////////////
$( function() {
    $("#selectEstado").change( function() {
        if ($(this).val() === "viudo") {
            $("#txtnommadre").prop("disabled", true);
            $("#txtpatmadre").prop("disabled", true);
            $("#txtmatmadre").prop("disabled", true);
            $("#txttrabajo2").prop("disabled", true);
            $("#txtdni").prop("disabled", true);
            $("#txtedad1").prop("disabled", true);
            $("#txtcorre").prop("disabled", true);
            $("#fechanacmad").prop("disabled", true);
            $("#txtfone1").prop("disabled", true);
            
        } else {
        	$("#txtnommadre").prop("disabled", false);
            $("#txtpatmadre").prop("disabled", false);
            $("#txtmatmadre").prop("disabled", false);
            $("#txttrabajo2").prop("disabled", false);
            $("#txtdni").prop("disabled", false);
            $("#txtedad1").prop("disabled", false);
            $("#txtcorre").prop("disabled", false);
            $("#fechanacmad").prop("disabled", false);
            $("#txtfone1").prop("disabled", false);
        }
    });
});
///////////////////////////////////////////////////
$('.soloTexto').keyup(function(e) {
		  var regex = /^[a-zA-Z ]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^a-zA-Z]+/, '');
	});
////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////
function validarEmail(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado").innerHTML = "";
  }

}
////////////////////////////////////////////////////////
function validar2(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado1").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado1").innerHTML = "";
  }

}
///////////////////////////////////////////////////////////
$('#btnModificarPadre').on('click', function(){ 
	var flag = $("#form1").valid();
	console.log(flag);
	
	if($("#form1").valid()==true)
	{
		var parametro0= $("#txtnom").val().trim();
		var parametro1= $("#txtpat").val().trim();
 		var parametro2= $("#txtmat").val().trim();
 		var parametro3= $("#txtedad").val();
 		var parametro4= $("#txtcorreo").val();
 		var parametro5= $("#txtdireccion").val();
 		var parametro6= $("#txtfone").val();
 		var parametro7= $("#fechanac").val();
 		var parametro8= $('#trabaja:checked').val();
 		var parametro9= $('#txttrabajo').val();
 		var parametro10= $('#txttele').val();
 		var parametro11= $('#txtlugar').val();
 		var parametro12= $('#selectEstado').val();
 		var parametro13= $('#txtnommadre').val();
 		var parametro14= $('#txtpatmadre').val();
 		var parametro15= $('#txtmatmadre').val();
 		var parametro16= $('#txtedad1').val();
 		var parametro17= $('#fechanacmad').val();
 		var parametro18= $('#txtemail').val();
 		var parametro19= $('#txttrabajo2').val();
 		var parametro20= $('#txtfone1').val();
 		var parametro21= $('#txtcasa:checked').val();
 		var parametro22= $('#txtpersona').val();
 		var parametro23= $('#txthijo').val();
 		var parametro24= $('#txtnumdoc').val();
 		var parametro25= $('#txtdni').val();
 		
 		$.ajax({
 			type: 'POST',
 			url:  '<%=request.getContextPath()%>/ModificarPadre',
 			data: {
 				nombre		: parametro0,
     			paterno 	: parametro1,
     			materno 	: parametro2,
     			edad  	 	: parametro3,
     			correo		: parametro4,	
     			direccion   : parametro5,
     			telefono   	: parametro6,
     			nacimiento	: parametro7,
     			trabaja			: parametro8,
     			ocupacion 		: parametro9,
     			telefonotrabajo	: parametro10,
     			lugar	    	: parametro11,
     			estado	    	: parametro12,
     			nombremadre		: parametro13,
     			paternomadre	: parametro14,
     			maternomadre	: parametro15,
     			edadmadre	    : parametro16,
     			nacimientomadre	: parametro17,
     			correomadre	    : parametro18,
     			ocupacionmadre	: parametro19,
     			telefonomadre	: parametro20,
     			casapropia	    : parametro21,
     			cantidad	    : parametro22,
     			hijos	    	: parametro23,
     			dnipadre        : parametro24,
     			dnimadre        : parametro25
     			
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
////////////////////////////////////////////////////////////////////
$('#divBotones').on('click', '#btnEliminarPadre', function(){
	
	var codigo = $("#txtnumdoc").val().trim();
	
	eliminar=confirm("¿Deseas eliminar este Padre?");
	
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
				if (data == 1)
				{
					
					alert("Padre Eliminado.");
					window.location.href ="<%=request.getContextPath()%>/index.jsp";
				}
				else if(data != 1)
				{
					alert("No Existe el Padre que desea Eliminar");
					
				}
			}
		});
	}
	else
	{
		alert("No se elimino registro");
	}
});
///////////////////////////////////////////////
$('#btnRegresar').on('click', function(){ 
	
	window.location.href = "<%=request.getContextPath()%>/listarPadre.jsp";
});
</script>
</body>
</html>