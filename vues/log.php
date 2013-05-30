	<p class="intro"><center> Veuillez entrer les <strong>identifiants</strong> de la machine <strong><?php echo $_GET['ip'];?></strong></center></p>
<form action="index.php?page=log&ip=<?php echo $_GET['ip'];?>" method="post">
	<input type="hidden" name="page" value="log"/>
	<input type="hidden" name="ip" value="<?php echo $_GET['ip'];?>"/>
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

