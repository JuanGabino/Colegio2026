<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8">
 <link rel="icon" href="Imagenes/insignia2026.png" type="image/png">
 <title>Sistema Educativo 2026</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>

 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/login.css">
 <script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery.validate.js"></script>
 
</head>
<body>

<div class="container-fluid" >

  <div class="container-row"> 
  <div class="col-md-4">
  </div>
  
  <div class="col-md-4" id="contenedor">
  <!-- LOGO -->
  <img id="logo" src="Imagenes/insignia2026.png" >
  <br>
  <!-- FORMULARIO DE INGRESO -->
  <form id ="form1" action="<%=request.getContextPath()%>/ServletLogin" method="post">
  
   <!-- USUARIO -->  
   <div class="input-group">
    <img src="https://img.icons8.com/metro/26/000000/administrator-male.png">
    <input type="text"  class="form-control" placeholder="Usuario" size="60" name="usuario">
   </div>
   <br>
   
   <!-- CONTRASEÑA -->
   <div class="input-group">   
    <img src="https://img.icons8.com/metro/26/000000/password.png">
    <input type="password" class="form-control" placeholder="Password" size="60" name="contrasena">
   </div><br>
   
   <!-- MENSAJE DE ERROR-->
   <div class="row">
	<center><strong style="color:red;">${message}</strong></center>
   </div><br>
   
   <!-- BOTONES -->
   <div class="row">
        <div class="col-md-6">
            <button type="submit" class="btn btn-primary btn-block btn-flat" style="font-weight: bolder;" id="btnIngresar" name="btnIngresar">INGRESAR</button><br>
        </div>
        <div class="col-md-6">
          <a href="cambioContrasena.jsp" style="text-decoration: none;"><button type="button" class="btn btn-primary btn-block btn-flat" style="font-weight: bolder;">CAMBIAR PASSWORD</button></a>
        </div>
    </div>
    
  </form>
  </div>
  </div> 
  
</div>

<script type="text/javascript">
$(document).ready(function (){
	$("#form1").validate({
		  rules: {
			  usuario: {required:true},
			  contrasena: {required:true},
		  },
		  messages: {
			  usuario: { required:"Ingresar su usuario"},
			  contrasena: { required:"Ingresar su contraseña"}
		  }
	});
});
</script>
</body>
</html>