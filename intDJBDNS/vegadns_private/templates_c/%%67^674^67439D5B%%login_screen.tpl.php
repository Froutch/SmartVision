<?php /* Smarty version 2.6.26, created on 2013-06-17 09:56:45
         compiled from login_screen.tpl */ ?>
<br>please log in:<br>

<form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
<input type="hidden" name="state" value="login">
<input type="hidden" name="<?php echo $this->_tpl_vars['session_name']; ?>
" value="<?php echo $this->_tpl_vars['session_id']; ?>
">

<table border=0>
    <tr>
        <td>Email Address</td>
        <td><input type="text" name="email"></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input type="password" name="password"></td>
    </tr>
    <tr>
        <td colspan=2 align="right"><input type="submit" value="Login"></td>
    </tr>
</table>

</form>