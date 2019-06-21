<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Util.Conexion"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="Imagenes/insignia2026.png" type="image/png">
 <title>Sistema Educativo 2026</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/index.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
</head>
<body>

  <%String idUsername = (String) session.getAttribute("idUsername"); %>
  <%Integer perfil = (Integer) session.getAttribute("perfil"); %>
  <%String dni = (String) session.getAttribute("dni"); %>
  
<!-- CABECERA -->
<header id="header" class="header">
   
   <%if(perfil == 1) { %>
   <div class="container">
    	<h1 class="encabezado"><strong>Bienvenido al Sistema Educativo 2026</strong></h1>
    	<h2 class="cuerpo"><strong>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong>, al sistema de optimización del trabajo Docente</strong></h2>
    	<br>
    	<h3><strong><a href="#modulos">Empezar</a></strong></h3>
   </div>
   <%} %>
   
   <%if(perfil == 2) { %>
   <div class="container">
    	<h1 class="encabezado"><strong>Bienvenido al Sistema Educativo 2026</strong></h1>
    	<h2 class="cuerpo"><strong>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong>, al sistema de optimización del trabajo Docente</strong></h2>
    	<br><br>
    	<h3><strong><a href="#modulos">Empezar</a></strong></h3>
   </div>
   <%} %>
   
   <%if(perfil == 3) {  %>
    <div class="container">
    	<h1 class="encabezado"><strong>Bienvenido al Sistema Educativo 2026</strong></h1>
    	<h2 class="cuerpo"><strong>Bienvenido ${sessionScope.profile} <strong>${sessionScope.username}</strong>, al sistema de seguimiento al Alumno</strong></h2>
    	<br><br>
    	<h3><strong><a href="#modulos">Empezar</a></strong></h3>
   	</div>
   <%} %>
</header>
<br>

<!-- INSIGNIA -->
<!-- DIRECTORA -->
<%if(perfil == 1) { %>
<div class="container-fluid" id="modulos">
	<div class="col-md-4">
		<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
	</div>
	<div class="col-md-4">
	</div>
	<div class="col-md-4">
		<a href="<%=request.getContextPath()%>/login.jsp" style="float: right; text-decoration: none; color: Black;"><img src="https://img.icons8.com/metro/26/000000/administrator-male.png"><strong>Cerrar Sesión</strong></a>
	</div>
</div>
<%} %>

<!-- INSIGNIA -->
<!-- DOCENTES -->
<%if(perfil == 2) { %>
<div class="container-fluid">
  	<div class="col-md-4">
		<img src="Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
	</div>
	<div class="col-md-4">
	</div>
	<div class="col-md-4">
		<a href="<%=request.getContextPath()%>/login.jsp" style="float: right; text-decoration: none; color: Black;"><img src="https://img.icons8.com/metro/26/000000/administrator-male.png"><strong>Cerrar Sesión</strong></a>
	</div>
</div>
<%} %>


<!-- CUERPO -->
<!-- DIRECTORA -->
<%if(perfil == 1) { %>
<!-- CUERPO DE LA PAGINA: PRIMER MENU DE OPCIONES -->
<div class="container-fluid">
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/Directora/registrarDocente.jsp"><img src="Imagenes/mantenimientodocente.jpg" id="img1"></a></center>
    	<h2><strong>Mantenimientos Docentes</strong></h2>
	</div>
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/Directora/registrarPadre.jsp"><img src="Imagenes/padrereg.jpg"  id="img1"></center>
    	<h2><strong>Mantenimiento Padre/Tutor</strong></h2>
	</div>
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/Directora/registrarAlumno.jsp"><img src="Imagenes/seguridad.jpg"  id="img1"></center>
    	<h2><strong>Mantenimiento de Alumnos</strong></h2>
	</div>
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/Directora/reportePadres/reporteModuloPadres.jsp"><img src="Imagenes/atencion.jpg" id="img1"></a></center>
    	<h2><strong>Control de Atención al Padre</strong></h2>
	</div>
</div><br>

<div class="container-fluid">
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/ConsultasMonitoreo/consultaMonitoreo.jsp"><img src="Imagenes/reforzamiento.jpg"  id="img1"></a></center>
    	<h2><strong>Control de Reforzamiento Académico</strong></h2>
	</div>
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/ConsultasMonitoreo/monitoreoColegiado.jsp"><img src="Imagenes/colegiado.jpg"  id="img1"></a></center>
    	<h2><strong>Control de Trabajo Colegiado</strong></h2>
	</div>
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/Reportes/reporteAcademico.jsp"><img src="Imagenes/registroCalificaciones.jpg"  id="img1"></a></center>
    	<h2><strong>Reporte Académico</strong></h2>
	</div>
	<div class="col-md-3 atencion">
	</div>
</div>
<% } %>


