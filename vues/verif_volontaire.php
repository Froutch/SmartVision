<div class='login_admin'>
	<h1>Nouvelle Candidature</h1>
	<border></border>
	<h2>Vérifiez d'abord si le Candidat n'existe pas déjà.</h2>
	<form action="" method="get">
	<?php
		if(isset($login_error) && $login_error == 1)
		{
			echo "<div class='error'>Vous avez entré un mauvais login ! :(</div>";
		}
	?>
	<input type="hidden" name="page" value="add_volontaire"/>
	<input type="text" name="nom" placeholder="Nom" required><br>
	<input type="text" name="prenom" placeholder="Prénom" required><br>
	<input type="text" name="date_naissance" id="popupDatepicker" placeholder="Date de Naissance"><br>
	<input type="submit" value="continuer"/>
</div>
