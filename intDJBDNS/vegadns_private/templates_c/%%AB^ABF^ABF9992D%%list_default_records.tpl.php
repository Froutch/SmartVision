<?php /* Smarty version 2.6.26, created on 2013-06-17 13:55:46
         compiled from list_default_records.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'list_default_records.tpl', 15, false),array('function', 'cycle', 'list_default_records.tpl', 63, false),)), $this); ?>
<b>Edit Default Records</b><br>
<table border=0 width=90% bgcolor=white>
<tr><td>

<table border=0 width=100%>
<tr bgcolor="#cccccc">
  <td>Properties (SOA)</td>
  <td align="right" width="5%"><a href="<?php echo $this->_tpl_vars['edit_soa_url']; ?>
">edit</a></td>
</table>


<table border=0 width="100%">
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Contact Address:</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['tldemail'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
      <td width="10%" nowrap>Primary Nameserver:&nbsp</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['tldhost'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Refresh:</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['refresh'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
      <td width="10%" nowrap>Retry:</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['retry'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Expiration:</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['expire'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
      <td width="10%" nowrap>Minimum TTL:&nbsp</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['minimum'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Default TTL:</td>
      <td width="40%" nowrap><?php echo ((is_array($_tmp=$this->_tpl_vars['soa_array']['ttl'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</td>
      <td width="10%" nowrap>&nbsp</td>
      <td width="40%" nowrap>&nbsp</td>
  </tr>
  <tr bgcolor="#eeeeee">
  </tr>
</table>

<br>
<table border=0 width="100%">
<tr bgcolor="#cccccc">
  <td>Records</td>
  <td align="right" width="5%" nowrap><a href="<?php echo $this->_tpl_vars['add_record_url']; ?>
">add record</a></td>
  <td align="right" width="5%" nowrap><a href="<?php echo $this->_tpl_vars['view_log_url']; ?>
">view log</a></td>
  </tr>
</table>

<table border=0 width="100%">
  <tr bgcolor="#cccccc">
      <td>Name</td>
      <td width="5%">Type</td>
      <td>Address</td>
      <td width="10%">Distance</td>
      <td width="10%">Weight</td>
      <td width="5%">Port</td>
      <td width="5%">TTL</td>
      <td width="5%">Delete</td>
  </tr>

<?php $_from = $this->_tpl_vars['out_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
    <tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#ffffff,#dcdcdc"), $this);?>
">
        <td nowrap width="20%"><?php echo $this->_tpl_vars['row']['host']; ?>
</td>
        <td width="5%" nowrap><?php echo $this->_tpl_vars['row']['type']; ?>
</td>
        <td nowrap><?php echo $this->_tpl_vars['row']['val']; ?>
</td>
        <td width="10%" nowrap><?php echo $this->_tpl_vars['row']['distance']; ?>
</td>
        <td width="10%" nowrap><?php echo $this->_tpl_vars['row']['weight']; ?>
</td>
        <td width="5%" nowrap><?php echo $this->_tpl_vars['row']['port']; ?>
</td>
        <td width="5%" nowrap><?php echo $this->_tpl_vars['row']['ttl']; ?>
</td>
        <td width="5%" align="center" nowrap><a href="<?php echo $this->_tpl_vars['row']['delete_url']; ?>
"><img border=0 src="images/trash.png" alt="Trash"></a></td>
    </tr>
<?php endforeach; endif; unset($_from); ?>

</table>
</td></tr>
</table>