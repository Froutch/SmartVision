<?php
if ($host == 'localhost')
{

if(!empty($_GET['service']))
{
	if($_GET['value'] == 1)
	{
		system('sudo /etc/init.d/'.$_GET['service'].' start');
	}
	if($_GET['value'] == 0)
	{
		system('sudo /etc/init.d/'.$_GET['service'].' stop');
	}
}



?>
<form>
<center><h2>Services on <?php echo $_GET['host']; ?></h2></center>
<?php

        echo"<center><table cellspacing='0' cellpadding='0'>";
        system('sudo perlScripts/services.pl');
        echo"</table></center>";
        echo"</div>";



}
?>
</form>



