<?php

	function check_connect($login, $mdp)
	{
		$query = "SELECT * FROM admins WHERE login = '".$login."' AND mdp ='".$mdp."';";
		
		$result = mysql_query($query);
		
		


		if(@mysql_num_rows($result) == 0)
		{
			return 1;
		}

		else
		{
			
			while($data = mysql_fetch_array($result))
			{
				$_SESSION['id_admin'] = $data['id'];
				$_SESSION['login'] = $data['login'];
				$_SESSION['mdp'] = $data['mdp'];
				$_SESSION['mail'] = $data['mail'];
				$_SESSION['notif'] = $data['notif'];
			}
			return 0;
		
		}
	
	}

?>
