<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Registrar Padre</title>
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
		</ul>
	</nav>
</header> 
<br><br><br><br>

<!-- CUERPO DE LA PAGINA --> 
<div id="cuerpo" class="container-row">

	<!-- CUERPO -->
	<div class="container-row">
		<div class="col-md-2"></div>
   		<div class="col-md-8">
   		
   			<!-- PANEL REGISTRO -->
    		<div class="panel panel-default" id="divPadres">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Registrar Padre</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO FORMULARIO-->
   	 			<form action="registrarUsuario.jsp"  id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnom" id="txtnom" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpat" id="txtpat" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmat" id="txtmat" required>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" class="form-control" name="txtedad" id="txtedad" onKeyPress="return SoloNumeros(event);" required maxlength="2">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="email" class="form-control" onkeyup="validarEmail(this)" name="txtcorreo" id="txtcorreo" required>
   	 						<a id='resultado' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
							<h4><strong>DNI:</strong></h4>
   	 						<input type="text" class="form-control" name="txtnumdoc" id="txtnumdoc" onKeyPress="return SoloNumeros(event);" minlength="8" maxlength="8" required>
   	 					</div>
   	 				</div><br> 
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Dirección:</strong></h4>
   	 						<input type="text" class="form-control" name="txtdireccion" id="txtdireccion" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Telefono Celular:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtfone" id="txtfone" required maxlength="9">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Nacimiento: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanac" name="fechanac" required> 
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
							<h4><strong>Actualmente esta trabajando:</strong></h4>
							<input type="hidden" id="trabaja" name="trabaja" value="">
   	 						<input type="radio" class="rad" id="trabaja" name="trabaja" value="SI" onclick="apagar(this);"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="rad" id="trabaja" name="trabaja" value="NO" onclick="apagar(this);"><label>NO</label>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Trabaja en:</strong></h4>
   	 						<input type="text" class="form-control" name="txttrabajo" id="txttrabajo" disabled required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Teléfono del Trabajo:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txttele" name="txttele" required maxlength="9" disabled>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Lugar de Trabajo:</strong></h4>
   	 						<input type="text" class="form-control" id="txtlugar" name="txtlugar" disabled required>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Estado Civil:</strong></h4>
   	 						<select class="form-control selectEstado" id="selectEstado" name="selectEstado" required>
   	 							<option value="" selected disabled>--Seleccionar--</option>
		   						<option value="soltero">Soltero(a)</option>
		   						<option value="casado">Casado(a)</option>
		   						<option value="divorciado">Divorciado(a)</option>
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
   	 						<input type="text" class="form-control soloTexto" name="txtnommadre" id="txtnommadre" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpatmadre" id="txtpatmadre" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmatmadre" id="txtmatmadre" required>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>DNI:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtdni" name="txtdni" required maxlength="8">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtedad1" name="txtedad1" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Nacimiento:</strong></h4>
   	 						<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanacmad" name="fechanacmad" required> 
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="text" class="form-control" onkeyup="validar2(this)" id="txtcorre" name="txtcorre" required>
   	 						<a id='resultado1' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Ocupación de Esposo/a:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" id="txttrabajo2" name="txttrabajo2" required>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Teléfono Celular:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtfone1" name="txtfone1" required maxlength="9">
   	 					</div>
   	 				</div><br>
   	 				<div class="container-row">
   	 					<h3><strong>Datos del Hogar</strong></h3>
   	 					<hr style="border-color: #3E7BC0; border-width: 5px;" />
   	 				</div>
   	 				<div class="row">
   	 					<div class="col-md-2">
   	 						<h4><strong>Casa Propias:</strong></h4>
   	 						
   	 						<input type="radio" class="rad" id="txtcasa" name="txtcasa" value="SI" onclick="apagar(this);" ><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="rad" id="txtcasa" name="txtcasa" value="NO" onclick="apagar(this);" ><label>NO</label>
   	 						<input type="hidden" id="txtcasa" name="txtcasa" value="">
   	 						
   	 					</div>
   	 					<div class="col-md-5">
   	 						<h4><strong>Número de Personas que viven en su hogar:</strong></h4>
   	 						<input type="text" class="form-control" id="txtpersona" name="txtpersona" onKeyPress="return SoloNumeros(event);" required maxlength="2">
   	 					</div>
   	 					<div class="col-md-5">
   	 						<h4><strong>Número de Hijos:</strong></h4>
   	 						<input type="text" class="form-control" id="txthijo" name="txthijo" onKeyPress="return SoloNumeros(event);" required maxlength="2">
   	 					</div>
   	 				</div><br><br>
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<button class="btn btn-success form-control" type="submit" id="btnRegistrar" name="btnRegistrar">Registrar Padre de Familia</button>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<button class="btn btn-danger form-control" id="btnCancelar" name="btnCancelar">Cancelar Registro</button>
   	 					</div>
   	 				</div>
   	 			</div>
   	 			</form>
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
		      txtdireccion: {required:true, minlength:3, maxlength: 20},
		      txtfone: {required:true, minlength:9, maxlength: 9},
		      fechanac: {required:true},
		      trabaja: {required:true},
		      txttrabajo: {required:true, minlength:4},
		      txttele: {required:true, minlength:9},
		      txtlugar: {required:true, minlength:4},
		      selectEstado: {required:true},
		      txtnommadre: {required:true, minlength:2},
		      txtpatmadre: {required:true, minlength:3},
		      txtmatmadre: {required:true, minlength:3},
		      txtdni: {required:true, minlength:8, maxlength: 8},
		      txtedad1: {required:true, minlength:1, maxlength:2},
		      fechanacmad: {required:true},
		      txtcorre: {required:true},
		      txttrabajo2: {required:true, minlength:2},
		      txtfone1: {required:true, minlength:9},
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
		      txtdireccion: { required:"Ingresar su dirección", minlength: "Minimo de caracteres es de 3"},
		      txtfone: {required:"Ingresar su teléfono", minlength: "Minimo de caracteres es de 9"},
		      fechanac: {required:"Ingresar fecha de nacimiento"},
		      trabaja: {required:"Seleccionar Si o No"},
		      txttrabajo: {required:"Ingresar su ocupación", minlength: "Minimo de caracteres es de 4"},
		      txttele: {required:"Ingresar su teléfono", minlength: "Minimo de caracteres es de 9"},
		      txtlugar: {required:"Ingresar su dirección", minlength: "Minimo de caracteres es de 4"},
		      selectEstado: {required:"Ingresar su estado civil"},
		      txtnommadre: {required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
		      txtpatmadre: {required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 3"},
		      txtmatmadre: {required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 3"},
		      txtdni: 	   {required:"Ingrese dni", minlength:"Son 8 caracteres de un dni", maxlength: "Son 8 caracteres de un dni"},
		      txtedad1:    {required:"Ingrese la edad", minlength:"Minimo de caracteres es 1", maxlength:"Minimo de caracteres es 2"},
		      fechanacmad: {required:"Ingrese la fecha de nacimiento"},
		      txtcorre:    {required:"Ingrese el correo"},
		      txttrabajo2: {required:"Ingresar su ocupación", minlength: "Minimo de caracteres es de 2"},
		      txtfone1: {required:"Ingresar su teléfono", minlength: "Minimo de caracteres es de 9"},
		      txtcasa:  {required:"Seleccionar una opción"},
		      txtpersona: {required:"Ingresar cantidad de personas que viven con usted"},
		      txthijo: {required:"Ingresar cantidad de hijos"}
		  }
	});
});
</script>
<script type="text/javascript">
$(".rad").click(function(){
	
	if($(this).val() == "SI")
	{
		$("#txttrabajo").prop('disabled', false);
		$("#txttele").prop('disabled', false);
		$("#txtlugar").prop('disabled', false);
		
	}
	else 
	{
		$("#txttrabajo").prop('disabled', true);
		$("#txttele").prop('disabled', true);
		$("#txtlugar").prop('disabled', true);
	}
	
});
//////////////////////////////////////
function apagar(obj){
	
	document.getElementById("txtcasa").checked = false;
    document.getElementById("txtcasa").checked = false;
    obj.checked = true;
}
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
////////////////////////////////////////////////////
function validar2(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado1").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado1").innerHTML = "";
  }

}
////////////////////////////////////////////////////
$('#btnRegistrar').on('click', function(){
	
	var linea = [];
	var item = {};
	if($("#form1").valid()){
	item.nombre      	= $('#txtnom').val().trim();
	item.paterno       	= $('#txtpat').val().trim();
	item.materno       	= $('#txtmat').val().trim();
	item.edad 			= $('#txtedad').val();
	item.correo       	= $('#txtcorreo').val();
	item.dni        	= $('#txtnumdoc').val().trim();
	item.direccion		= $('#txtdireccion').val().trim();
	item.telefono		= $('#txtfone').val().trim();
	item.fechanac		= $('#fechanac').val().trim();
	item.trabaja		= $('#trabaja:checked').val();
	item.ocupacion		= $('#txttrabajo').val().trim();
	item.telefonoTrabajo  = $('#txttele').val().trim();
	item.direccionTrabajo = $('#txtlugar').val().trim();
	item.estado			= $('#selectEstado').val().trim();
	item.nombreMadre	= $('#txtnommadre').val().trim();
	item.paternoMadre	= $('#txtpatmadre').val().trim();
	item.maternoMadre	= $('#txtmatmadre').val().trim();
	item.dniMadre       = $('#txtdni').val().trim();
	item.edadMadre      = $('#txtedad1').val().trim();
	item.fechaMadre     = $('#fechanacmad').val().trim();
	item.correoMadre    = $('#txtcorre').val().trim();
	item.ocupacionMadre	= $('#txttrabajo2').val().trim();
	item.telefonoMadre	= $('#txtfone1').val().trim();
	item.casa			= $('#txtcasa:checked').val();
	item.personas		= $('#txtpersona').val().trim();
	item.hijos			= $('#txthijo').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	$.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarPadre',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro los datos de los Padres");
	    	
	    	 }
	    	 else
	    	 {
	    		 alert("No se pudo registrar los datos de los Padres");
	    	 }
		}
		
	 });
	} 
	else 
	{
        alert("Datos incompletos.");
    }
	 
});
///////////////////////////////////////////////////////////////
</script>
</body>
</html>