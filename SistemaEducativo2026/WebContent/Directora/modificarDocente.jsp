<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1"> 
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Mantenimiento Docentes</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
	String dni = request.getParameter("txtcodigo");
	String nom = request.getParameter("txtnombre");
	String pat = request.getParameter("txtpaterno");
	String mat = request.getParameter("txtmaterno");
	String edad = request.getParameter("txtedad");
	String correo = request.getParameter("txtcorreo");
	String tele = request.getParameter("telefono");
	String nacimiento = request.getParameter("fechanacimiento");
	String contrato = request.getParameter("fechacontrato");
	String carrera = request.getParameter("carrera");
	String titulado = request.getParameter("titulado");
	String magister = request.getParameter("magister");
	String doctorado = request.getParameter("doctorado");
	String turno = request.getParameter("txtturno");
	String nivel = request.getParameter("nivel");
%>

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
   		<div class="col-md-6">
   			<!-- PANEL BUSQUEDA -->
    		<div class="panel panel-default" id="divAlumnos">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Mantenimiento Docente</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<form action="" id="form1">
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni" >               
                             <h4><strong>Nº de Documento</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" id="txtnumdoc" name="txtnumdoc" value="<%out.print(dni); %>" disabled>
                                  </div>
                             </div>
                        </div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Nombre:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtnombre" id="txtnombre" value="<%out.print(nom); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Paterno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtapepat" id="txtapepat" value="<%out.print(pat); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Apellido Materno:</strong></h4>
   	 						<input type="text" class="form-control soloTexto" name="txtapemat" id="txtapemat" value="<%out.print(mat); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Edad:</strong></h4>
   	 						<input type="number" class="form-control" name="txtedad" id="txtedad" onKeyPress="return SoloNumeros(event);" value="<%out.print(edad); %>">
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Correo:</strong></h4>
   	 						<input type="email" class="form-control" name="txtemail" id="txtemail" onkeyup="validarEmail(this)" value="<%out.print(correo); %>">
   	 					</div>
   	 					<div class="col-md-4">
							<h4><strong>Teléfono:</strong></h4>
   	 						<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtfone" id="txtfone" maxlength="9" value="<%out.print(tele); %>">
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
							<h4><strong>Fecha Nacimiento: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechanac" name="fechanac" value="<%out.print(nacimiento); %>">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Fecha que empezó a Laborar: </strong></h4>
                         	<div class="input-group date fj-date" data-provide="datepicker">
    							<input type="text" class="form-control" id="fechainicio" name="fechainicio" value="<%out.print(contrato); %>">
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Pertenece a la Carrera Pública Magisterial:</strong></h4>
   	 						<input type="hidden" id="txtpublico" name="txtpublico" value="<%out.print(carrera); %>">
   	 						<input type="radio" class="pubSi" id="txtpub" name="txtpub" value="SI" onclick="apagar(this);"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="pubNo" id="txtpub" name="txtpub" value="NO" onclick="apagar(this);"><label>NO</label>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Titulado:</strong></h4>
   	 						<input type="hidden" id="txttitulado" name="txttitulado" value="<%out.print(titulado); %>">
   	 						<input type="radio" class="tituSi" id="txttitu" name="txttitu" value="SI" ><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="tituNo" id="txttitu" name="txttitu" value="NO" ><label>NO</label>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Magister:</strong></h4>
   	 						<input type="hidden" id="txtmagister" name="txtmagister" value="<%out.print(magister); %>">
   	 						<input type="radio" class="magSi" id="txtmag" name="txtmag" value="SI"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="magNo" id="txtmag" name="txtmag" value="NO"><label>NO</label>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Doctorado:</strong></h4>
   	 						<input type="hidden" id="txtdoctorado" name="txtdoctorado" value="<%out.print(doctorado); %>">
   	 						<input type="radio" class="docSi" id="txtdoc" name="txtdoc" value="SI"><label>SI</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 						<input type="radio" class="docNo" id="txtdoc" name="txtdoc" value="NO"><label>NO</label>
   	 					</div>
   	 				</div><br>
   	 				<div class="row">
   	 					<div class="col-md-4">
   	 						<h4><strong>Turno:</strong></h4>
   	 						<input type="hidden" id="txtturno" name="txtturno" value="<%out.print(turno); %>">
           					<select class="form-control selectTurno" id="selectTurno">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="mañana">Mañana</option>
		   							<option value="tarde">Tarde</option>
	       					</select>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<h4><strong>Nivel:</strong></h4>
   	 						<input type="hidden" id="txtnivel" name="txtnivel" value="<%out.print(nivel); %>">
           					<select class="form-control selectNivel" id="selectNivel" name="selectNivel" required>
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
		   							<option value="Primaria">Primaria</option>
		   							<option value="Secundaria">Secundaria</option>
	       					</select>
   	 					</div>
   	 				</div>
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
   	 					<button class="btn btn-success btn-block" id="btnModificarDocente" name="btnModificarDocente"><strong>MODIFICAR DOCENTE</strong></button>
   	 				</div>
   	 				<div class="row">
   	 					<br><br>
   	 					<button class="btn btn-primary btn-block" id="btnVolver" name="btnVolver"><strong>VOLVER</strong></button>
   	 				</div>
   	 			</div>
    		</div>
   	 	</div>
   	 </div>
