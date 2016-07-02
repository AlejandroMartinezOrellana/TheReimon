<div id='cssmenu'>
    <ul>
        <?php
        include('menu.php');
        ?>
        <img src="images/logo.png" alt=""/>
        <li class='has-sub'><a href='form/agregar.php'>agregar</a>
        <li class='has-sub'><a href='form/eliminar.php'>eliminar</a>
        <li class='has-sub'><a href='form/modificar.php'>modificar</a>
            <div id="titlogout">
                <?php
                echo $nombre->getNombre();
                ?>
                <a href="login.php">Salir</a>
        </li>  
    </ul>
</div>
            