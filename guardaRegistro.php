<?php
require 'lib/db_funciones.php';
$conn=  dbconnect();
$nombre ='';
$apellido='';
$rut='';
$email='';
$password='';
$direccion='';
$nombre =$_POST['nombre'];
$apellido=$_POST['apellido'];
$rut=$_POST['rut'];
$email=$_POST['email'];
$password=$_POST['password'];
$direccion=$_POST['direccion'];
$ciudad=$_POST['ciudad'];
$tarjeta=$_POST['tarjeta'];
//if(isset($_POST['num_tarjeta'])){$num_tarjeta=$_POST['num_tarjeta'];}
// else {$num_tarjeta='';}
//$ciudad =$_POST['ciudad'];
$query = "INSERT INTO `cliente`(`rut_cliente`"
        . ", `apellido_cliente`,"
        . " `nom_cliente`,"
        . " `mail_cliente`,"
        . " `direccion_cliente`,"
        . " `clave_cliente`,"
        . " `num_tarjeta`,"
        . " `ciudad`) "
        . "VALUES "
        . "('$rut',"
        . "'$apellido',"
        . "'$nombre',"
        . "'$email',"
        . "'$direccion',"
        . "'$hash',"
        . "'$tarjeta',"
        . "'$ciudad')";
echo ':'.$query;
$rsRegistro=$conn->query($query);
if(!$rsRegistro )
   
    
{
    echo "error al insertar datos";
}
echo "<script> location.href='home.php'</script>";