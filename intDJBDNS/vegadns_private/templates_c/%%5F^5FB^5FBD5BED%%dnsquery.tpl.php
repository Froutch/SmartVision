<?php /* Smarty version 2.6.26, created on 2013-06-11 11:16:10
         compiled from dnsquery.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'dnsquery.tpl', 18, false),)), $this); ?>
<form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
<input type="hidden" name="state" value="<?php echo $this->_tpl_vars['state']; ?>
">
<input type="hidden" name="mode" value="dnsquery">
<input type="hidden" name="query_mode" value="do_query">
<input type="hidden" name="<?php echo $this->_tpl_vars['session_name']; ?>
" value="<?php echo $this->_tpl_vars['session_id']; ?>
">

<table border="0">
<tr bgcolor="#cccccc">
  <td colspan="2" align="middle">DNS Query</td>
</tr>
<tr bgcolor="#cccccc">
  <td>Name</td>
  <td><input type="text" name="name" value="<?php echo $this->_tpl_vars['name']; ?>
"</td>
</tr>
<tr bgcolor="#cccccc">
  <td>Query Type:</td>
  <td><select name="type">
  <?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['typearray'],'selected' => $this->_tpl_vars['type_selected'],'output' => $this->_tpl_vars['typearray']), $this);?>

  </td>
</tr>
<tr bgcolor="#cccccc">
  <td>Recursive</td>
  <td><input type="checkbox" name="recursive"<?php if ($this->_tpl_vars['recursive']): ?> checked<?php endif; ?>></td>
</tr>
<tr bgcolor="#cccccc">
  <td>Host (only for non-recursive)</td>
  <td><input type="text" name="host" value="<?php echo $this->_tpl_vars['host']; ?>
"></td>
</tr>
<tr bgcolor="#cccccc">
  <td colspan="2" align="right"><input type="submit" value="query"></td>
</tr>
<?php if ($this->_tpl_vars['result'] != ""): ?>
<tr bgcolor="#cccccc">
  <td colspan="2">Results of <?php echo $this->_tpl_vars['command']; ?>
</td>
</tr>
<tr bgcolor="#cccccc">
  <td colspan="2"><?php echo $this->_tpl_vars['result']; ?>
</td>
</tr>
<?php endif; ?>
</table>
</form>