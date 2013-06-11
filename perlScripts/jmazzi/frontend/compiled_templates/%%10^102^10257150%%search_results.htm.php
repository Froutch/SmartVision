<?php /* Smarty version 2.6.9, created on 2013-06-10 11:42:04
         compiled from admin/search_results.htm */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'admin/search_results.htm', 39, false),)), $this); ?>
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
<SCRIPT LANGUAGE="JavaScript">
<!-- Start confirm del 

function delrecord(recordname) {
        return confirm("Are you sure you want to delete " + recordname + "?" );
}

// Stop confirm del --->
</SCRIPT>
<table width="80%" border="0" cellpadding="2" cellspacing="1" onmouseover="this.style.backgroundColor = '#BCCBD2';" onmouseout="this.style.backgroundColor = '#CDDBE2';" class="mainBG" align="center">
  <tr> 
    <td align="center" valign="middle" class="headBG1"><span class="textSize0"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/nav.htm", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><br></span>
</td>
  </tr>
  <tr> 
    <td onmouseover="this.style.backgroundColor = '#FBFDFF';"
onmouseout="this.style.backgroundColor = '#FFFFFF';"
class="contentBGNewsMainTD"> <br>
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/nav_search.htm", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
      <table width="50%" border="0" cellspacing="1" cellpadding="2" bgcolor="#dcdcdc" align="center" >
        <tr> <?php if ($_REQUEST['msg']): ?><center><font color="<?php echo $this->_tpl_vars['color']; ?>
"><b><?php echo $this->_tpl_vars['msg']; ?>
</b></font></center><br><?php endif; ?>
          <td bgcolor="whitesmoke" colspan="2"><p><b><center>
            Viewing Domains: <?php echo $this->_tpl_vars['totaldomains']; ?>

          </center></b></p></td>
        </tr>
        <tr> 
          <td bgcolor="#ffffff" colspan="2"><center>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr><td><br></td></tr>
            <?php unset($this->_sections['info']);
$this->_sections['info']['name'] = 'info';
$this->_sections['info']['loop'] = is_array($_loop=$this->_tpl_vars['domains']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['info']['show'] = true;
$this->_sections['info']['max'] = $this->_sections['info']['loop'];
$this->_sections['info']['step'] = 1;
$this->_sections['info']['start'] = $this->_sections['info']['step'] > 0 ? 0 : $this->_sections['info']['loop']-1;
if ($this->_sections['info']['show']) {
    $this->_sections['info']['total'] = $this->_sections['info']['loop'];
    if ($this->_sections['info']['total'] == 0)
        $this->_sections['info']['show'] = false;
} else
    $this->_sections['info']['total'] = 0;
if ($this->_sections['info']['show']):

            for ($this->_sections['info']['index'] = $this->_sections['info']['start'], $this->_sections['info']['iteration'] = 1;
                 $this->_sections['info']['iteration'] <= $this->_sections['info']['total'];
                 $this->_sections['info']['index'] += $this->_sections['info']['step'], $this->_sections['info']['iteration']++):
$this->_sections['info']['rownum'] = $this->_sections['info']['iteration'];
$this->_sections['info']['index_prev'] = $this->_sections['info']['index'] - $this->_sections['info']['step'];
$this->_sections['info']['index_next'] = $this->_sections['info']['index'] + $this->_sections['info']['step'];
$this->_sections['info']['first']      = ($this->_sections['info']['iteration'] == 1);
$this->_sections['info']['last']       = ($this->_sections['info']['iteration'] == $this->_sections['info']['total']);
?>
              <tr bgcolor="<?php echo smarty_function_cycle(array('name' => 'info','values' => "whitesmoke,#ffffff"), $this);?>
">
                <td><?php echo $this->_tpl_vars['domains'][$this->_sections['info']['index']]['domain']; ?>
</td>
                <td><?php echo $this->_tpl_vars['domains'][$this->_sections['info']['index']]['password']; ?>
</td>
                <td><a href="modzone.php?act=edit&domainid=<?php echo $this->_tpl_vars['domains'][$this->_sections['info']['index']]['domainid']; ?>
">Edit</a></td>
                <td><a href="modzone.php?act=del&domainid=<?php echo $this->_tpl_vars['domains'][$this->_sections['info']['index']]['domainid']; ?>
" onClick="return delrecord('<?php echo $this->_tpl_vars['domains'][$this->_sections['info']['index']]['domain']; ?>
')">Delete</a></td>
              </tr>
            <?php endfor; endif; ?>
            <tr><td><br></td></tr>
            </table>
          </center></td>
      </table>
        <br>

  <center><?php echo $this->_tpl_vars['paging']; ?>
</center>
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