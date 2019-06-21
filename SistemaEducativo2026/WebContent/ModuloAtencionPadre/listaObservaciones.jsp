<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Atencion Padre de Familia - Lista de Observaciones</title>
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

<!-- LOGO COLEGIO 
<div class="container-fluid">
	<div class="row">
  		<img src="../Imagenes/insignia2026.png"  width="60" height="60" style="float:left; margin:10px;"><br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  	</div>
</div><br><br>-->


<!-- CUERPO DE PAGINA -->
<div class="container-row">  
   <div class="col-md-2">
   </div>
   
   <div class="col-md-8" >
    	<div class="row">
    		<div class="panel panel-default">
    			<div class="panel-heading" style="background-color: #3E7BC0;">
	  				<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE OBSERVACIONES</strong></h4>
   				</div>
   				<div class="panel-body">
   					<div class="row">
   						<div class="col-md-4">
   							<h4><strong>Seccion:</strong></h4>
         					<select class="form-control selectSeccion2" id="selectSeccion2">
		   						<option value="" selected disabled hidden>--Seleccionar--</option>
	     					</select>
   						</div>
   						<div class="col-md-4" id="divBuscarObservacion">
   							<br><br>
	    					<button type="button" class="btn btn-primary" id="btnBuscarObservacion"> Buscar Observaciones</button>
   						</div>
   						<div class="col-md-4">
   							<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
   							<input type="hidden" id="txtcodDocente" name="txtcodDocente" value="" >
   						</div>
   					</div>
   					<br><br>
   					<div class="table-responsive" id="divTableObservacion">		
   								<input class=form-control id=myInput type=text placeholder=Buscar..>
   								<br>
           						<table id="Table2" class="table">
            						<thead style="background-color: #213758;  color: white;">
             							<tr>
              								<th><center>IDOBSERVACION</center></th>
              								<th><center>DESCRIPCION</center></th>
              								<th><center>ALUMNO</center></th>
              								<th><center>SECCION</center></th>
              								<th><center>CURSO</center></th>
              								<th><center>FECHA</center></th>
              								<th></th>
             							</tr>
            						</thead>
            
            						<tbody id="tbl_alumnoObservaciones"> 
	              
            						</tbody>
           						</table>
      				</div>
   				</div>
    		</div>
    	</div>
   </div>
</div> 
											            
					            
<script type="text/javascript">
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbl_alumnoObservaciones tr").filter(function() {
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
			$('#selectSeccion2').empty();
        	$('#selectSeccion2').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("-")[0];
			    var desc=var1[i].split("-")[1];
				    $('#selectSeccion2').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
////////////////////////////////////////////////////////////////////
$('#divBuscarObservacion').on('click', '#btnBuscarObservacion', function(){
	
	var sec = $('#selectSeccion2').val().trim();
	var dni = $('#txtcodDocente').val().trim();
	
	var vacio = "";
	$('#Table2 tbody tr').remove();
	
	if(sec == vacio)
	{
		alert("Seleccione una Sección");
	
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/BuscarObservacion',
        data : {
        	dni : dni,
			seccion : sec 
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			var vacio = "";
			if(data == vacio){
				alert("No hay registro de Observaciones");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var descripcion = array[i].split("/")[1];
					var nombre = array[i].split("/")[2];
					var apellidoPat = array[i].split("/")[3];
					var apellidoMat = array[i].split("/")[4];
					var seccion = array[i].split("/")[5];
					var curso   = array[i].split("/")[6];
					var fecha = array[i].split("/")[7];
	
					

  				    $('#tbl_alumnoObservaciones').append("<tr>" +
	  				  		"<td><center>"+id+"</center></td>" +
	  				  		"<td><center>"+descripcion+"</center></td>" +
	  				  		"<td><center>"+nombre+ " " + apellidoPat + " " + apellidoMat + "</center></td>" +
	  				  		"<td><center>"+seccion+"</center></td>" +
	  				  		"<td><center>"+curso+"</center></td>" +
	  				  		"<td><center>"+fecha+"</center></td>" +
	  				  		'<td><center><button class="btn btn-danger" id="btnEliminarObservacion" name="btnEliminarObservacion">ELIMINAR</button></center></td>'+
	  				  		"</tr>");
				}
			}
        }
	});
	}	
});
///////////////////////////////////////////////////////////////
$('#divTableObservacion').on('click', '#btnEliminarObservacion', function(){
	
	var idobs = "";
	idobs  = $(this).closest('tr').find("td").filter(":eq(0)").text();

 var answer = confirm("¿Deseas Eliminar esta Observación?")
	 
	 if(answer)
	 {
		 $.ajax({
		        type: 'POST',
		        url: '<%=request.getContextPath()%>/EliminarObservacion',
		        data: {
			        	idobservacion : idobs
			        },
		        success: function(data)
		        {
		        	if (data!=null){
		        		
		        		alert("Se elimino la observación correctamenter");
		        		
					}else {
						
						alert("No se pudo eliminar la observación");
					}	
		        }
			});
			
        
 	 }
	 else {
		 
		 alert("Cancelado!!")
	 }
	
});
/////////////////////////////////////////////////////////////////
</script>
</body>
</html>