<!-- DOCENTE -->
<%if(perfil == 2) { %>
<div class="container-fluid"  id="modulos">
   <div class="col-md-4 atencion">
    <center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/atencionpadre.jsp"><img src="Imagenes/atencion.jpg" id="img1"></a></center>
    <h2><strong>ATENCION PADRE DE FAMILIA</strong></h2>
   </div>
   <div class="col-md-4 atencion">
    <center><a href="<%=request.getContextPath()%>/ModuloReforzamientoAcademico/reforzamientoAcademico.jsp"><img src="Imagenes/reforzamiento.jpg"  id="img1"></a></center>
    <h2><strong>REFORZAMIENTO ACADEMICO</strong></h2>
   </div> 
   <div class="col-md-4 atencion">
    <center><a href="<%=request.getContextPath()%>/ModuloTrabajoColegiado/trabajoColegiado.jsp"><img src="Imagenes/colegiado.jpg"  id="img1"></a></center>
    <h2><strong>TRABAJO COLEGIADO</strong></h2>
   </div>
</div>

<div class="container-fluid">
   <div class="col-md-4 atencion">
    <center><a href="<%=request.getContextPath()%>/ModuloRegistroNotas/registroNotas.jsp"><img src="Imagenes/registroCalificaciones.jpg" id="img1"></a></center>
    <h2><strong>REGISTRO/REPORTES DE NOTAS</strong></h2>
   </div>
</div>
<%} %>

<!-- PANTALLA PADRE!!! -->
<%if(perfil == 3){ %>
  <!-- Barra de Menu para Padres -->
  <div class="container-row">
   
   <div class="col-md-3">
		<a href="<%=request.getContextPath()%>/login.jsp" style="text-decoration: none; color: Black;"><img src="https://img.icons8.com/metro/26/000000/administrator-male.png"><strong>Cerrar Sesión</strong></a>
   </div>
   
   <div class="col-md-8">
     <h3><strong>Elija el nombre del alumno que desee buscar informacion: </strong></h3>
     <br>
     <%Conexion con = new Conexion(); 
      ResultSet rs = con.executeQuery("select a.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat from padres p inner join alumnos a where p.codPadre = a.idPadre and p.dni_Padre ='" + dni + "'"); %>
     <div class="select" id="verAlumno">
     <form id ="form1" action="<%=request.getContextPath()%>/ServletFicha" method="post">
      <table id="myTable" class="table" style="width: 900px;">
             <thead style="background-color: #246355;  border-bottom: solid 5px #0F362D; color: white;">
					<tr>
						<th style="text-align:center"></th>
						<th style="text-align:center">IDALUMNO</th>
						<th style="text-align:center">NOMBRE</th>
						<th style="text-align:center">APELLIDO PATERNO</th>
						<th style="text-align:center">APELLIDO MATERNO</th>
						<th></th>
    
					</tr>
			</thead>
			<%while(rs.next()){%> 
			<tbody id="tbl">
				<tr>
				 <td style="text-align:center"><img src="https://img.icons8.com/metro/26/000000/administrator-male.png"></td>
				 <td style="text-align:center; font-size: 20px;"><%=rs.getString(1)%></td>
				 <td id="nombre" style="text-align:center; font-size: 20px;"><%=rs.getString(2)%></td>
				 <td id="apellidoPat" style="text-align:center; font-size: 20px;"><%=rs.getString(3)%></td>
				 <td id="apellidoMat" style="text-align:center; font-size: 20px;"><%=rs.getString(4)%></td>
				 <td style="text-align:center"><button id="btnVer"  type="submit" class="btn btn-primary">Ver Alumno</button></td>
				</tr>				       
			</tbody>
			<%}%>
	  </table>
	  <input type="hidden" id="txtcod" name="txtcod" value="" >
	 </form>
     </div>
     <br>
    </div>
  </div>
<%} %>
<br><br><br><br>


<%if(perfil == 1) { %>
<!-- FOOTER DIRECTORA-->
  <footer class="text-center footer-style">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 footer-col">
                <h3>Dirección</h3>
                <p>
                    Urb. San Diego de Alcala- San Martín de Porres <br />
                    Av.San Diego de Alcala  2120
                </p>
            </div>
            <div class="col-md-4 footer-col">
                <h3>Mis redes</h3>
                <ul class="list-inline">
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/facebook.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/youtube.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/googleplus.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/linkedi.png" width="40" height="40"></a>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 footer-col">
                <h3>Programadores</h3>
                <p>Fernando Saldaña Huaman</p><br>
                <p>Juan Antonio Gabino Huaringa</p>
            </div>
        </div>
    </div>
   </footer>
<%} %>


<!-- FOOTER DOCENTE -->
<%if(perfil == 2) { %>
<!-- FOOTER -->
  <footer class="text-center footer-style">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 footer-col">
                <h3>Dirección</h3>
                <p>
                    Urb. San Diego de Alcala- San Martín de Porres <br />
                    Av.San Diego de Alcala  2120
                </p>
            </div>
            <div class="col-md-4 footer-col">
                <h3>Mis redes</h3>
                <ul class="list-inline">
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/facebook.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/youtube.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/googleplus.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="Imagenes/linkedi.png" width="40" height="40"></a>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 footer-col">
                <h3>Programadores</h3>
                <p>Fernando Saldaña Huaman</p><br>
                <p>Juan Antonio Gabino Huaringa</p>
            </div>
        </div>
    </div>
   </footer>
<%} %>
<script>
$('#verAlumno').on('click', '#btnVer', function(){
	
	var nombre = $(this).closest('tr').find("td").filter(":eq(2)").text();
	document.getElementById("txtcod").value = nombre;
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	  $('a[href^="#"]').click(function() {
	    var destino = $(this.hash); //this.hash lee el atributo href de este
	    $('html, body').animate({ scrollTop: destino.offset().top }, 700); //Llega a su destino con el tiempo deseado
	    return false;
	  });
	});
</script>
</body>
</html>