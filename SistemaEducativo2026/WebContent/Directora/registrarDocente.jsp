<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Registrar Docente del Colegio</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
		<div class="col-md-2"></div>
   		<div class="col-md-8">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Registrar Docentes</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="registrarUsuario.jsp"  id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombres:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnom" id="txtnom">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtpat" id="txtpat">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtmat" id="txtmat">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtedad" id="txtedad" maxlength="2">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="text" class="form-control" onkeyup="validarEmail(this)"  name="txtcorreo" id="txtcorreo">
   	 						<a id='resultado' style="text-decoration: none;"></a>
   	 					</div>
   	 					<div class="col-md-4">
							<h4><strong>DNI:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtnumdoc" id="txtnumdoc" maxlength="8">
   	 					</div>
   	 				</div><br> 
   	 				<div class="row">
   	 			        <div class="col-md-4">
							<h4><strong>Teléfono:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtfone" id="txtfone" maxlength="9">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha Nacimiento: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanac" name="fechanac">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha que empezó a Laborar: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechainicio" name="fechainicio">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Pertenece a la Carrera Pública Magisterial:</strong></h4>
   	 						<input type="radio" id="txtpub" name="txtpub" value="SI" onclick="apagar(this);"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" id="txtpub" name="txtpub" value="NO" onclick="apagar(this);"><label>NO</label>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Titulado:</strong></h4>
   	 						<input type="radio" id="txttitu" name="txttitu" value="SI" ><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" id="txttitu" name="txttitu" value="NO" ><label>NO</label>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Magister:</strong></h4>
   	 						<input type="radio" id="txtmag" name="txtmag" value="SI"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" id="txtmag" name="txtmag" value="NO"><label>NO</label>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Doctorado:</strong></h4>
   	 						<input type="radio" id="txtdoc" name="txtdoc" value="SI"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" id="txtdoc" name="txtdoc" value="NO"><label>NO</label>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Turno:</strong></h4>
           					<select class="form-control selectTurno" id="selectTurno" name="selectTurno" required>
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="mañana">Mañana</option>
		   							<option value="tarde">Tarde</option>
	       					</select>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Nivel:</strong></h4>
           					<select class="form-control selectNivel" id="selectNivel" name="selectNivel" required>
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="Primaria">Primaria</option>
		   							<option value="Secundaria">Secundaria</option>
	       					</select>
   	 					</div>
   	 				</div><br><br><br>
   	 				<div class="row">
   	 					<div class="col-md-6">
   	 						<button class="btn btn-success btn-block"  id="btnRegistrar" name="btnRegistrar">Registrar Docente</button><br>
   	 					</div>
   	 					<div class="col-md-6">
   	 						<button class="btn btn-primary btn-block" id="btnLimpiar" name="btnLimpiar">Limpiar Datos</button>
   	 					</div>
   	 				</div>
   	 			</div>
   	 			</form>
   	 		</div>
   		</div>
	</div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootsnav.js"></script>

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
		      fechanac:  {required:true},
		      fechainicio: {required:true},
		      txtpub: {required:true},
		      txttitu: {required:true},
		      txtmag: {required:true},
		      txtdoc: {required:true},
		      selectTurno: {required:true},
		      txtfone: {required:true, maxlength: 9},
		      selectNivel: {required:true}
		  },
		  messages: {
			  txtnom: { required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
			  txtpat: { required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 4"},
			  txtmat: { required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 4"},
			  txtedad: { required:"Ingresar edad", minlength:"Minimo de caracteres es de 2", maxlength:"Máximo de caracteres es de 2"},
			  txtcorreo: { required:"Ingresar un correo electronico"},
		      txtnumdoc: { required:"Ingresar su número de DNI", minlength: "Minimo de caracteres es de 8"},
		      fechanac: {required:"Ingresar fecha de nacimiento"},
		      fechainicio: {required:"Ingresar fecha en que empezo a laborar"},
		      txtpub: {required:"Seleccione una opción"},
		      txttitu: {required:"Seleccione una opción"},
		      txtmag: {required:"Seleccione una opción"},
		      txtdoc: {required:"Seleccione una opción"},
		      selectTurno: {required:"Seleccione el turno"},
		      txtfone: {required:"Ingrese su número telefonico", maxlength: "Mínimo número de caracteres es de 9"},
		      selectNivel: {required:"Seleccione el nivel al que pertence el docente"}
		  }
	});
});
</script>

<script type="text/javascript">
//////////////////////////////////////////////7
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
////////////////////////////////////////////////////
function validarEmail(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado").innerHTML = "";
  }

}
//////////////////////////////////////////////////7
function apagar(obj){
	
	
	document.getElementById("txtpub").checked = false;
    document.getElementById("txtpub").checked = false;
    obj.checked = true;
    
    document.getElementById("txtdoc").checked = false;
    document.getElementById("txtdoc").checked = false;
    obj.checked = true;
    
    document.getElementById("txttitu").checked = false;
    document.getElementById("txttitu").checked = false;
    obj.checked = true;
    
    document.getElementById("txtmag").checked = false;
    document.getElementById("txtmag").checked = false;
    obj.checked = true;
}
////////////////////////////////////
$('#btnRegistrar').on('click', function(){
	
	var vacio = "";
	var linea = [];
	var item = {};
	
	if($("#form1").valid()){
	item.dni       = $('#txtnumdoc').val().trim();
	item.nombre    = $('#txtnom').val().trim();
	item.paterno   = $('#txtpat').val().trim();
	item.materno   = $('#txtmat').val().trim();
	item.edad      = $('#txtedad').val().trim();
	item.turno     = $('#selectTurno').val();
	item.correo    = $('#txtcorreo').val().trim();
	item.contrato  = $('#fechainicio').val().trim();
	item.nacimiento = $('#fechanac').val().trim();
	item.publica    = $('#txtpub:checked').val();
	item.titulado   = $('#txttitu:checked').val();
	item.magister   = $('#txtmag:checked').val();
	item.doctorado  = $('#txtdoc:checked').val();
	item.telefono   = $('#txtfone').val().trim();
	item.nivel      = $('#selectNivel').val();
	linea.push(item); 
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	$.ajax({

			type: 'POST',
			url: '<%=request.getContextPath()%>/RegistrarDocente',
			dataType: 'JSON',
			data: {
				objetojson:JSON.stringify(datosxlinea)
			},
			success: function(data)
			{
			
				if(data == "1")
	    	 	{
	    		 	alert("Se registro al Docente");
	    		 	limpiarDatos();   	 
	    	 	}
	    	 	else
	    	 	{
	    		 	alert("No se pudo registrar al Docente");
	    	 	}
			}
		
	 	});
	} 
	else 
	{
        alert("Datos incompletos.");
    }
		
});
//////////////////////////////////////////////7
function limpiarDatos()
{
	document.getElementById("txtnom").value = "";
	document.getElementById("txtpat").value = "";
	document.getElementById("txtmat").value = "";
	document.getElementById("txtedad").value = "";
	document.getElementById("txtnumdoc").value = "";
	document.getElementById("txtcorreo").value = "";
	document.getElementById("selectTurno").value = "";
	document.getElementById("fechainicio").value = "";
	document.getElementById("fechanac").value = "";

	
}
///////////////////////////////////////////////////////////
</script>
</body>
</html>