</div>

<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function (){
	$("#form1").validate({
		  rules: {
			  txtnombre: {required:true, minlength:2},
			  txtapepat: {required:true, minlength:4},
			  txtapemat: {required:true, minlength:4},
			  txtedad:   {required:true, minlength:2, maxlength:2},
			  txtemail:  {required:true},
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
			  txtapepat: { required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 4"},
			  txtapemat: { required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 4"},
			  txtedad: { required:"Ingresar edad", minlength:"Minimo de caracteres es de 2", maxlength:"Máximo de caracteres es de 2"},
			  txtemail: { required:"Ingresar un correo electronico"},
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
/////////////////////////////////////////////
$('#btnVolver').on('click', function(){ 
	
	window.location.href ="<%=request.getContextPath()%>/listarDocente.jsp";
})
/////////////////////////////////////////
$(document).ready(function(){
	
	var pub  = document.getElementById("txtpublico").value;
	var titu = document.getElementById("txttitulado").value;
	var mag  = document.getElementById("txtmagister").value;
	var doc  = document.getElementById("txtdoctorado").value;
	var turno = document.getElementById("txtturno").value;
	var nivel = document.getElementById("txtnivel").value;
	
	if(turno == 'ma?ana')
	{
		tur = 'mañana';
		document.getElementById("selectTurno").value = tur;
	}
	
	document.getElementById("selectNivel").value = nivel;
	document.getElementById("txtmag").value = mag;
		
	if(mag == "SI")
	{
		$(".magSi").prop("checked", true);
	}
	else if(mag == "NO")
	{
		$(".magNo").prop("checked", true);
	}
	
	if(doc == "SI")
	{
		$(".docSi").prop("checked", true);
	}
	else if(doc == "NO")
	{
		$(".docNo").prop("checked", true);
	}
	
	if(titu == "SI")
	{
		$(".tituSi").prop("checked", true);
	}
	else if(titu == "NO")
	{
		$(".tituNo").prop("checked", true);
	}
	
	if(pub == "SI")
	{
		$(".pubSi").prop("checked", true);
	}
	else if(pub == "NO")
	{
		$(".pubNo").prop("checked", true);
	}

});
/////////////////////////////////////////////
$('.soloTexto').keyup(function(e) {
		  var regex = /^[a-zA-Z ]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^a-zA-Z]+/, '');
	});
//////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////
//$('#btnBuscar').on('click', function(){ 
//	console.log("click en boton Buscar Docente.");
//	
//	 var var1	=	$("#txtnombre").val();
//	 var var2	=	$("#txtapepat").val();
//	 var var3	=	$("#txtapemat").val();
//	 var var4	=	$("#txtnumdoc").val();
//	 
//	 if((var1.length>=2 && var2.length>=2 && var3.length>=2) || (var4.length >= 8)){  
//	       
//	       $.ajax({
//		        type: 'POST',
//		        url: '/SistemaEducativo2026/BuscarDocente',
//		        data: {
//			        	nombre : $('#txtnombre').val(),
//			        	apepat : $('#txtapepat').val(),
//			        	apemat : $('#txtapemat').val(),
//			        	dni    : $('#txtnumdoc').val()
//			        },
//		        success: function(data)
//		        {
//		        	if (data==="vacio")
//		        	{
//						alert("No se encontró al Docente");
//					}
//		        	else 
//		        	{
//						var listaNombres = data.split("-|");
//						$("#txtnombre").val(listaNombres[1]);
//						$("#txtapepat").val(listaNombres[2]);
//						$("#txtapemat").val(listaNombres[3]);
//						$('#txtedad').val(listaNombres[4]);
//						$("#selectTurno").val(listaNombres[5]);
//						$("#txtemail").val(listaNombres[6]);
//						$("#fechainicio").val(listaNombres[7]);
//						$("#fechanac").val(listaNombres[8]);
//						var pub=listaNombres[9]== "SI" ? "SI" : "NO";
//						$('input[name="txtpub"][value='+pub+']').prop('checked',true);
//
//						var titulado=listaNombres[10]== "1" ? "SI" : "NO";
//						$('input[name="txttitu"][value='+titulado+']').prop('checked',true);
//						var maestria=listaNombres[11]== "1" ? "SI" : "NO";;
//						$('input[name="txtmag"][value='+maestria+']').prop('checked',true);
//						var doctorado=listaNombres[12]== "1" ? "SI" : "NO";;
//						$('input[name="txtdoc"][value='+doctorado+']').prop('checked',true);
//						
//						$("#txtfone").val(listaNombres[13]);
//						$("#selectNivel").val(listaNombres[14]);
//					  }	
//		        	}
//				});
//	 } else {
//	        alert("Error: La busqueda es por DNI o por los campos Nombre, Apellido paterno y materno");
//	 }
//});
////////////////////////////////////////////////////////////////////////
$('#btnModificarDocente').on('click', function(){ 

	var turno = $("#selectTurno").val();
	console.log("click en boton Editar Docente.");
	var flag = $("#form1").valid();
	console.log(flag + "-" + turno);
	
	if($("#form1").valid()==true)
	{
		var parametro0= $("#txtnumdoc").val().trim();
		var parametro1= $("#txtnombre").val().trim();
 		var parametro2= $("#txtapepat").val().trim();
 		var parametro3= $("#txtapemat").val().trim();
 		var parametro4= $("#txtedad").val().trim();
 		var parametro5= $("#txtemail").val();
 		var parametro6= $("#selectTurno").val();
 		var parametro7= $("#fechanac").val();
 		var parametro8= $("#fechainicio").val();
 		var parametro9= $('#txtpub:checked').val();
 		var parametro10= $('#txttitu:checked').val();
 		var parametro11= $('#txtmag:checked').val();
 		var parametro12= $('#txtdoc:checked').val();
 		var parametro13= $('#txtfone').val().trim();
 		var parametro14= $('#selectNivel').val();
 		
 		$.ajax({
 			type: 'POST',
 			url:  '<%=request.getContextPath()%>/ModificarDocente',
 			data: {
 				dni		: parametro0,
     			nombre 	: parametro1,
     			paterno 	: parametro2,
     			materno 	: parametro3,
     			edad		: parametro4,	
     			correo   	: parametro5,
     			turno   	: parametro6,
     			nacimiento	: parametro7,
     			contrato	: parametro8,
     			carrera 	: parametro9,
     			titu		: parametro10,
     			maes	    : parametro11,
     			doct	    : parametro12,
     			telefono	: parametro13,
     			nivel	    : parametro14
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