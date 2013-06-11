

<?php
if ($host == 'localhost')
{

?>

<h2>Services sur <?php echo $_GET['host']; ?></h2>
<?php

        echo"<table cellpadding='5'>";
        system('sudo perlScripts/services.pl');
        echo"</table>";
        echo"</div>";



}
?>



