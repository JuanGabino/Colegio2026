<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="utf-8">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Registrar Alumnos</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/datepicker/css/bootstrap-datepicker.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/datepicker/js/bootstrap-datepicker.min.js"></script> 	
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
		<div class="col-md-2"></div>
   		<div class="col-md-8">
   			<!-- PANEL BUSQUEDA -->
   			<div class="panel panel-default" id="divPadres">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Registrar Alumno</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divPadreDni" >               
                             <h4><strong>Nº de Documento del Padre</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" onKeyPress="return SoloNumeros(event);"  id="txtnumdoc" name="txtnumdoc" maxlength="8">
                                       <input type="hidden" class="form-control" id="txtcodigo" name="txtcodigo">
                                  </div>
                                  <div class="col-md-2">
                                       <button id ="btnBuscarPadre" name="btnBuscarPadre" type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning form-control">
							    	   		<img src="../Imagenes/buscar.ico"   height="20" width="20">
							  	       </button>
                                  </div>
                             </div>
                        </div>
   	 				</div><br><br>
   	 				<h3><strong>Datos del Padre:</strong></h3>
   	 				<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   	 				<div class="row">
                        	<div class="col-md-4">
   	 							<h4><strong>Nombre:</strong></h4>
   	 							<input type="text" class="form-control" name="txtnom" id="txtnom" disabled>
   	 						</div>
   	 						<div class="col-md-4">
   	 							<h4><strong>Apellido Paterno:</strong></h4>
   	 							<input type="text" class="form-control" name="txtpat" id="txtpat" disabled>
   	 						</div>
   	 						<div class="col-md-4">
   	 							<h4><strong>Apellido Materno:</strong></h4>
   	 							<input type="text" class="form-control" name="txtmat" id="txtmat" disabled>
   	 						</div>
                    </div><br><br>
                    <h3><strong>Datos del Alumno:</strong></h3>
   	 				<hr style="border-color: #3E7BC0; border-width: 5px;" /><br>
   	 				<form action="" id="form1">
   	 				<div id="datosAlumno" class="container-fluid">
   	 				
   	 					<div class="row">
   	 						<div class="col-md-4">
   	 							<h4><strong>Nombre:</strong></h4>
   	 							<input type="text" class="form-control soloTexto" name="txtnombre" id="txtnombre">
   	 						</div>
   	 						<div class="col-md-4">
   	 							<h4><strong>Apellido Paterno:</strong></h4>
   	 							<input type="text" class="form-control soloTexto" name="txtapepat" id="txtapepat">
   	 						</div>
   	 						<div class="col-md-4">
   	 							<h4><strong>Apellido Materno:</strong></h4>
   	 							<input type="text" class="form-control soloTexto" name="txtapemat" id="txtapemat">
   	 						</div>
   	 					</div><br>
   	 					
   	 					<div class="row">
   	 						<div class="col-md-4">
   	 							<h4><strong>Edad:</strong></h4>
   	 							<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtedad" id="txtedad">
   	 						</div>
   	 						<div class="col-md-4">
   	 							<h4><strong>Fecha de Nacimiento: </strong></h4>
   	 							<div class="input-group date fj-date" data-provide="datepicker">
    								<input type="text" class="form-control" id="fechaAlum" name="fechaAlum">
    								<div class="input-group-addon">
        								<img src="../Imagenes/calendario.ico"   height="20" width="20">
    								</div>
						 		</div>
   	 						</div> 
   	 					</div><br>
   	 					 
   	 					<div class="row">
   	 						<div class="col-md-4">
   	 							<h4><strong>Correo:</strong></h4>
   	 							<input type="text" class="form-control" onkeyup="validarEmail(this)" name="txtemail" id="txtemail">
   	 							<a id='resultado' style="text-decoration: none;"></a>
   	 						</div>
   	 						<div class="col-md-4">
								<h4><strong>DNI:</strong></h4>
   	 							<input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" name="txtdni" id="txtdni" maxlength="8">
   	 						</div>
   	 					</div><br>
   	 					
   	 					<div class="row" id="divBuscarCapacidad">
   	 						<div class="col-md-4">
   	 							<h4><strong>Seccion:</strong></h4>
           						<select class="form-control selectSeccion" id="selectSeccion">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	       						</select>
   	 						</div>
   	 						<div class="col-md-4">
   	 							<br><br>
   	 							<button id ="btnCapacidad" name="btnCapacidad" type="button" class="btn btn-warning form-control">
							    	   		<img src="../Imagenes/buscar.ico"   height="20" width="20">
							  	</button>
   	 						</div>
   	 						<div class="col-md-4">
   	 							<br><br>
   	 							<button name="btn_agregar" id="btn_agregar" type="button" class="btn btn-primary">
                                	 Agregar Alumno
                            	</button>
   	 						</div>
   	 					</div>
   	 					<br><br><br>
   	 					
   	 					<div class="row">
   	 						<div class="table-responsive">
   	 							<table class="table" id="table_alumno">
									<thead>
										<tr>
											<th>Nombre</th>
											<th>Apellido Paterno</th>
											<th>Apellido Materno</th>
											<th>Edad</th>
											<th>Fecha Nac.</th>
											<th>Correo</th>
											<th>DNI</th>
											<th>Sección</th>
										</tr>
									</thead>
									<tbody id="tbl_alumno">
	
									</tbody>
								</table>
							</div>
   	 					</div>
   	 				</div>
   	 			    </form>
   	 			</div>
   			</div>
   		</div>
   	</div>
