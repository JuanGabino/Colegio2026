<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Registro de Notas</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/nav.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
  
 <script type="text/javascript">

  $(document).ready(function(){
	  $("#texto").hide();
	  $("#notasTareas").hide();
	  $("#notasExamenes").hide();
  });
  //////////////////////////////////

	$(document).ready(function(){
		 $("#cambia").click(function(){
 				$("#texto").toggle(1000);
 			});
		 $("#tareas").click(function(){
				$("#notasTareas").toggle(1000);
			});
		 $("#examenes").click(function(){
				$("#notasExamenes").toggle(1000);
			});
	});
</script>
 
</head>
<body style="background-color: #ECF0F1;">
  
<!-- CABECERA -->
<header>
	<input type="checkbox" id="btn-menu">
	<label for="btn-menu"><img src="../Imagenes/insignia2026.png" id="imglogo"></label>
	<nav class="menu">
		<ul>
			<li><a href="../index.jsp"><img src="../Imagenes/insignia2026.png" width="30" height="30">&nbsp;&nbsp;<strong>Inicio</strong></a></li>
			<li><a href="asignaturasDocente.jsp"><img src="../Imagenes/registro.ico" height="40" width="50"><strong>Registro de Notas</strong></a></li>
			<li><a href="reportesCursos.jsp" ><img src="../Imagenes/report.png" height="40" width="50"><strong>Reporte Bimestral</strong></a></li>
			<li><a href="reportesAlumnos.jsp" ><img src="../Imagenes/reportAlumno.png" height="40" width="50"><strong>Reportes Por Alumno</strong></a></li>
			<li></li>
		</ul>
	</nav>
</header> 
<br><br><br><br>

<%
   String curso = request.getParameter("txtcurso");
   String idcurso = request.getParameter("txtIdCurso");
   int    num = 1;

%>  
  
<div id="modulos" class="container-row">  
   <div class="col-md-1">
   </div>
   
   <div class="col-md-10">
   
        <!-- PANEL -->
    	<div class="panel panel-default">
    
    		<!-- PANEL CABECERA -->
     		<div class="panel-heading" style="background-color: #3E7BC0;">
	  			<h4 style="color: white;"><strong><img src="../Imagenes/lista.png" height="40" width="50">LISTA DE ALUMNOS</strong></h4>
   	 		</div>
   	 
   	  		<!-- PANEL CUERPO -->
   	 		<div class="panel-body">
   	   			<div class="row">
   	   				<div class="col-md-3">
       				   <h4><strong>Curso:</strong></h4> 
	   	 			   <input type="text" id="txtcurso" class="form-control" value="<%out.print(curso); %>"name="txtcurso" disabled>
	   	 			   <input type="hidden" id="txtIdcurso" class="form-control" value="<%out.print(idcurso); %>"name="txtIdcurso" disabled>
	   	 		 	</div>
	   	 		 	<div class="col-md-3">
           				<h4><strong>Seccion:</strong></h4>
           				<select class="form-control selectSeccion" id="selectSeccion">
		   					<option value="" selected disabled hidden>--Seleccionar--</option>
	       				</select><br>
	       				<input type="hidden" id="txtdni" name="txtdni" value="<% out.println(session.getAttribute("dni"));  %>" >
	     			</div>
	     			<div class="col-md-3">
       			 		<h4><strong>Periodo: </strong></h4>
	   	 		 		<select class="form-control selectPeriodo" id="selectPeriodo">
	   	 		 			<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 		</select>
       			 	</div>
       			 	<div class="col-md-3">
       			 		<h4><strong>Año: </strong></h4>
	   	 		 		<select class="form-control selectAnio" id="selectAnio">
	   	 		 	 		<option value="" selected disabled hidden>--Seleccionar--</option>
	   	 		 		</select>
       			 	</div>
       			</div>
       			<br>
       			<div class="row">
       				<div class="col-md-4" id="divBuscarAlumnos">
	      				<button type="button" class="btn btn-primary form-control" id="btnBuscar"> Buscar Notas</button>
	   	 			</div>
	   	 			<div class="col-md-4">
	   	 				<button type="button" class="btn btn-success form-control" id="btnExcel" disabled> Exportar a EXCEL </button>
	   	 			</div>
	   	 			<div class="col-md-4">
	   	 				<button type="button" class="btn btn-warning form-control" id="btnPDF" disabled> Exportar a PDF </button>
	   	 			</div>
       			</div>
       			<br><br>
       			
       			<!-- INICIO DE TABLA -->
                <div class="row table-responsive">
        			<div class="col-md-10" id="divTableAlumno" style="width: auto; margin: 0 auto;">
           				<table id="Table" class="table">
            				<thead style="background-color: #213758;  border-bottom: solid 5px #0F362D; color: white;">
             					<tr>
				              		<th><center>IDAlumno</center></th>
              				  		<th><center>Nombre</center></th>
              						<th><center>Apellido Paterno</center></th>
              						<th><center>Apellido Materno</center></th>
              						<th><center>Practica 1</center></th>
              						<th><center>Practica 2</center></th>
              						<th><center>Practica 3</center></th>
              						<th><center>PROMEDIO PRACTICA</center></th>
              						<th><center>TAREA 1</center></th>
              						<th><center>TAREA 2</center></th>
              						<th><center>TAREA 3</center></th>
              						<th><center>PROMEDIO TAREA</center></th>
              						<th><center>EXAMEN 1</center></th>
              						<th><center>EXAMEN 2</center></th>
              						<th><center>PROMEDIO FINAL</center></th>
              						<th></th>
             					</tr>
            				</thead>
            
	            			<tbody id="tbl_alumno"> 
             
            				</tbody>
           		    	</table>

              	 	</div>
              	</div>

  			</div>
		</div>
    </div>
