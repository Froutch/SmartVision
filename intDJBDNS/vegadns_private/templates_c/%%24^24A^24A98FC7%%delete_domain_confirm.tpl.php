<?php /* Smarty version 2.6.26, created on 2013-06-11 11:20:57
         compiled from delete_domain_confirm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'delete_domain_confirm.tpl', 1, false),)), $this); ?>
<h3>Are you really sure you want to delete <?php echo ((is_array($_tmp=$this->_tpl_vars['domain'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
?</h3><p>

<a href="<?php echo $this->_tpl_vars['cancel_url']; ?>
">cancel</a> &nbsp | &nbsp <a href="<?php echo $this->_tpl_vars['delete_url']; ?>
">delete</a>