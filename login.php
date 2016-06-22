<?php
include 'librerias.php';

$usr=new Usuario("",$_POST['username'], $_POST['password']);

session_start();
if($usr->VerificaAcceso()){
	$_SESSION["oUsuario"]=$usr;
}
?>
<script>
	document.location.href="index.php";
</script>