</div>


				   <!-- MODAL REGISTRO DE NOTAS-->
				   <div id="myModal" class="modal fade" role="dialog">
 					 <div class="modal-dialog">

   					<!-- MODAL CUERPO -->
    					<div class="modal-content">
      						<div class="modal-header" style="background-color: #213758;">
        						<button type="button" class="close" data-dismiss="modal" >&times;</button>
        						<h4 class="modal-title" style="color: white;"><strong>INGRESAR / MODIFICAR NOTAS</strong></h4>
      						</div>
      						<div class="modal-body"  id="exportContent">
        					
      								<div class="row">
      			 						<div class="col-md-4">
        									<h5><strong>CODIGO ALUMNO</strong></h5>
        									<input type="text"  class="form-control" name="idAlumno" id="idAlumno" disabled>
       									</div>
       									<div class="col-md-4">
        									<h5><strong>CODIGO DOCENTE</strong></h5>
        									<input type="text"  class="form-control" name="docente" id="docente" value="<% out.println(session.getAttribute("dni"));  %>" disabled>
        									<input type="text" id="txtcodDocente" name="txtcodDocente" class="form-control" value="" disabled>
       									</div>
       									<div class="col-md-4">
        									<h5><strong>CURSO</strong></h5>
        									<input type="text"  class="form-control" name="idCurso" id="idCurso" disabled>
       									</div>
      								</div>
      								<br>
      								<br>
      								<div class="row">
      								 <button id="cambia" class="btn btn-primary btn-block">PRACTICAS</button>
      								 <div id="texto" class="container-fluid" >
      								  	<div class="row">
      								  	    <div class="col-md-4">
      								  	    	<label style="text-align: center;">Practica 1</label>	
      								  	    </div>
      								   		<div class="col-md-4">
      								   			<select  class="form-control" id="selectP1" style="width: 130px;	text-align: center;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int p1 = 1;
	      											 		while(p1<21){
	      											 	%>
	      											 	<option><% out.println(p1++); %></option>
	      											 	<%} %>
	      										</select>
	      									</div>
	      									<div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block" id="btn_agregarp1"  name="btn_agregarp1">Agregar</button>
	      									</div>
      								  	</div>
      								  	<br><br> 
      								  	<div class="row">
      								  	    <div class="col-md-4">
      								  	    	<label>Practica 2</label>
      								  	    </div>
      								  		<div class="col-md-4">
      								   			<select  class="form-control" id="selectP2" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int p2 = 1;
	      											 		while(p2<21){
	      											 	%>
	      											 	<option><% out.println(p2++); %></option>
	      											 	<%} %>
	      										</select>
	      								    </div>
	      								    <div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block" id="btn_agregarp2"  name="btn_agregarp2">Agregar</button>
	      									</div>
      								  	</div>
      								  	<br><br>
      								  	<div class="row">
      								  	    <div class="col-md-4">
      								  	    	<label>Practica 3</label>
      								  	    </div>
      								  		<div class="col-md-4">
      								   			<select  class="form-control" id="selectP3" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int p3 = 1;
	      											 		while(p3<21){
	      											 	%>
	      											 	<option><% out.println(p3++); %></option>
	      											 	<%} %>
	      										</select>
	      								    </div>
	      								    <div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block" id="btn_agregarp3"  name="btn_agregarp3">Agregar</button>
	      									</div>
      								  	</div>
      								 </div>
      								</div>
      								<br><br>
      								<div class="row">
      								  <button id="tareas" class="btn btn-primary btn-block">TAREAS</button>
      								  <div id="notasTareas" class="container-fluid" >
      								  	<div class="row">
      								  	 <div class="col-md-4">
      								  	   <label>Tarea 1</label>
      								  	 </div>
      								  	 <div class="col-md-4">
      								  	   		<select  class="form-control" id="selectT1" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int t1 = 1;
	      											 		while(t1<21){
	      											 	%>
	      											 	<option><% out.println(t1++); %></option>
	      											 	<%} %>
	      										</select>
      								  	 </div>
      								  	 <div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block" id="btn_agregart1"  name="btn_agregart1">Agregar</button>
      								  	 </div>
      								  	</div>
      								  	<br><br>
      								  	<div class="row">
      								  	 <div class="col-md-4">
      								  	   <label>Tarea 2</label>
      								  	 </div>
      								  	 <div class="col-md-4">
      								  	   		<select  class="form-control" id="selectT2" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int t2 = 1;
	      											 		while(t2<21){
	      											 	%>
	      											 	<option><% out.println(t2++); %></option>
	      											 	<%} %>
	      										</select>
      								  	 </div>
      								  	 <div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block"  id="btn_agregart2"  name="btn_agregart2">Agregar</button>
      								  	 </div>
      								  	</div>
      								  	<br><br>
      								  	<div class="row">
      								  	 <div class="col-md-4">
      								  	   <label>Tarea 3</label>
      								  	 </div>
      								  	 <div class="col-md-4">
      								  	   		<select  class="form-control" id="selectT3" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int t3 = 1;
	      											 		while(t3<21){
	      											 	%>
	      											 	<option><% out.println(t3++); %></option>
	      											 	<%} %>
	      										</select>
      								  	 </div>
      								  	 <div class="col-md-4">
	      										<button type="button" class="btn btn-success btn-block" id="btn_agregart3"  name="btn_agregart3">Agregar</button>
      								  	 </div>
      								  	</div>
      								  </div>
      								</div>
      								<br><br>
      								<div class="row">
      								  <button id="examenes" class="btn btn-primary btn-block">EXAMENES</button>
      								  <div id="notasExamenes" class="container-fluid">
      								   	<div class="row">
      								   	  <div class="col-md-4">
      								   	  	 	<label>Examen 1</label>
      								   	  </div>
      								   	  <div class="col-md-4">
      								   	  	 	<select  class="form-control" id="selectEX1" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int ex1 = 1;
	      											 		while(ex1<21){
	      											 	%>
	      											 	<option><% out.println(ex1++); %></option>
	      											 	<%} %>
	      										</select>
      								   	  </div>
      								   	  <div class="col-md-4">
      								   	  		<button type="button" class="btn btn-success btn-block" id="btn_agregarex1"  name="btn_agregarex1">Agregar</button>
      								   	  </div>
      								   	</div>
      								   	<br><br>
      								   	<div class="row">
      								   	  <div class="col-md-4">
      								   	  	 	<label>Examen 2</label>
      								   	  </div>
      								   	  <div class="col-md-4">
      								   	  	 	<select  class="form-control" id="selectEX2" name="selectEX2" style="width: 130px;">
	      											 	<option value="" selected disabled hidden>Seleccionar</option>
	      											 	<%
	      											 		int ex2 = 1;
	      											 		while(ex2<21){
	      											 	%>
	      											 	<option><% out.println(ex2++); %></option>
	      											 	<%} %>
	      										</select>
      								   	  </div>
      								   	  <div class="col-md-4">
      								   	  		<button type="button" class="btn btn-success btn-block" id="btn_agregarex2"  name="btn_agregarex2">Agregar</button>
      								   	  </div>
      								   	</div>
      								  </div>
      								 </div> 
      					     </div>
      					     <div class="modal-footer">
        				    	<button type="button" class="btn btn-default" data-dismiss="modal"><strong>Cerrar</strong></button>
     			 			 </div> 
      					</div>
      				</div>
    			   </div>
   
