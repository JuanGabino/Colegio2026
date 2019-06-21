<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
 	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 	<title>Atencion Padre de Familia</title>
 	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
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

<!-- CUERPO PAGINA -->
<div  class="container-row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
		<div class="row cuerpo">

			<!-- PANEL DE LISTA DE ALUMNOS-->
   			<div class="panel panel-default">
   			
   				<!-- TITULO -->
   				<div class="panel-heading">
	  				<h4><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE ALUMNOS</strong></h4>
   				</div>
   				
   				<!-- CUERPO -->
   				<div class="panel-body">
   					<form name="f1" action="">
    					<div class="row">
    						<div class="col-md-6" id="divDocenteDni" >               
                             	<h4><strong>Seccion:</strong></h4> 
                             	<div class="row">
                                  	<div class="col-md-9">
                                       <select class="form-control selectSeccion" id="selectSeccion">
		   									<option value="" selected disabled hidden>--Seleccionar--</option>
	     								</select><br>
	     								<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
                                  	</div>
                                  	<div class="col-md-2" id="divBuscarAlumnos">
                                       <button id ="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning form-control">
							    	   		<img src="../Imagenes/buscar.ico"   height="20" width="20">
							  	       </button>
                                  	</div>
                             	</div>
                        	</div>
    					</div><br><br>
    					
    					
      			        <div class="row">
      			        	<div class="col-md-6">
                  				<button type="button" class="btn btn-primary form-control"  id="btnSeleccionar" name="btnSeleccionar"><strong>Seleccionar a todos</strong></button>
                			</div>
                			<div class="col-md-6">
                  				<button type="button" class="btn btn-danger form-control"  id="btnDesmarcar" name="btnDesmarcar"><strong>Desmarcar a todos</strong></button>
                			</div>
      			        </div><br><br>
      			        
      			        
      					<div class="table-responsive">		
           						<table id="Table" class="table">
            						<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             							<tr>
              								<th><center>IDALUMNO</center></th>
              								<th><center>NOMBRE </center></th>
              								<th><center>SELECCIONADO</center></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumno"> 
	              
            						</tbody>
           						</table>
      					</div><br><br>
      					
      					<div class="row">
                  				<button type="button" class="btn btn-success form-control" data-toggle="modal" data-target="#myModal2" id="btnGenerarModal" name="btnGenerarModal"><strong>Generar Comunicados</strong></button>
      			        </div>
                    </form>
                </div>
            </div>
        </div>
	</div>
</div>





									<!-- Modal -->
									<div id="myModal2" class="modal fade" role="dialog">
 					 					<div class="modal-dialog">

   										<!-- Modal content-->
    										<div class="modal-content">
      											<div class="modal-header" style="background-color: #213758;">
        											<button type="button" class="close" data-dismiss="modal" >&times;</button>
        											<h4 class="modal-title" style="color: white;"><strong>GENERAR COMUNICADO</strong></h4>
      											</div>
      											<div class="modal-body"  id="exportContent">
        					
      												<div class="row">
      			 										<div class="col-md-4">
        													<h5><strong>FECHA</strong></h5>
        													<input type="text" class="form-control" name="fecha" id="fecha" value="" disabled>
       													</div>
       													<div class="col-md-4">
        													<h5><strong>CODIGO DOCENTE</strong></h5>
        													<input type="text" id="txtcodDocente" name="txtcodDocente" class="form-control" value="" disabled>
       													</div>
       													<div class="col-md-4">
        													<h5><strong>TIPO</strong></h5>
        													<select class="form-control selectTipo" id="selectTipo">
          														<option value="">--------Seleccionar--------</option>
          														<option value="Urgente"> Urgente </option>
          														<option value="Reunion"> Reunion</option>
          														<option value="Formal"> Formal </option>
        													</select>
       													</div>
      												</div>
      												<br><br>
      							    				<div class="container-row">
      							       					<div class="negrita">
                                            				<textarea name="comment" rows=5 cols=70 id="texto" name="texto" ></textarea>
        							   					</div>
      												</div>
      												<br>
      												<br>
      												<div class="row">
       													<button class="btn btn-success form-control" id="btn_registrar" name="btn_registrar">REGISTRAR COMUNICADO</button>
      												</div>
      										     </div>
      											<div class="modal-footer">
        											<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 								</div>
    					                    </div>

  					                    </div>
					                </div>
									<!-- FIN MODAL -->
			
									
