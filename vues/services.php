<?php
if ($host == 'localhost')
{

?>

<center><h2>Services on <?php echo $_GET['host']; ?></h2></center>
<?php

        echo"<center><table cellspacing='0' cellpadding='0'>";
        system('sudo perlScripts/services.pl');
        echo"</table></center>";
        echo"</div>";



}
?>