<script type="text/javascript">
/////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarPeriodo',
		success: function(data)
        { 
			$('#selectPeriodo').empty();
        	$('#selectPeriodo').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectPeriodo').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	
	$.ajax({
		
		type: 'POST',
	    url:  '<%=request.getContextPath()%>/ListarAnio',
		success: function(data)
        { 
			$('#selectAnio').empty();
        	$('#selectAnio').append('<option value="'+""+'">--Seleccionar--</option>');
        	var var1=data.split(":");
        	for (var i=0;i<var1.length-1;i++) {
        		var valor=var1[i].split("/")[0];
			    var desc=var1[i].split("/")[1];
				    $('#selectAnio').append('<option value="'+valor+'">'+desc+'</option>');
			}
			
        }
	});	
});
///////////////////////////////////////////////////////////////////
//$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
//	
//	var sec = $('#selectSeccion').val().trim();
//	var vacio = "";
//	$('#Table tbody tr').remove();
//	
//	if(sec == vacio)
//	{
	//	alert("Seleccione una Sección");
	
//	}
//	else {
//		
//	$.ajax({
//       type: 'POST',
//       url: '/SistemaEducativo2026/ListarAlumnoxSeccion',
 //      data : {
//			seccion : sec 
//		},
//        success: function(data)
//        {            	
//        	var array = data.split("$");
			
