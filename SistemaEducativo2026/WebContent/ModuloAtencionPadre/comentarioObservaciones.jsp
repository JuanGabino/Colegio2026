<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
 	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 	<title>Atencion Padre de Familia - LISTA DE COMUNICADOS/OBSERVACIONES</title>
 	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
 
</head>
<body style="background-color: #ECF0F1;">

<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="seccionComunicado.jsp" ><img src="../Imagenes/registro.ico" height="30" width="30"><strong>Generar Comunicado</strong></a></li>
			<li><a href="seccionComentario.jsp"><img src="../Imagenes/observacion.png"width="30" height="30"><strong>Generar Observaciones por Alumno</strong></a></li>
			<li><a href="comentarioObservaciones.jsp"><img src="../Imagenes/listaComunicado.png" width="30" height="30"><strong>Lista de Comunicados</strong></a></li>
			<li><a href="listaObservaciones.jsp"><img src="../Imagenes/listaObservacion.png" width="30" height="30"><strong>Lista de Observaciones por Alumno</strong></a></li>
			<li><a href="registroAsistenciaPadres.jsp"><img src="../Imagenes/report.png"    height="30" width="30"><strong>Registro de Asistencia a Padres</strong></a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<!-- LOGO 
<div class="container-fluid">
	<div class="row">
  		<img src="../Imagenes/insignia2026.png"  width="60" height="60" style="float:left; margin:10px;"><br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  	</div>
</div><br><br>-->

<div class="container-row">   
  
  <div class="col-md-2">
  </div>
   
  <div class="col-md-8" id="contenido">
    	<div class="row">
    		<div class="panel panel-default">
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE COMUNICADOS</strong></h4>
   				</div>
   				<div class="panel-body">
   					<div class="row">
   						<div class="col-md-4">
   							<h4><strong>Seccion:</strong></h4>
         					<select class="form-control selectSeccion" id="selectSeccion">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	     					</select>
   						</div>
   						<div class="col-md-4" id="divBuscarComunicado">
   							<br><br>
	    					<button type="button" class="btn btn-primary" id="btnBuscarComunicado"> Buscar Comunicados</button>
   						</div>
   						<div class="col-md-4">
   							<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   							<input type="hidden"   id="txtcodDocente" name="txtcodDocente" value="">
   						</div>
   					</div>
   					<br><br>
   					<form action="<%=request.getContextPath()%>/ReportePDF" method="post">
   					<div class="table-responsive" id="divTablaComunicados">		
           						<table id="Table" class="table">
            						<thead style="background-color: #284C61;  color: white;">
             							<tr>
              								<th><center>IDCOMUNICADO</center></th>
              								<th><center>TíTULO</center></th>
              								<th><center>DESCRIPCION</center></th>
              								<th><center>FECHA CREADA</center></th>
              								<th></th>
              								<th></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumno"> 
	              
            						</tbody>
           						</table>
           						<input type="hidden" id="idcomunicado" name="idcomunicado">
      				</div>
      				</form>
   				</div>
    		</div>
    	</div>
  </div>
