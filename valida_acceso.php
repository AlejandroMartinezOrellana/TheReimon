<?php
include('librerias.php');

/*
 * Verificacion del usuario y clave
* */
session_start();
if (!isset($_SESSION["oUsuario"])){
?>
<!-- Reenvio pagina principal-->
<script>
	document.location.href="index.php";
</script>
<?php 
}
?>