//			if(data == "_"){
//				alert("No hay registro de Alumnos");
//			}else{
//				for (var i = 0; i < array.length - 1; i++) {
//					var id     = array[i].split("=")[0];
//					var nombre = array[i].split("=")[1];
//					var apellidopat = array[i].split("=")[2];
//					var apellidomat = array[i].split("=")[3];
//	
//					

  				    //$('#tbl_alumno').append("<tr>" +
	  				//  		"<td><center>"+id+"</center></td>" +
	  				 // 		"<td><center>"+nombre+"</center></td>" +
	  				 // 		"<td><center>"+apellidopat+"</center></td>" +
	  				 // 	    "<td><center>"+apellidomat+"</center></td>" +
	  				 // 	    '<td><center></center></td>' +
	  				  //		'<td><center></center></td>' +
	  				  //		'<td><center></center></td>' +
	  				  //		'<td><center></center></td>' +
	  				  //		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				//		'<td><center></center></td>' +
	  				 // 		'<td><center><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnModificar">Modificar</button></center></td>'+
	  				  //		"</tr>");
				//}
			//}
        //}
//	});
//	}	
//});
///////////////////////////////////////////////
$('#divBuscarAlumnos').on('click', '#btnBuscar', function(){
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	var vacio = "";
	$('#Table tbody tr').remove();
	
	if(sec == vacio || cur == vacio || per == vacio || anio == vacio)
	{
		alert("Campos Obligatorios vacios");
		
	}
	else {
		
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/listarAlumnosCalificacionesxSeccion',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio
			
		},
        success: function(data)
        {            	
        	var array = data.split("$");
			
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var nombre = array[i].split("/")[1];
					var apellidopat = array[i].split("/")[2];
					var apellidomat = array[i].split("/")[3];
					var p1 =  array[i].split("/")[4];
					var p2 =  array[i].split("/")[5];
					var p3 =  array[i].split("/")[6];
					var promediop = array[i].split("/")[7];
					var t1 = array[i].split("/")[8];
					var t2 = array[i].split("/")[9];
					var t3 = array[i].split("/")[10];
					var promediota = array[i].split("/")[11];
					var exa1 = array[i].split("/")[12];
					var exa2 = array[i].split("/")[13];
					var fina =  array[i].split("/")[14];
					

  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td style='font-size: 17px;'><center>"+id+"</center></td>" +
	  				  		"<td style='font-size: 17px;'><center>"+nombre+"</center></td>" +
	  				  		"<td style='font-size: 17px;'><center>"+apellidopat+"</center></td>" +
	  				  	    "<td style='font-size: 17px;'><center>"+apellidomat+"</center></td>" +
	  				  	    "<td style='font-size: 21px;'><center>"+p1+"</center></td>" +
	  				  		"<td style='font-size: 21px;'><center>"+p2+"</center></td>" +
	  				  		"<td style='font-size: 21px;'><center>"+p3+"</center></td>" +
	  				  		"<td style='font-size: 21px;'><center>"+promediop+"</center></td>" +
	  				  		"<td style='font-size: 21px;'><center>"+t1+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+t2+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+t3+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+promediota+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+exa1+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+exa2+"</center></td>" +
	  						"<td style='font-size: 21px;'><center>"+fina+"</center></td>" +
	  				  		'<td><center><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnModificar">Modificar</button></center></td>'+
	  				  		"</tr>");
				}
			} 
			
			$('#btnExcel').attr("disabled", false);
			$('#btnPDF').attr("disabled", false);
        }
	});
	}	
	
	
	
});
//////////////////////////////////////////////
function actualizarNotas(){
	
	var sec = $('#selectSeccion').val().trim();
	var cur = $('#txtIdcurso').val().trim();
	var per = $('#selectPeriodo').val().trim();
	var anio = $('#selectAnio').val().trim();
	
	$.ajax({
        type: 'POST',
        url: '<%=request.getContextPath()%>/listarAlumnosCalificacionesxSeccion',
        data : {
        	curso : cur,
			seccion : sec,
			periodo : per,
			anio : anio
			
		},
        success: function(data)
        {            	
        	var array = data.split("$");
        	$('#tbl_alumno').empty();
			if(data == "_"){
				alert("No hay registro de Alumnos");
			}else{
				
				for (var i = 0; i < array.length - 1; i++) {
					var id     = array[i].split("/")[0];
					var nombre = array[i].split("/")[1];
					var apellidopat = array[i].split("/")[2];
					var apellidomat = array[i].split("/")[3];
					var p1 =  array[i].split("/")[4];
					var p2 =  array[i].split("/")[5];
					var p3 =  array[i].split("/")[6];
					var promediop = array[i].split("/")[7];
					var t1 = array[i].split("/")[8];
					var t2 = array[i].split("/")[9];
					var t3 = array[i].split("/")[10];
					var promediota = array[i].split("/")[11];
					var exa1 = array[i].split("/")[12];
					var exa2 = array[i].split("/")[13];
					var fina =  array[i].split("/")[14];
					
 
  				    $('#tbl_alumno').append("<tr>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+id+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+nombre+"</center></td>" +
	  				  		"<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+apellidopat+"</center></td>" +
	  				  	    "<td style='font-size: 15px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+apellidomat+"</center></td>" +
	  				  	    "<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+p1+"</center></td>" +
	  				  		"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+p2+"</center></td>" +
	  				  		"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+p3+"</center></td>" +
	  				  		"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+promediop+"</center></td>" +
	  				  		"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+t1+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+t2+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+t3+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+promediota+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+exa1+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+exa2+"</center></td>" +
	  						"<td style='font-size: 19px; font-family: 'Times New Roman', Georgia, Serif;'><center>"+fina+"</center></td>" +
	  				  		'<td><center><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btnModificar">Modificar</button></center></td>'+
	  				  		"</tr>");
				}
			} 
        }
	})
};
//////////////////////////////////////////////
$('#divTableAlumno').on('click', '#btnModificar', function(){
	
	var id ="";
    id=$(this).closest('tr').find("td").filter(":eq(0)").text();
    document.getElementById("idAlumno").value = id;
    var idcurso = "";
    idcurso = document.getElementById("txtIdcurso").value;
    document.getElementById("idCurso").value = idcurso;
	
	
});
////////////////////////////////////////
$('#btn_agregarp1').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectP1").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionesp1',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			p1          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Actualizacion satisfactoria.");
					actualizarNotas();
					document.getElementById("selectP1").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 });  
 ///////////////////////////////////////////////////////////////
 $('#btn_agregarp2').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectP2").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionesp2',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			p2          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					document.getElementById("selectP2").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 });  
 //////////////////////////////////////////////
 $('#btn_agregarp3').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectP3").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionesp3',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			p3          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					document.getElementById("selectP3").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 });  
 //////////////////////////////////////////////////////////
 $('#btn_agregart1').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectT1").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionest1',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			t1          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					document.getElementById("selectT1").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 });  
 /////////////////////////////////////////////////////////////////////
 $('#btn_agregart2').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectT2").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionest2',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			t2          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					document.getElementById("selectT2").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 });  
 ////////////////////////////////////////////////////////////
  $('#btn_agregart3').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectT3").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionest3',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			t3          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					document.getElementById("selectT3").value = "";
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
	
 }); 
 //////////////////////////////////////////////////
  $('#btn_agregarex1').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectEX1").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionesex1',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			ex1         : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
 		document.getElementById("selectEX1").value="";
 		//$("#selectEX1").empty();
	
 }); 
 ////////////////////////////////////////////////////////
  $('#btn_agregarex2').on('click', function(){ 
	
    	var parametro0= $("#idAlumno").val();
 		var parametro1= $("#selectSeccion").val();
 		var parametro2= $("#idCurso").val();
 		var parametro3= $("#txtcodDocente").val();
 		
 		var parametro4= $("#selectPeriodo").val();
 		var parametro5= $("#selectAnio").val();
 		
 		var parametro6= $("#selectEX2").val();

 		$.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/registrarCalificacionesex2',
            data: { 
            	idAlum		: parametro0,
     			seccion    	: parametro1,
     			docente    	: parametro3,
     			curso      	: parametro2,
     		 	periodo  	: parametro4,	
     			anio      	: parametro5,
     			ex2          : parametro6
            
            },
            success: function(data)
            {
            	if (data == "1"){
            		
					alert("Mensaje: "+"Nota Registrada Satisfactoriamente.");
					actualizarNotas();
					
     			}else {
     				
     				alert("Hubo un error, no se pudo subir notas");
     			}	
            }
 		});   
 		
	
 }); 
 /////////////////////////////////////////////////////////////////
 $('#btnExcel').click(function(){ 
	
	 var periodo 		  = document.getElementById("selectPeriodo");	
	 var periodoid        = periodo.value;
	 var periodoasi	      = periodo.options[periodo.selectedIndex].innerText; 
	 
	 var anio    = document.getElementById("selectAnio");
	 var anioid  = anio.value;
	 var anioasi = anio.options[anio.selectedIndex].innerText;
	 
	 
	 alert("Exportando Notas a Excel a Escritorio")
	 $.ajax({
		type : 'POST',
		url : '<%=request.getContextPath()%>/ReporteNotasExcel',
		data : {
			seccion : $("#selectSeccion").val(),
			curso: 	  $("#txtcurso").val(),
			periodo:  periodoasi,
			anio:     anioasi
		}
	});
});

</script>
</body>
</html>
