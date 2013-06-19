<div data-role="page" class="type-home">
	<div data-role="content">
		<p class="jqm-version"></p>

		<div class="content-secondary">

			<div id="jqm-homeheader">
				<h1 id="jqm-logo"><img style='width: 100%' src="design/images/logo.png" alt="SmartVision" /></h1>
				
			</div>


			<p class="intro"><center><strong>Hi there !</strong> Please <strong>log in</strong> with your <strong>SmartVision</strong> personal account (:</center></p>
</div>
<form action="index.php?page=connect" method="post">
	<input type="hidden" name="page" value="connect"/>
	<input type="hidden" name="query" value="<?php echo $_SERVER['QUERY_STRING']; ?>"/>
<?php
	if(isset($login_error) && $login_error == 1)
	{
		echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'>Your login is <strong>totally</strong> wrong ! :(</a></center>";
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
</form>
		
<a href="info.html" data-role="button" data-rel="dialog" data-transition="pop">About Us</a>	