</div>


<!-- MODAL -->
<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

   			<!-- Modal content-->
    		<div class="modal-content">
    		
    			<!-- CABECERA -->
      			<div class="modal-header" style="background-color: #213758;">
        			<button type="button" class="close" data-dismiss="modal" >&times;</button>
        			<h4 class="modal-title" style="color: white;"><strong>LISTA DE PADRES DE FAMILIA</strong></h4>
      			</div>	
      			
      			<!-- CUERPO -->									
      			<div class="modal-body">
        			<div class="row">
   	 					<div class="table-responsive">
   	 							<div class="container-fluid">
   	 								<br>
   	 								<input class="form-control" id="myInput" type="text" placeholder="Buscar..">
   	 								<br>
   	 							</div><br>
   	 							<table class="table" id="table_padre">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
										</tr>
									</thead>
									<tbody id="tbl_padre">
	
									</tbody>
								</table>
						</div>
   	 				</div>
      		    </div><br>
      		    
      		    <!-- FOOTER -->
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			</div>
    	    </div>
  		</div>
</div>

<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<!-- SCRIPTS -->
<script type="text/javascript">
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_padre tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
$(document).ready(function (){
	$("#form1").validate({
		  rules: {
			  txtnombre: {required:true, minlength:2},
			  txtapepat: {required:true, minlength:4},
			  txtapemat: {required:true, minlength:4},
			  txtedad:   {required:true, minlength:1, maxlength:2},
			  txtemail:  {required:true},
		      txtdni:    {required:true, minlength:8, maxlength: 8},
		      fechaAlum: {required:true},
		      selectSeccion: {required:true}
		  },
		  messages: {
			  txtnombre: { required:"Ingresar un nombre", minlength:"Minimo de caracteres es de 2"},
			  txtapepat: { required:"Ingresar apellido paterno", minlength:"Minimo de caracteres es de 4"},
			  txtapemat: { required:"Ingresar apellido materno", minlength:"Minimo de caracteres es de 4"},
			  txtedad:   { required:"Ingresar edad", minlength:"Minimo de caracteres es de 1", maxlength:"Máximo de caracteres es de 2"},
			  txtemail:  { required:"Ingresar un correo electronico"},
		      txtdni:    { required:"Ingresar su número de DNI", minlength: "Minimo de caracteres es de 8"},
		      fechaAlum: { required:"Ingresar una fecha"},
		      selectSeccion: {required:"Seleccione una seccion"}
		  }
	});
});
</script>
<script type="text/javascript">
//////////////////////////////////////////////////////////
$('.soloTexto').keyup(function(e) {
		  var regex = /^[a-zA-Z ]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^a-zA-Z]+/, '');
	});
