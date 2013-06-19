

<h1>Welcome back, <?php echo ucwords($_SESSION['login']) ?> !</h1>
<?php
echo '<h2>Date : ' . date('d/m/Y') . "";
echo ', Time : ' . date('H:i') . "</h2>";
echo '<h3>Uptime : ';
system('sudo perlScripts/uptime.pl');
echo'</h3>';
?>
