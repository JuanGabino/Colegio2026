<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
	<title>Registro de Asistencia Padres</title>
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
<br><br><br><br><br><br>

<!-- LOGO COLEGIO
<div class="container-fluid">
	<div class="row">
  		<img src="../Imagenes/insignia2026.png"  width="60" height="60" style="float:left; margin:10px;"><br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  	</div>
</div><br><br> -->

<!-- CUERPO DE PAGINA -->
<div class="container-row">  
   <div class="col-md-2">
   </div>
   
   <div class="col-md-8" >
   		<div class="panel panel-default">
    		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">REGISTRAR ASISTENCIA A PADRES	</strong></h4>
   			</div>
   			<div class="panel-body">
   				<div class="row">
   					<div class="col-md-6" >               
                          <h4><strong>Seccion:</strong></h4> 
                          <div class="row">
                              <div class="col-md-8">
                                   <select class="form-control selectSeccion" id="selectSeccion">
		   								<option value="" selected disabled hidden>--Seleccionar--</option>
	     						   </select><br> 
	     						   <input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	     						   <input type="hidden" id="txtcodDocente" name="txtcodDocente" value="" >
                              </div>
                              <div class="col-md-3"  id="divDocenteSeccion">
                                   <button id="btnBuscar" name="btnBuscar" type="button" class="btn btn-warning form-control">
							    	   		Buscar<!-- <img src="../Imagenes/buscar.ico"   height="20" width="20"> !-->
							  	   </button>
                              </div>
                          </div>
                     </div>
                     <div class="col-md-6" > 
                     		<h4><strong>Fecha: </strong></h4>
                         	<div class="input-group date fj-date">
    							<input type="text" class="form-control" id="fecha" name="fecha" disabled>
    							<div class="input-group-addon">
        							<img src="../Imagenes/calendario.ico"   height="20" width="20">
    							</div>
						 	</div>
                     </div>
   				</div><br>
   				<div class="row" id="divPadreDni" >
   	 					<div class="col-md-6">               
                             <h4><strong>DNI Padre</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtnumdocpadre" name="txtnumdocpadre" minlength=8 maxlength=8>
                                  </div>
                             </div>
                        </div>
                        <div class="col-md-6">               
                             <h4><strong>DNI Madre</strong></h4> 
                             <div class="row">
                                  <div class="col-md-9">
                                       <input type="text" class="form-control" onKeyPress="return SoloNumeros(event);" id="txtdnimadre" name="txtdnimadre" minlength=8 maxlength=8><br>
                                  </div>
                                  <div class="col-md-2">
                                       <button id ="btnBuscarPadre" name="btnBuscarPadre" type="button" class="btn btn-warning form-control">
							    	   		<img src="../Imagenes/buscar.ico"   height="20" width="20">
							  	       </button>
                                  </div>
                             </div>
                        </div>
   	 			</div><br>
   	 			<div class="table-responsive" id="tableAsistencia">		
   								<input class=form-control id=myInput type=text placeholder=Buscar..>
   								<br>
           						<table id="Table" class="table">
            						<thead style="background-color: #213758;  color: white;">
             							<tr>
              								<th><center>CODIGO</center></th>
              								<th><center>NOMBRE</center></th>
              								<th><center>APELLIDO PAT.</center></th>
              								<th><center>APELLIDO MAT</center></th>
              								<th><center>ASISTENCIA</center></th>
              								<th><center>PORCENTAJE ASISTENCIA</center></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_asistencia"> 
	              
            						</tbody>
           						</table>
      			</div><br>
      			
      			<div class="row">
      				<div class="col-md-6">
      					<button type="button" class="btn btn-success btn-block" id="btnRegistrar" name="btnRegistrar">Registrar Asistencia</button><br>
      				</div>
      				<div class="col-md-6">
      					<button type="button" class="btn btn-danger  btn-block" id="btnCancelar" name="btnCancelar">Cancelar</button>
      				</div>
      			</div>
   			</div>
   		</div>
   </div>
</div>

