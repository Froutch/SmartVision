<?php
if ($host == 'localhost')
{

if(!empty($_GET['service']))
{
	if($_GET['value'] == 1)
	{
		system('sudo chkconfig '.$_GET['service'].' on');
	}
	if($_GET['value'] == 0)
	{
		system('sudo chkconfig '.$_GET['service'].' off');
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



