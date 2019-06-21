<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <link rel="icon" href="../Imagenes/insignia2026.png" type="image/png">
 <title>Atencion Padres de Familia</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/cabeceraAtenciónPadre.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/footer.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
 
 
</head>
<body>

<!-- CABECERA -->
<header id="header" class="header">
   <div class="container">
    	<h1 class="encabezado"><strong>Módulo de Atención al </strong></h1>
    	<h1 class="cuerpo"><strong>Padres de Familia</strong></h1>
    	<br><br>
    	<h3><strong><a href="#modulos">Empezar</a></strong></h3>
   </div>
</header>
<br><br>

<!-- INSIGNIA -->
<div class="container-fluid">
  		<img src="../Imagenes/2026.jpg" id="logo" width="60" height="60">
  		<br>
  		<h3 style="margin-top:10px;"><strong>COLEGIO SAN DIEGO 2026</strong></h3>
</div><br>


<!-- CUERPO DE LA PAGINA: PRIMER MENU DE OPCIONES -->
<div id="modulos" class="container-fluid">
	<div class="col-md-3 atencion">
		<center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/seccionComunicado.jsp"><img src="../Imagenes/moduloatencion1.jpg"  id="img1"></a></center>
		<h2><strong>Generar Comunicados</strong></h2>
	</div>
	<div class="col-md-3 atencion">
    	<center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/seccionComentario.jsp"><img src="../Imagenes/moduloatencion2.jpg" id="img1"></a></center>
    	<h2><strong>Generar Observaciones</strong></h2>
   	</div> 
   	<div class="col-md-3 atencion">
    	<center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/comentarioObservaciones.jsp"><img src="../Imagenes/moduloatencion3.jpg"  id="img1"></a></center>
    	<h2><strong>Lista de Comunicados</strong></h2>
   	</div>
    <div class="col-md-3 atencion">
    	<center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/listaObservaciones.jsp"><img src="../Imagenes/sesionesaprendizaje.jpg"  id="img1"></a></center>
    	<h2><strong>Lista de Observaciones</strong></h2>
   	</div>
</div><br>

<!-- SEGUNDO MENU DE OPCIONES -->
<div class="container-fluid">
	<div class="col-md-3 atencion">
    	<center><a href="<%=request.getContextPath()%>/ModuloAtencionPadre/registroAsistenciaPadres.jsp"><img src="../Imagenes/moduloatencion4.jpg"  id="img1"></a></center>
    	<h2><strong>Registro de Asistencia a Padres de Familia</strong></h2>
   	</div>
</div>

<!-- FOOTER -->
<br><br><br><br>
<div class="container-row">
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
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="../Imagenes/facebook.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="../Imagenes/youtube.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="../Imagenes/googleplus.png"  width="40" height="40"></a>
                    </li>
                    <li>
                        <a  target="_blank" href="#" class="btn-social btn-outline"><img src="../Imagenes/linkedi.png" width="40" height="40"></a>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 footer-col">
                <h3>Programadores</h3>
                <h4>Fernando Saldaña Huaman</h4>
                <h4>Juan Antonio Gabino Huaringa</h4>
            </div>
        </div>
    </div>
</footer>
</div>


<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>
<!-- SCRIPT -->
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