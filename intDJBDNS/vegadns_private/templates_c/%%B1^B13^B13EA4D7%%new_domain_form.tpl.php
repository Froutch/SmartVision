<?php /* Smarty version 2.6.26, created on 2013-06-17 13:55:30
         compiled from new_domain_form.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'new_domain_form.tpl', 2, false),)), $this); ?>
<form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
<input type="hidden" name="state" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['state'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
<input type="hidden" name="mode" value="domains">
<input type="hidden" name="<?php echo ((is_array($_tmp=$this->_tpl_vars['session_name'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['session_id'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
<input type="hidden" name="domain_mode" value="add_now">


<table border=0 width="70%" bgcolor="white">
<tr><td>
    <table border=0 width="100%">
    <tr bgcolor="#cccccc"><td align="center">Add Domain</td></tr>
    </table>

    <table border=0 width="100%">
    <tr bgcolor="#eeeeee">
        <td>Domain Name</td>
        <td align="left" colspan=2><input type="text" name="domain" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['domain'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
        </td>
    </tr>
    </table>
    </td>
</tr>
</table>
<input type="submit" value="add">
</form>