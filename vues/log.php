	<p class="intro"><center> Please enter the <strong>Username</strong> and the <strong>Password</strong> for the <strong>Remote System</strong>.<br> (<strong>SmartVision</strong> only needs them <strong>ONCE</strong>)<br>
<strong><?php echo $_GET['ip'];?></strong></center></p>
<form action="index.php?page=log&ip=<?php echo $_GET['ip'];?>" method="post">
	<input type="hidden" name="page" value="log"/>
	<input type="hidden" name="ip" value="<?php echo $_GET['ip'];?>"/>
	<input type="hidden" name="query" value="<?php echo $_SERVER['QUERY_STRING']; ?>"/>
<?php
	if($result == 2)
	{
		echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'><strong>Congratulations !</strong> Remote system added correctly !</a></center>";
	}
	else if(!empty($_POST['login']))
	{
		echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'>Login failed ! Make sure this one has the right authorizations on the remote system.</a></center>";
	}
?>



<div data-role="fieldcontain">
	<label for="name"><strong>Username : </strong></label>
	<input type="text" name="login" id="name" value="" required>
</div>
<div data-role="fieldcontain">
	<label for="name"><strong>Password : </strong></label>
	<input type="password" name="mdp" id="name" value="" required>
</div>
<input type="submit" value="Log In" data-theme="b"/>

