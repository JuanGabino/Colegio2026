<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Asignar Curso Docente</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	
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
   			<div class="panel panel-default">
    		
    			<!-- CABECERA -->
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><img src="../Imagenes/lista.png" height="40" width="50"><strong>Asignar Curso Docente</strong></h4>
   	 			</div>
   	 			
   	 			<!-- CUERPO -->
   	 			<div class="panel-body">
   	 				<div class="row">
   	 					<div class="col-md-6" id="divDocenteDni">               
                             <h4><strong>Nº de Documento</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" id="txtnumdoc" name="txtnumdoc">
                                       <input type="hidden" class="form-control" id="txtcodigo" name="txtcodigo">
                                  </div>
                                  <div class="col-md-2">
                                       <button id ="btnBuscarDocente" name="btnBuscarDocente" type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning form-control">
							    	   		<img src="../Imagenes/buscar.ico"   height="20" width="20">
							  	       </button>
                                  </div>
                             </div>
                        </div>
   	 				</div><br><br>
   	 				<h3><strong>Datos del Docente:</strong></h3>
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
                    <div class="row">
                    	<div class="col-md-4">
   	 							<h4><strong>Seccion:</strong></h4>
           						<select class="form-control selectSeccion" id="selectSeccion">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	       						</select>
   	 					</div>
   	 					<div class="col-md-4">
   	 							<h4><strong>Curso:</strong></h4>
           						<select class="form-control selectCurso" id="selectCurso">
		   							<option value="" selected disabled hidden>--Seleccionar--</option>
	       						</select>
   	 					</div>
   	 					<div class="col-md-4">
   	 						<div class="col-md-4">
   	 							<br><br>
   	 							<button name="btn_agregar" id="btn_agregar" type="button" class="btn btn-primary">
                                	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Agregar
                            	</button>
   	 						</div>
   	 					</div>
                    </div><br><br>
                    <div class="row">
   	 						<div class="table-responsive">
   	 							<table class="table" id="table_docente">
									<thead>
										<tr>
											<th style="text-align: center;">N° DNI</th>
											<th style="text-align: center;">Sección</th>
											<th style="text-align: center;">Curso</th>
										</tr>
									</thead>
									<tbody id="tbl_docente">
	
									</tbody>
								</table>
							</div>
   	 				</div><br><br>
   	 				<div class="container-fluid" id="BotonRegistrar">
   	 					<button class="btn btn-success form-control" id="btnRegistrar" name="btnRegistrar">Registrar Cursos</button>
   	 				</div>
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
        			<h4 class="modal-title" style="color: white;"><strong>LISTA DE DOCENTES 2026</strong></h4>
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
   	 							<table class="table" id="table_docentes">
									<thead>
										<tr>
											<th style="text-align: center;">Codigo</th>
											<th style="text-align: center;">DNI</th>
											<th style="text-align: center;">Nombre</th>
											<th style="text-align: center;">Apellido Paterno</th>
											<th style="text-align: center;">Apellido Materno</th>
										</tr>
									</thead>
									<tbody id="tbl_docentes">
	
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


<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<!-- SCRIPTS -->
<script type="text/javascript">
//////////////////////////////////////////
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
////////////////////////////////////////////////
$('#divDocenteDni').on('click', '#btnBuscarDocente', function(){

	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarDocentexCodigo',
		success: function(data)
        { 
			
        	var array = data.split("$");
        	 $('#tbl_docentes').empty();
        	for (var i = 0; i < array.length - 1; i++) {
				var codigo    = array[i].split("/")[0];
				var dni       = array[i].split("/")[1];
				var nombre    = array[i].split("/")[2];
				var apellidopat 	 = array[i].split("/")[3];
				var apellidomat 	 = array[i].split("/")[4];
				
				    $('#tbl_docentes').append("<tr>" +
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
/////////////////////////////////////////////////////////
$('#table_docentes').on('click', '#btnSeleccionar', function(){
	
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
//////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarSeccion',
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
//////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarCursos',
		success: function(data)
        { 
			$('#selectCurso').empty();
        	$('#selectCurso').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectCurso').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////
$('#btn_agregar').click(function() {
		
		 var curso 		  = document.getElementById("selectCurso");
		
		 var cursoid      = curso.value;
		 var cursoasi	  = curso.options[curso.selectedIndex].innerText; 
		 var dni          = $('#txtnumdoc').val().trim();
		 var seccion      = $('#selectSeccion').val().trim();
		
		 var suma = 0;
		 var vacio="";
		 

	    var cont = 1;
	 
	    if(cursoasi == vacio || seccion == vacio)
	    {  
	    	alert("No se agrego el curso, rellene campo obligatorios");
	    }
	  	else
	  	{
	    	$('#table_docente')
			.append(
				'<tr><td style="text-align: center;">'
						+ dni
						+ '</td><td style="text-align: center;">'
						+ seccion
						+ '</td><td style="text-align: center;">'
						+ cursoasi
						+ '<input type="hidden" value = "'+cursoid+'">'
						+'</td><td style="text-align: center;"><button name="btn_eliminar" id="btn_eliminar" type="button" class="btn btn-danger"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Eliminar</button></td></tr>')
       
	
			document.getElementById("selectCurso").value = "";
			document.getElementById("selectSeccion").value = "";
	  	}
				
	});
///////////////////////////////////////////////////////////////
$('#table_docente').on('click', '#btn_eliminar', function(){

  		var hi= confirm("¿Eliminar curso y sección seleccionado?");
  	    if (hi== true)
  	    {
  	        alert("Eliminado");
  	        $(this).closest('tr').remove();
  	    }
  	});
/////////////////////////////////////////////////////////////
$('#BotonRegistrar').on('click', '#btnRegistrar', function(){
	registrarDetalleCurso();
});
/////////////////////////////////////////////////////////////
function registrarDetalleCurso(){
	
	 	 var linea1 = [];
	 	 
	 	$("#tbl_docente tr ").each(function(el) { 
		 var itemDetalle = {};
		 
		 itemDetalle.docente = $("#txtcodigo").val().trim();
		 itemDetalle.seccion = $(this).closest('tr').find("td").filter(":eq(1)").text();
		 itemDetalle.curso = $(this).closest('tr').find("td").filter(":eq(2)").children('input').val()
			
		 linea1.push(itemDetalle);
		}); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarCursoSeccion',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro el detalle de cursos y secciones");
	    		 document.getElementById("txtnom").value = "";
				 document.getElementById("txtpat").value = "";
				 document.getElementById("txtmat").value = ""; 
				 document.getElementById("txtcodigo").value = "";
				 document.getElementById("txtnumdoc").value = "";
				 document.getElementById("selectSeccion").value = "";
				 document.getElementById("selectCurso").value="";
				 $("#tbl_docente").empty();
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("No se pudo registrar los datos, intentelo de nuevo");
	    	 }
		   }
		  
	 	});	
};
</script>
</body>
</html>