<script type="text/javascript">
////////////////////////////////////////
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
/////////////////////////////////////////
$( document ).ready(function() {

    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    $("#fecha").val(today);
});
/////////////////////////////////////////
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbl_asistencia tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
});
////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////
 $('#btnBuscar').on('click', function(){ 
	
	var sec = $('#selectSeccion').val();
	var vacio = "";
	
	if(sec == vacio)
	{
		alert("Seleccione una sección");
	}
	else
	{
		$.ajax({
			type: 'POST',
			url: '<%=request.getContextPath()%>/ListarPadresxSeccion',
			data: {
				seccion: sec
			},
			success: function(data)
			{
				var array = data.split("$");
				var vacio = "vacio";
				if(data == vacio)
				{
					alert("No hay Padres registrados en esta Sección");
				}
				else
				{
					$('#tbl_asistencia').empty();
					for (var i = 0; i < array.length - 1; i++) {
						
						var codigo = array[i].split("/")[0]
						var nombre = array[i].split("/")[1];
						var apellidopat = array[i].split("/")[2];
						var apellidomat = array[i].split("/")[3];	
						
						$('#tbl_asistencia').append("<tr>" +
								"<td><center>"+codigo+"</center></td>" +
								"<td><center>"+nombre+"</center></td>" +
		  				  		"<td><center>"+apellidopat+"</center></td>" +
		  				  	    "<td><center>"+apellidomat+"</center></td>" +
		  				  		'<td><center><select class="form-control" onchange="javascript:txtestado'+i+'.value=this.options[this.selectedIndex].innerHTML;" id="selectAsistencia" name="selectAsistencia">' +
				  		   						'<option value="" selected disabled hidden>Seleccionar</option>' +
				  		   						'<option value="Asistio">Asistio</option>'+
				  		   						'<option value="Falto">Falto</option>'+
				  							'</select></center><input type="hidden" id="txtestado'+i+'" name="txtestado"></td>' +
								"</tr>");
					}
					
				}
			}
		});
		
	}
	
});
/////////////////////////////////////////////////////
 $('#btnBuscarPadre').on('click', function(){ 
	 
	 var dnipadre = $("#txtnumdocpadre").val();
	 var dnimadre = $("#txtdnimadre").val();
	 console.log(dnimadre);
	 $.ajax({
			
			type: 'POST',
		    url:  '<%=request.getContextPath()%>/BuscarPadrexDNI',
		    data: {
		    	dni1 : dnipadre,
		    	dni2 : dnimadre
		    },
			success: function(data)
	        { 
				
	        	var array = data.split("$");
	        	 $('#tbl_asistencia').empty();
	        	for (var i = 0; i < array.length - 1; i++) {
					var codigo    = array[i].split("/")[0];
					var nombre    = array[i].split("/")[1];
					var apellidopat 	 = array[i].split("/")[2];
					var apellidomat 	 = array[i].split("/")[3];
					
					    $('#tbl_asistencia').append("<tr>" +
	  				  		"<td><center>"+codigo+"</center></td>" +
	  				  		"<td><center>"+nombre+"</center></td>" +
	  				  		"<td><center>"+apellidopat+"</center></td>" +
	  				  	    "<td><center>"+apellidomat+"</center></td>" +
	  				  		'<td><center><select class="form-control" onchange="javascript:txtestado'+i+'.value=this.options[this.selectedIndex].innerHTML;" id="selectAsistencia" name="selectAsistencia">' +
	   											'<option value="" selected disabled hidden>Seleccionar</option>' +
	   											'<option value="Asistio">Asistio</option>'+
	   											'<option value="Falto">Falto</option>'+
										'</select></center><input type="hidden" id="txtestado'+i+'" name="txtestado"></td>' +
							"</tr>");
				}
	        }
		});	
	 
 });
/////////////////////////////////////////////////////
$('#btnRegistrar').on('click', function(){
	
	registrarAsistenciaPadre();
});
////////////////////////////////////////////////////
function registrarAsistenciaPadre(){
		
		 var docente = $("#txtcodDocente").val();
	 	 var linea1 = [];
	 	 console.log(docente);
	 	$("#tbl_asistencia tr").each(function(el) { 
		 var itemDetalle = {};
		 
		 itemDetalle.fecha   = $("#fecha").val().trim();
		 itemDetalle.padre   = $(this).closest('tr').find("td").filter(":eq(0)").text();
		 itemDetalle.estado  = $(this).closest('tr').find("td").filter(":eq(4)").children('input').val();
		 itemDetalle.seccion = $("#selectSeccion").val().trim();
		 itemDetalle.docente = $("#txtcodDocente").val();
			
		 linea1.push(itemDetalle);
		}); 
		
	 	var datosxlinea1 = {};
	 	datosxlinea1.linea = linea1;
	 
	 	var datatable1 = JSON.stringify(datosxlinea1);
	 	console.log(datatable1);
	 
	 	$.ajax({
		
		 	type: 'POST',
		 	url: '<%=request.getContextPath()%>/RegistrarAsistenciaPadre',
		 	dataType: 'JSON',
		 	data: {
				objetojson:JSON.stringify(datosxlinea1)
				},
			
			success: function(data){
			
			if(data == "1")
	    	 {
	    		 alert("Se registro la asistencia del padre");
	    	 }
	    	 else
	    	 {
	    		 alert("No se pudo registrar la asistencia");
	    	 }
		   }
		  
	 	});	
};
//////////////////////////////////////////
</script>
</body>
</html>