/////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////
function validarEmail(elemento){

  var texto = document.getElementById(elemento.id).value;
  var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
  
  if (!regex.test(texto)) {
      document.getElementById("resultado").innerHTML = "Correo invalido";
  } else {
    document.getElementById("resultado").innerHTML = "";
  }

}
//////////////////////////////////////////////////////////
$('#btn_agregar').click(function() {
	
		var linea = [];
		var item = {};
		
		 var suma = 0;
		 var vacio="";
		 

	    var cont = 1;
	 
	    if($("#form1").valid())
	    {  
	    	 item.nombre       = $('#txtnombre').val();
			 item.paterno      = $('#txtapepat').val();
			 item.materno      = $('#txtapemat').val();
			 item.dni          = $('#txtdni').val();
			 item.edad         = $('#txtedad').val();
			 item.nacimiento   = $('#fechaAlum').val();
			 item.correo       = $('#txtemail').val();
			 item.seccion      = $('#selectSeccion').val();
			 item.padre        = $('#txtcodigo').val();	
			 
			 linea.push(item);
				
			var datosxlinea={};
			datosxlinea.linea = linea;
				
			var datatable = JSON.stringify(datosxlinea);
			console.log(datatable);
				
	    	$.ajax({
				
				type: 'POST',
				url: '<%=request.getContextPath()%>/RegistrarAlumno',
				dataType: 'JSON',
				data: {
					objetojson:JSON.stringify(datosxlinea)
				},
				success: function(data){
				
					if(data == "1")
		    	 	{
		    		 	alert("Se registro los datos del Alumno");
		    		 			
		    		 	
		    		 	$('#table_alumno')
		    					.append(
		    						'<tr><td>'
		    								+ item.nombre
		    								+ '</td><td>'
		    								+ item.paterno
		    								+ '</td><td>'
		    								+ item.materno
		    								+ '</td><td>'
		    								+ item.edad
		    								+ '</td><td>'
		    								+ item.nacimiento
		    								+ '</td><td>'
		    								+ item.correo
		    								+ '</td><td>'
		    								+ item.dni
		    								+ '</td><td>'
		    								+ item.seccion
		    								+'</td><td><button name="btn_eliminar" id="btn_eliminar" type="button" class="btn btn-danger"><img src="../Imagenes/eliminar.ico"   height="20" width="20">Eliminar</button></td></tr>'
		    					)
		    			
		    					
		    			document.getElementById("txtnombre").value = "";
		    			document.getElementById("txtapepat").value = "";
		    			document.getElementById("txtapemat").value = "";
		    			document.getElementById("txtedad").value = "";
		    			document.getElementById("txtdni").value = "";
		    			document.getElementById("fechaAlum").value = "";
		    			document.getElementById("txtemail").value = "";
		    	 	}
		    	 	else
		    	 	{
		    		 	alert("No se pudo registrar los datos del Alumno");
		    	 	}
				}
			
		 	});    	
	    }
	  	else
	  	{
	  		alert("DATOS INCOMPLETOS");
	  	}		
	});
/////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  <%=request.getContextPath()%>/ListarSeccion',
		success: function(data)
        { 
			$('#selectSeccion').empty();
        	$('#selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectSeccion').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////
$('#divBuscarCapacidad').on('click', '#btnCapacidad', function(){
	
	var seccion  = $('#selectSeccion').val();
	var vacio = ""
	
	if(seccion == vacio)
	{
		alert("Seleccione una Sección");
		
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ContarSecciones',
        data : {
        	
        	seccion : seccion
        	
		},
        success: function(data)
        {          
			if(data === "vacio"){
				
				alert("No hay alumnos en esta sección");
			}
			else
			{
				var array = data.split("$");
				for (var i = 0; i < array.length - 1; i++) {
					
					var capacidad   = array[i].split("/")[0];

				}
				alert("Actualmente hay: " + capacidad + " alumnos matriculados"); 
			}
        }
	});
	
	}	
});
////////////////////////////////////////////////////////////////////
$('#divPadreDni').on('click', '#btnBuscarPadre', function(){

	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/BuscarPadreFamilia',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	$('#tbl_padre').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    = array[i].split("/")[0];
				var dni       = array[i].split("/")[1];
				var nombre    = array[i].split("/")[2];
				var apellidopat 	 = array[i].split("/")[3];
				var apellidomat 	 = array[i].split("/")[4];
				
				    $('#tbl_padre').append("<tr>" +
  				  		"<td><center>"+codigo+"</center></td>" +
  				  		"<td><center>"+dni+"</center></td>" +
  				  		"<td><center>"+nombre+"</center></td>" +
  				  		"<td><center>"+apellidopat+"</center></td>" +
  				  	    "<td><center>"+apellidomat+"</center></td>" +
				  		'<td><center><button type="button" class="btn btn-danger"  id="btnSeleccionar" name="btnSeleccionar" >Seleccionar</button></center></td>'+
  				  		"</tr>");
			}
        }
	});	
});
///////////////////////////////////////////////////////////////////
$('#table_padre').on('click', '#btnSeleccionar', function(){
	
	var codigo  =  $(this).closest('tr').find("td").filter(":eq(0)").text();
	var dni     =  $(this).closest('tr').find("td").filter(":eq(1)").text();
	var nombre  =  $(this).closest('tr').find("td").filter(":eq(2)").text();
	var paterno =  $(this).closest('tr').find("td").filter(":eq(3)").text();
	var materno =  $(this).closest('tr').find("td").filter(":eq(4)").text();
	
	document.getElementById("txtcodigo").value = codigo;
	document.getElementById("txtnumdoc").value = dni;
	document.getElementById("txtnom").value = nombre;
	document.getElementById("txtpat").value = paterno;
	document.getElementById("txtmat").value = materno;
});
///////////////////////////////////////////////////////////////////
</script>
</body>
</html>