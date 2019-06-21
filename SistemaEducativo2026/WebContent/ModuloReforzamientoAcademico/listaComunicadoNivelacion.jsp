<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Comunicados Nivelación</title>
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
      		<li><a href="comunicadoReforzamiento.jsp"><img src="../Imagenes/registro.ico"   height="30" width="30">Círculo de Reforzamiento</a></li>
      		<li><a href="listaComunicadoNivelacion.jsp"><img src="../Imagenes/report.png"   height="30" width="30">Lista de Comunicados Nivelación</a></li>      		
      		<li><a href="asistenciaReforzamiento.jsp"><img src="../Imagenes/asistencia.png" height="30" width="30">Asistencia de Nivelación</a></li>
      		<li><a href="sesionesdeAprendizaje.jsp"><img src="../Imagenes/libro.png"      height="30" width="30">Sesiones de Aprendizaje</a></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

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
   							<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   						</div>
   					</div>
   					<form action="<%=request.getContextPath()%>/ReportePDF" method="post">
   					<div class="table-responsive" id="divTablaComunicados">	
   								<br>	
   								<input class=form-control id=myInput type=text placeholder=Buscar...>
   								<br>
           						<table id="Table" class="table">
            						<thead style="background-color: #284C61;  color: white;">
             							<tr>
              								<th><center>IDCOMUNICADO</center></th>
              								<th><center>TíTULO</center></th>
              								<th><center>DESCRIPCION</center></th>
              								<th><center>FECHA CREADA</center></th>
              								<th><center>SECCIÓN</center></th>
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
        												<h4 class="modal-title" style="color: white;"><strong>MODIFICAR COMUNICADO</strong></h4>
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
					            		
	
<script type="text/javascript">
///////////////////////////////////////////////////
$(document).ready(function(){
	
	var codigo = $("#txtdni").val().trim();
	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarComunicadoNivelacion',
        data: {
        	codigo: codigo
        },
        success: function(data)
        {            	
        	var array = data.split("$");
			var vacio = "";
			if(data == vacio){
				alert("No hay registro de Comunicados");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("|")[0];
					var descripcion = array[i].split("|")[1];
					var fecha = array[i].split("|")[2];
					var tipo = array[i].split("|")[3];
					var seccion = array[i].split("|")[4];
	
					
  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+tipo+"</center></td>" +
	  				  		"<td><center>"+descripcion+"</center></td>" +
	  				  		"<td><center>"+fecha+"</center></td>" +
	  				  		"<td><center>"+seccion+"</center></td>" +
	  				  		'<td><center><button type="button" class="btn btn-warning" id="btnModificarComunicado" name="btnModificarComunicado" data-toggle="modal" data-target="#myModal1">Mdificar</button></center></td>'+
	  				  		'<td><center><button type="submit" class="btn btn-primary" id="btnExportarPDF" name="btnExportarPDF">Exportar PDF</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	
});
//////////////////////////////////////////////////////////////
$('#divTablaComunicados').on('click', '#btnExportarPDF', function(){
	
	var id = "";
	
	id  = $(this).closest('tr').find("td").filter(":eq(0)").text();
	
	document.getElementById("idcomunicado").value = id;
});
//////////////////////////////////////////////////////////////////
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbl_alumno tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
});
////////////////////////////////////////////////////////////////////
$('#divTablaComunicados').on('click', '#btnModificarComunicado', function(){
	
	n =  new Date();
	//Año
	y = n.getFullYear();
	//Mes
	m = n.getMonth() + 1;
	//Día
	d = n.getDate();
	document.getElementById("txtfechamod").value = d + "/" + m + "/" + y; 
		
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
/////////////////////////////////////////////////////
$('#btnModificarCom').on('click', function(){ 
	 
	 	var parametro0= $("#idCom").val();
		var parametro1= $("#txtfechamod").val();
		var parametro2= $("#txtTitulo").val();
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
					$('#myModal1').hide();
     			}else {
     				
     				alert("Hubo un error, no se pudo modificar el comunicado");
     			}	
            }
 		});   
	 
 });
</script>
</body>
</html>