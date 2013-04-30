<div data-role="page" class="type-home">
	<div data-role="content">
		<p class="jqm-version"></p>

		<div class="content-secondary">

			<div id="jqm-homeheader">
				<h1 id="jqm-logo"><img style='width: 100%' src="design/images/logo.png" alt="SmartVision" /></h1>
				
			</div>


			<p class="intro"><center><strong>Bienvenue !</strong> Veuillez entrer vos identifiants <strong>SmartVision</strong>.</center></p>
</div>
<form action="index.php?page=connect" method="post">
	<input type="hidden" name="page" value="connect"/>
	<input type="hidden" name="query" value="<?php echo $_SERVER['QUERY_STRING']; ?>"/>
<?php
	if(isset($login_error) && $login_error == 1)
	{
		echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'>Vous avez entré un mauvais login ! :(</a></center>";
	}
?>



<div data-role="fieldcontain">
	<label for="name"><strong>Login : </strong></label>
	<input type="text" name="login" id="name" value="" required>
</div>
<div data-role="fieldcontain">
	<label for="name"><strong>Mot de passe : </strong></label>
	<input type="password" name="mdp" id="name" value="" required>
</div>
<input type="submit" value="Connexion" data-theme="b"/>

		
<a href="info.html" data-role="button" data-rel="dialog" data-transition="pop">A Propos</a>	