</div>
					            
					            <!-- MODAL MODIFICAR COMUNICADO -->
                				<div id="myModal1" class="modal fade" role="dialog">
 					 					<div class="modal-dialog">

   					  						<!-- Modal content-->
    										<div class="modal-content">
      												<div class="modal-header" style="background-color: #213758;">
        												<button type="button" class="close" data-dismiss="modal" >&times;</button>
        												<h4 class="modal-title" style="color: white;"><strong>MODIFICAR COMUNICADOS</strong></h4>
      												</div>
      												<div class="modal-body"  id="exportContent">
        					
      													<div class="row">
       														<div class="col-md-6">
        														<h5><strong>TÍTULO</strong></h5>
        														<input class="form-control" id="txtTitulo" name="txtTitulo">
        														<input type="hidden"  class="form-control"  name="idCom"   id="idCom">
       														</div>
       													</div>
       													<div class="row">
       														<div class="col-md-6">
																<h5><strong>FECHA GENERADA</strong></h5>
      								   							<input type="text"  class="form-control"  name="txtfecha" id="txtfecha" value="" disabled>
       														</div>
       														<div class="col-md-6">
																<h5><strong>FECHA MODIFICADA</strong></h5>
      								   							<input type="text"  class="form-control"  name="txtfechamod" id="txtfechamod" value="" disabled>
       														</div>
      													</div>
      													<br>
      													<br>
      							    					<div class="container-row">
      							       						<div class="negrita">
                                            					<textarea name="comment" rows=5 cols=70 id="txtdescripcion" name="txtdescripcion" ></textarea>
        							   						</div>
      													</div>
      													<br>
      													<div class="row">
       														<div class="col-md-6">
        														<input name="btnModificarCom" id="btnModificarCom" type="button" class="btn btn-success form-control" value="MODIFICAR COMUNICADOS">
       														</div>
       														<div class="col-md-6">
        														<input type="button" class="btn btn-primary form-control" id="btnLimpiar" name="btnLimpiar" value="LIMPIAR CAMPOS">
       														</div>
      													</div>
      						                        </div>
      												<br>
      												<div class="modal-footer">
        												<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 									</div>
    					                    </div>

  					                    </div>
			                    </div>
					            <!-- FIN MODAL -->
					            
					            <!-- MODAL ELIMINAR COMUNICADO -->
                				<div id="myModal2" class="modal fade" role="dialog">
 					 					<div class="modal-dialog">

   					  						<!-- Modal content-->
    										<div class="modal-content">
      												<div class="modal-header" style="background-color: #213758;">
        												<button type="button" class="close" data-dismiss="modal" >&times;</button>
        												<h4 class="modal-title" style="color: white;"><strong>ELIMINAR COMUNICADOS</strong></h4>
      												</div>
      												<div class="modal-body">
        					
      													<div class="row">
       														<div class="col-md-6">
        														<h5><strong>COMUNICADO: </strong></h5>
        														<input type="text"  class="form-control"  name="txtcod"   id="txtcod" disabled>
       														</div>
      													</div>
      													<br>
      													<div class="row">
       														<div class="col-md-6">
        														<input name="btnEliminarCom" id="btnEliminarCom" type="button" class="btn btn-danger form-control" value="ELIMINAR COMUNICADO">
       														</div>
       														<div class="col-md-6">
        														<input type="reset" class="btn btn-primary form-control" value="CANCELAR">
       														</div>
      													</div>
      						                        </div>
      												<br>
      												<div class="modal-footer">
        												<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 									</div>
    					                    </div>

  					                    </div>
			                    </div>
					            <!-- FIN MODAL -->
					            
					            <!-- MODAL ELIMINAR OBSERVACION -->
                				<div id="myModal3" class="modal fade" role="dialog">
 					 					<div class="modal-dialog">

   					  						<!-- Modal content-->
    										<div class="modal-content">
      												<div class="modal-header" style="background-color: #213758;">
        												<button type="button" class="close" data-dismiss="modal" >&times;</button>
        												<h4 class="modal-title" style="color: white;"><strong>ELIMINAR OBSERVACION</strong></h4>
      												</div>
      												<div class="modal-body">
        					
      													<div class="row">
       														<div class="col-md-6">
        														<h5><strong>OBSERVACION: </strong></h5>
        														<input type="text"  class="form-control"  name="txtobs"   id="txtobs">
       														</div>
      													</div>
      													<br>
      													<div class="row">
        														<input name="btnEliminarObs" id="btnEliminarObs" type="button" class="btn btn-danger form-control" value="ELIMINAR OBSERVACION">
      													</div>
      						                        </div>
      												<br>
      												<div class="modal-footer">
        												<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 									</div>
    					                    </div>

  					                    </div>
			                    </div>
					            <!-- FIN MODAL -->
			
			
		            
