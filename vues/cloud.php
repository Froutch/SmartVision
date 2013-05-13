


<div data-role="content">
<div class="content-primary">

<ul data-role="listview">
<?php

	ob_start();
	passthru("ls cloud");
	$var = ob_get_contents();
	ob_end_clean(); //Use this instead of ob_flush()
	$line = explode("\n", $var);
	foreach($line as $value)
	{
		echo'<li><a href="';
		if (preg_match("/.pdf/i", $value)) {
		$link = "https://docs.google.com/viewer?url=";
		$link .= $_SERVER['HTTP_HOST'];
		$link .= $_SERVER['PHP_SELF'];

		$link = str_replace("index.php", "", $link);
		$link = str_replace(":4060", ":3080", $link);
		$link .= "cloud/".$value;
		echo $link;
} else {
    echo "";
}
		echo'">'.$value;
		echo'</a></li>';
	}
?>
</ul>	
</div><!--/content-primary -->
</div>
