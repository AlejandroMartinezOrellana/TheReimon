<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/style.css">
   <script src="js/jquery-latest.min.js" type="text/javascript"></script>
   <title>The Reimons Cars</title>
</head>
<body>
<?php 
include('menu.php');
?>
<div class="group">
  
  <h2><em>Formulario de Registro</em></h2>  
     
  <form action="guardaRegistro.php" method="post">
        <label for="Nombre">Nombre <span></span></label><div></div>
      <input type="text" name="Nombre" class="form-input" required/><br>
      <label for="Apellido">Apellido <span></span></label><div></div>
      <input type="text" name="Apellido" class="form-input" required/><br>
      <label for="Rut_cliente">rut <span></span></label><div></div>
      <input type="text" name="Rut_cliente" id="rut" class="form-input" required/> <br> <img src="" style="float: right"/> </right>
      <label for="E_mail">Email <span></span></label><div></div>
      <input type="email" name="E_mail" class="form-input" /><br>
      <label for="Clave_cliente">password <span></span></label><div></div>
      <input type="password" name="Clave_cliente" class="form-input" required/><br>
      <label for="Ciudad">ciudad <span></span></label><div></div>
      <input type="text" name="Ciudad" class="form-input" required/><br>
      <label for="Direccion">direccion <span></span></label><div></div>
      <input type="text" name="Direccion" class="form-input" required/><br>
      <label for="Telefono">Telefono <span></span></label><div></div>
      <input type="text" name="Telefono" class="form-input" required/><br>
      <label for="Fecha_Nacimiento">Fecha Nacimiento <span></span></label><div></div>
      <input type="date" name="Fecha_Nacimiento" class="form-input" required/><br>
      <br>
      <br>
      <right> <input class="form-btn" name="registrarse" type="submit" value="registrarse"/></right>
  </form>
    
  
</div>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div id="footer"> the reimon </div>