<script type="text/javascript">
  var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
  var f=new Date();
	document.getElementById("fecha").value = f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear();
</script>

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
//////////////////////////////////////////////////////////////////////////////////
$('#btnGenerarModal').on('click', function(){
	 
	var validado = false;
	for (i=0;i<document.f1.elements.length;i++){
	      if(document.f1.elements[i].type == "checkbox" && document.f1.elements[i].checked == true)
	      {
	    	  validado = true;
	    	  $('#btn_registrar').attr("disabled", false);
	      }
	}
	if(!validado)
	{
		alert("Seleccione al menos UN alumno Generar Comunicado");
		$('#btn_registrar').attr("disabled", true);
	}
});
//////////////////////////////////////////////////////////
$('#btnSeleccionar').on('click', function(){
	
	seleccionar_todo();
});
$('#btnDesmarcar').on('click', function(){
	
	deseleccionar_todo();
});
/////////////////////////////////////////////////////////////
function seleccionar_todo(){ 
   for (i=0;i<document.f1.elements.length;i++) 
      if(document.f1.elements[i].type == "checkbox")	
         document.f1.elements[i].checked=1 
};
/////////////////////////////////
function deseleccionar_todo(){ 
   for (i=0;i<document.f1.elements.length;i++) 
      if(document.f1.elements[i].type == "checkbox")	
         document.f1.elements[i].checked=0 
}
////////////////////////////////////////////////////
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione una Sección");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/ListarAlumnoxSeccion',
        data : {
			seccion : sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("=")[0];
					var nombre = array[i].split("=")[1];
					var apellidopat = array[i].split("=")[2];
					var apellidomat = array[i].split("=")[3];
	
					

  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+nombre+" "+apellidopat+" "+apellidomat+"</center></td>" +
	  				  		'<td><center><input type="checkbox" id="checkbox" name="checkbox" value="'+id+'"></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
//////////////////////////////////////////////////////
$('#btn_registrar').on('click', function(){
	
	var linea = [];
	var item = {};
	
	item.texto       = $('#texto').val().trim();
	item.selectTipo  = $('#selectTipo').val();
	item.fecha       = $('#fecha').val().trim();
	item.selectSeccion = $('#selectSeccion').val();
	item.txtdni        = $('#txtcodDocente').val().trim();
	
	linea.push(item);
	
	var datosxlinea={};
	datosxlinea.linea = linea;
	
	var datatable = JSON.stringify(datosxlinea);
	console.log(datatable);
	
	if( $('#selectTipo').val() != "" )
	{
	 $.ajax({
		
		type: 'POST',
		url: '<%=request.getContextPath()%>/RegistrarComunicado',
		dataType: 'JSON',
		data: {
			objetojson:JSON.stringify(datosxlinea)
		},
		success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro el Comunicado");
	    		 registrarDetalleComunicado();
	    		 document.getElementById("texto").value = "";
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE REGISTRO COMUNICADO");
	    	 }
		}
		
	 });
	 
	}
	else
	{
		alert("Seleccione un Tipo de Reunion");
	}
		
});
/////////////////////////////////////////////////////
function registrarDetalleComunicado(){
	
	 var linea1 = [];
	   $("input[type=checkbox]:checked").each(function(el) { 
		 
		 var itemDetalle = {};
		 var tds = $(this).find("td");
		 
		 itemDetalle.idAlumno = $(this).closest('tr').find("td").filter(":eq(0)").text();
			
		 linea1.push(itemDetalle);
	  }); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarDetalleComunicado',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("EL COMUNICADO FUE MANDADO A LOS ALUMNOS");
	    		 	    	 
	    	 }
	    	 else
	    	 {
	    		 alert("NO SE PUDO MANDAR EL COMUNICADO A LOS ALUMNOS, INTENTE DE NUEVO");
	    	 }
		   }
		 
		 
	 	});
	 
	
};
//////////////////////////////////////
</script>

</body>
</html>