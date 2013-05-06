
<center>
<h1>Cloud</h1>
</center>


<div data-role="content">
<div class="content-primary">

<ul data-role="listview">
<?php

	ob_start();
	passthru("ls");
	$var = ob_get_contents();
	ob_end_clean(); //Use this instead of ob_flush()
	$line = explode("<br />", $var);
	foreach($line as $value)
	{
		echo'<li><a href="bmw.html">'.$value.'</a></li>';
	}
?>
</ul>	
</div><!--/content-primary -->
</div>
