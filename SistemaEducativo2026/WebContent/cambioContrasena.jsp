<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="Imagenes/insignia2026.png" type="image/png">
	<title>Cambio de Contraseña</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/font-awesome.min.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/fontawesome/fonticons.css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/login.css">
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-1.11.2.min.js"></script>
 	<script src="<%=request.getContextPath()%>/Requerimientos/Jquery/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.css">
</head>
<body>

<div class="container-fluid" >

  <div class="container-row"> 
  <div class="col-md-4">
  </div>
  
  <div class="col-md-4" id="contenedor">
  <!-- LOGO -->
  <img id="logo" src="Imagenes/insignia2026.png" >
  
  <!-- FORMULARIO DE INGRESO -->
  <form id ="form1" action="" method="post">
  
   <!-- CONTRASEÑA ANTIGUA -->  
   <div class="input-group">
    <img src="https://img.icons8.com/metro/26/000000/administrator-male.png">
    <input type="password"  class="form-control" placeholder="Ingrese Contraseña Antigua" size="60" id="txtantigua" name="txtantigua">
   </div>
   <br>
   
   <!-- CONTRASEÑA NUEVA-->
   <div class="input-group">   
    <img src="https://img.icons8.com/metro/26/000000/password.png">
    <input type="password" class="form-control" placeholder="Ingrese Contraseña Nueva" size="60" id="txtnueva" name="txtnueva">
   </div><br>
   
   <!-- CONTRASEÑA NUEVA CONFIRMACION-->
   <div class="input-group">   
    <img src="https://img.icons8.com/metro/26/000000/password.png">
    <input type="password" class="form-control" placeholder="Ingrese Contraseña Nueva" size="60" id="txtnueva2" name="txtnueva2">
   </div><br><br>
   
   
   <!-- BOTONES -->
   <div class="row">
        <div class="col-md-6">
            <button type="button" class="btn btn-primary btn-block btn-flat" style="font-weight: bolder;" id="btnCambiar" name="btnCambiar">CAMBIAR</button><br>
        </div>
        <div class="col-md-6">
          <button type="button" class="btn btn-primary btn-block btn-flat" style="font-weight: bolder;" id="btnVolver" name="btnVolver">VOLVER</button>
        </div>
    </div>
    
  </form>
  </div>
  </div> 
</div>

<!-- SCRIPT -->
<script src="<%=request.getContextPath()%>/Requerimientos/bootstrap/bootstrap.min.js"></script>

<!-- SCRIPT -->
<script type="text/javascript">
$('#btnVolver').on('click', function(){
	
	window.location.href ="login.jsp";
});
////////////////////////////////////
$('#btnCambiar').on('click', function(){
	
  var antigua = $('#txtantigua').val();
  var nueva1  = $('#txtnueva').val(); 
  var nueva2  = $('#txtnueva2').val();
  var vacio   = "";
	
  if(nueva1 == vacio || nueva2 == vacio || antigua == vacio)
  {
	  alert("Datos Vacios. Campos Obligatorios");
  }
  else
  {
	
	if(nueva1 == nueva2)
	{
		$.ajax({
			type: 'POST',
			url: '<%=request.getContextPath()%>/CambiarContrasena',
			data: {
			
				contrasena: antigua,
				nueva: nueva1
			},
			success: function(data)
			{
				if (data != 0)
				{
					alert("Se cambio la contraseña");
					document.getElementById("txtantigua").value = "";
					document.getElementById("txtnueva").value = "";
					document.getElementById("txtnueva2").value = "";
				}
				else if(data == 0)
				{
					alert("La contrase antigua no es correcta");
				
				}	
			}
		});
	}
	else
	{
		alert("Las contraseñas nuevas no coinciden");
		document.getElementById("txtantigua").value = "";
		document.getElementById("txtnueva").value = "";
		document.getElementById("txtnueva2").value = "";
	}
  }
});
</script>
</body>
</html>