<script type="text/javascript">
///////////////////////////////////////////////////
$(document).ready(function(){
	var numdni = $("#txtdni").val();
	$.ajax({
		
		type: 'POST',
		url:  '<%=request.getContextPath()%>/BuscarDocentexDni',
		data: {
		    	
		    	dni : numdni
		},
		success: function(data)
        {
			var array = data.split("$");
			for (var i = 0; i < array.length - 1; i++) {
				
				var codigo    = array[i].split("/")[0];
				var nombre    = array[i].split("/")[1];
				var apellidopat 	 = array[i].split("/")[2];
				var apellidomat 	 = array[i].split("/")[3];
			}
			
			document.getElementById("txtcodDocente").value = codigo;
        }
	});
});
///////////////////////////////////////////////////
$(document).ready(function(){
	
	var numdni = $("#txtdni").val();
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarSeccionDocente',
	    data: {
	    	
	    	dni : numdni
	    },
		success: function(data)
        { 
			$('#selectSeccion').empty();
        	$('#selectSeccion').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectSeccion').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////////////////////
$('#divBuscarComunicado').on('click', '#btnBuscarComunicado', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var dni = $('#txtcodDocente').val().trim();
	
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione una Sección");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/BuscarComunicado',
        data : {
        	dni : dni,
			seccion : sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			var vacio = "";
			if(data == vacio){
				alert("No hay registro de Comunicados");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var descripcion = array[i].split("/")[1];
					var fecha = array[i].split("/")[2];
					var tipo = array[i].split("/")[3];
	
					
  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+tipo+"</center></td>" +
	  				  		"<td><center>"+descripcion+"</center></td>" +
	  				  		"<td><center>"+fecha+"</center></td>" +
	  				  		'<td><center><button type="button" class="btn btn-warning" id="btnModificarComunicado" name="btnModificarComunicado" data-toggle="modal" data-target="#myModal1">Modificar</button></center></td>'+
	  				  		'<td><center><button type="button" class="btn btn-danger" id="btnEliminarComunicado" name="btnEliminarComunicado" data-toggle="modal" data-target="#myModal2">Eliminar</button></center></td>'+
	  				  		'<td><center><button type="submit" class="btn btn-primary" id="btnExportarPDF" name="btnExportarPDF">Exportar PDF</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
////////////////////////////////////////////////////////
$('#divTablaComunicados').on('click', '#btnModificarComunicado', function(){

	var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
	var f=new Date();
	document.getElementById("txtfechamod").value = f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear();
		
	var fecha ="";
	var tipo = "";
	var descripcion = "";
	var id = "";
	
    fecha   = $(this).closest('tr').find("td").filter(":eq(3)").text();
    tipo = $(this).closest('tr').find("td").filter(":eq(1)").text();
    descripcion = $(this).closest('tr').find("td").filter(":eq(2)").text();
    id  = $(this).closest('tr').find("td").filter(":eq(0)").text();
    
    document.getElementById("txtfecha").value = fecha;
    document.getElementById("txtTitulo").value = tipo;
    document.getElementById("txtdescripcion").value = descripcion;
    document.getElementById("idCom").value = id;
	
	
});
/////////////////////////////////////////
$('#divTablaComunicados').on('click', '#btnEliminarComunicado', function(){
	
	var idcom = "";
	idcom  = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	document.getElementById("txtcod").value = idcom;
});
/////////////////////////////////////////////////////////////
 $('#btnModificarCom').on('click', function(){ 
	 
	 	var parametro0= $("#idCom").val();
		var parametro1= $("#txtfechamod").val();
		var parametro2= $("#selectTip").val();
		var parametro3= $("#txtdescripcion").val();
		
		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/ModificarComunicado',
            data: { 
            	idCom		: parametro0,
     			fechaMod   	: parametro1,
     			tipo    	: parametro2,
     			descripcion	: parametro3
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Se Modifico el Comunicado Correctamente.");
     			}else {
     				
     				alert("Hubo un error, no se pudo modificar el comunicado");
     			}	
            }
 		});   
	 
 });
 //////////////////////////////////////////////////////////
 $('#btnLimpiar').on('click', function(){ 
	 
	 document.getElementById("txtdescripcion").value = "";
 });
 ////////////////////////////////////////////////////////////
 $('#btnEliminarCom').on('click', function(){ 
	 
	 var id	=	$("#txtcod").val();
	 var answer = confirm("¿Deseas Eliminar este Comunicado?")
	 
	 if(answer)
	 {
		 $.ajax({
		        type: 'POST',
		        url: '<%=request.getContextPath()%>/EliminarDetalleComunicado',
		        data: {
			        	idcomunicado : id
			        },
		        success: function(data)
		        {
		        	if (data!=null){
		        		
		        		eliminarComunicado();
		        		
					}else {
						
						alert("No se encontró el Comunicado");
					}	
		        }
			});
			
        
 	 }
	 else {
		 
		 alert("Cancelado!!")
	 }
});
//////////////////////////////////////////////////////////
function eliminarComunicado() {
	
	var id	=	$("#txtcod").val();
	 
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/EliminarComunicado',
        data: {
	        	idcomunicado : id
	        },
        success: function(data)
        {
        	if (data!=null){
        		
        		alert("Comunicado Eliminado con Exito!!!");
        		location.reload();
        		
			}else {
				
				alert("No se encontró el Comunicado");
			}	
        }
	});
	
}
/////////////////////////////////////////////////////////////////
$('#divTablaComunicados').on('click', '#btnExportarPDF', function(){
	
	var id = "";
	
	id  = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	document.getElementById("idcomunicado").value = id;
});
//////////////////////////////////////////////////////////////////
</script>

</body>
</html>