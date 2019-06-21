<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="Imagenes/insignia2026.png" type="image/png">
 <title>Ficha Alumno - IE 2026</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/encabezado.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
 
</head>
<body style="background-color: #ECF0F1;">
  
  <%String idUsername = (String) session.getAttribute("idUsername"); %>
  <%Integer perfil = (Integer) session.getAttribute("perfil"); %>


  <br>
<div id="modulos" class="container-row">  
  <div class="container-row">
  		<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
  </div>
  <br><br><br>
  <!-- DOCENTE -->
  <%if(perfil == 2) { %>
  <div class="container-row">
   <div class="col-md-6" id="atencion">
    <center><img src="Imagenes/atencion.jpg"  height="300" width="500" id="img1"></center>
    <h2><strong>ATENCION PADRE DE FAMILIA</strong></h2>
   </div>
   <div class="col-md-6">
    <center><img src="Imagenes/reforzamiento.jpg"  height="300" width="500" id="img1"></center>
    <h2><strong>REFORZAMIENTO ACADEMICO</strong></h2>
   </div> 
  </div>
  <div class="container-row">
   <div class="col-md-6" id="atencion">
    <center><img src="Imagenes/trabajocolegiado.jpg"  height="300" width="500" id="img1"></center>
    <h2><strong>TRABAJO COLEGIADO</strong></h2>
   </div>
   <div class="col-md-6">
    <center><img src="Imagenes/registronotas.png"  height="300" width="500" id="img1"></center>
   </div>
  </div>
  <%} %>
  <br>
  <br>
  <br>
  <%if(perfil == 3){ %>
  <!-- Barra de Menu para Padres -->
  <div class="container-row">
   <div class="col-md-4">
    <section id="menu">
   
     <ul>
      <a href="comunicadoAlumno.jsp"><img src="Imagenes/registro.ico" height="40" width="50"><strong>Comunicados</strong></a>
      <a href="#"><img src="Imagenes/observar.ico" height="40" width="50"><strong>Observaciones</strong></a>
      <a href="#"><img src="Imagenes/notas.ico" height="40" width="50"><strong>Notas</strong></a>
      <a href="#"><img src="Imagenes/calendario.ico" height="40" width="50"><strong>Calendario</strong></a>
     </ul>
  
    </section>
   </div>
   <div class="col-md-8">
    <div class="panel panel-default" style="width: 800px;">
     <div class="panel-heading" style="background-color: #213758;">
      <i class="fa fa-external-link-square"></i>
	  <h4 style="color: white;"><strong>Datos Personales</strong></h4>
     </div>
     <div class="panel-body">
      <div class="row" style="margin-bottom: 30px;">
       <div class="col-md-6">
        <label>Codigo: </label>
        <input type="text" id="txtcodigo" class="form-control" value="<%out.print(request.getAttribute("idAlumno")); %>" name="txtcodigo" disabled>
       </div>
       <div class="col-md-6">
        <p>FOTO</p>
       </div>
      </div>
      <div class="row" style="margin-bottom: 30px;">
       <div class="col-md-6">
        <label>Nombre: </label>
        <input type="text" id="txtnombre" class="form-control" value="<%out.print(request.getAttribute("nombres")); %>" name="txtnombre" disabled>
       </div>
       <div class="col-md-6">
        <label>Apellido Paterno: </label>
        <input type="text" id="txtapepat" class="form-control" value="<%out.print(request.getAttribute("apellidopat")); %>"name="txtapepat" disabled>
       </div>
      </div>
      <div class="row" style="margin-bottom: 30px;">
       <div class="col-md-6">
        <label>Apellido Materno: </label>
        <input type="text" id="txtapemat" class="form-control" value="<%out.print(request.getAttribute("apellidoMat")); %>" name="txtapemat" disabled >
       </div>
       <div class="col-md-6">
        <label>Fecha de Nacimiento: </label>
        <input type="text" id="txtfecha" class="form-control" value="<%out.print(request.getAttribute("fechaNac")); %>" name="txtfecha" disabled>
       </div>
      </div>
      <div class="row" style="margin-bottom: 30px;">
       <div class="col-md-6">
        <label>Nivel del Progreso: </label>
        <input type="text" id="txtgrado" class="form-control" value="<%out.print(request.getAttribute("grado")); %>" name="txtgrado" disabled>
       </div>
       <div class="col-md-6">
        <label>Sección: </label>
        <input type="text" id="txtseccion" class="form-control" value="<%out.print(request.getAttribute("seccion")); %>" name="txtseccion" disabled >
       </div>
      </div>
      
     </div>
    </div>
   </div>
  </div>
  <%} %>

</div> 
  <input type="hidden" id="txtcod" name="txtcod" value="<% out.println(session.getAttribute("idUsername")); %>">
</body>
</html>