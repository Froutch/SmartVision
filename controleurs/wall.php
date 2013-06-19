<?php

if(!empty($_POST['message']))
{
	system('sudo echo "'.$_POST['message'].'" | wall');
}
header('Location:index.php?page=config&host=localhost');


?>
