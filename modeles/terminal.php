<?php

	function command($req)
	{
		system($req, $result);
			mysql_query('INSERT INTO terminal values("", "'.$result.'")');
	}

?>
