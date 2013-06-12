<?php /* Smarty version 2.6.26, created on 2013-06-11 15:05:31
         compiled from import_form.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'import_form.tpl', 2, false),)), $this); ?>
<form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
<input type="hidden" name="state" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['state'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
<input type="hidden" name="mode" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['mode'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
<input type="hidden" name="domain_mode" value="import_domains_now">
<input type="hidden" name="<?php echo ((is_array($_tmp=$this->_tpl_vars['session_name'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['session_id'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">


<table border=0 bgcolor="white">
<tr><td>
    <table border=0 width="100%">
    <tr bgcolor="#cccccc"><td align="center">Import Domains via AXFR</td></tr>
    </table>

    <table border=0 width="100%">
    <tr bgcolor="#eeeeee">
        <td>Hostname or IP address:</td>
        <td><input type="text" name="hostname" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['hostname'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
"></td>
    </tr>
    <tr valign="top" bgcolor="#eeeeee">
        <td>List of Domains:<br>(one per line)</td>
        <td><textarea name="domains" rows=10><?php echo ((is_array($_tmp=$this->_tpl_vars['domains'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
</textarea></td>
    </tr>
    </table>
</td></tr>
</table>
    Rewrite SOA to default value?<input type="checkbox" name="default_soa">
    <br>Rewrite NS servers to defalt values?<input type="checkbox" name="default_ns">
    <br><br><input type="submit" value="get domains">
</form>