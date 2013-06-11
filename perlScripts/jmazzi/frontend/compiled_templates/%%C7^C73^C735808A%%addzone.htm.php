<?php /* Smarty version 2.6.9, created on 2013-06-10 11:33:31
         compiled from admin/addzone.htm */ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><?php echo $this->_tpl_vars['app_name']; ?>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<?php echo $this->_tpl_vars['base_url']; ?>
/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="80%" border="0" cellpadding="2" cellspacing="1" onmouseover="this.style.backgroundColor = '#BCCBD2';" onmouseout="this.style.backgroundColor = '#CDDBE2';" class="mainBG" align="center">
  <tr> 
    <td align="center" valign="middle" class="headBG1"><span class="textSize0"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/nav.htm", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></span>
</td>
  </tr>
  <tr> 
    <td onmouseover="this.style.backgroundColor = '#FBFDFF';"
onmouseout="this.style.backgroundColor = '#FFFFFF';"
class="contentBGNewsMainTD"> <br>
			<table width="50%" border="0" cellspacing="1" cellpadding="2" bgcolor="#dcdcdc" align="center" >
              <tr>
                <td bgcolor="whitesmoke" colspan="2"><p><b>
                    <center>
                      <b>Add Zone</b>
                    </center>
                </b></p></td>
              </tr>
              <tr>
                <td bgcolor="#ffffff" colspan="2">
                      <form name="addrecord" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>
">
                        <input type="hidden" name="act" value="add">
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="20%">Domain</td>
                            <td width="20%">IP</td>
                            <td width="20%">Password</td>
                          </tr>
                          <tr>
                            <td><input name="domain" type="text" size="15"></td>
                            <td><input name="ip" type="text" size="15" value="<?php echo $this->_tpl_vars['ip']; ?>
"></td>
                            <td><input name="password" type="text" size="15"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><div align="center">
                              <input type="submit" name="Submit" value="Submit">
                            </div></td>
                          </tr>
                        </table>
                      </form>
                </div></td>
            </table>
			<center>
			</center>
        <br>

      <br>
    </td>
  </tr>
  </tr>
      <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.htm", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
  </tr>
</table>
</body>
</html>