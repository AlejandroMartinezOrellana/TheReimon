<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/style.css">
   <script src="js/jquery-latest.min.js" type="text/javascript"></script>
   <title>Sweet Dreams</title>
</head>
<body>
<?php 
include('menu.php');

?>
    <br>
    <br>
    <br>
    <br>
<left>
    <h2><em> Contactanos </em></h2> 
    <form id="contact_form" action="home.php" method="POST" enctype="multipart/form-data">
	<div class="row">
		<label for="name">Tu nombre:</label><br />
		<input id="name" class="input" name="name" type="text" value="" size="30" /><br />
	</div>
	<div class="row">
		<label for="email">Tu email:</label><br />
                <input id="email" class="input" name="email" type="text" value="" size="30" /><br /> <img  style="float: right"/> </right>
	</div>
	<div class="row">
		<label for="message">Tu mensaje:</label><br />
		<textarea id="message" class="input" name="message" rows="7" cols="100"></textarea><br />
	</div>
    <br>
    <br>
    <input id="submit_button" type="submit" value="Enviar email"</input>
    
    </form>
</left>
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
<br>
<br>

<div id="footer"> diseñado por Mulge </div>
