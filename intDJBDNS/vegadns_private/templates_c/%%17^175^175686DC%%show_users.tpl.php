<?php /* Smarty version 2.6.26, created on 2013-06-11 11:13:07
         compiled from show_users.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'show_users.tpl', 23, false),)), $this); ?>
<table border=0 width="70%" bgcolor="white">
<tr><td>
<table border=0 width="100%">
<tr bgcolor="#cccccc">
    <td align="middle">All User Accounts
        <?php if ($this->_tpl_vars['user_account_type'] == 'group_admin'): ?> In Your Group<?php endif; ?>
</td></tr>
</table>

<table border=0 width="100%">
<tr bgcolor="#cccccc">
  <td nowrap><?php echo $this->_tpl_vars['Name']; ?>
</td>
  <td nowrap><?php echo $this->_tpl_vars['Email']; ?>
</td>
  <td nowrap><?php echo $this->_tpl_vars['Account_Type']; ?>
</td>
  <td nowrap><?php echo $this->_tpl_vars['Group_Owner']; ?>
</td>
  <td nowrap><?php echo $this->_tpl_vars['Status']; ?>
</td>
  <td>Edit</td>
  <td>Delete</td>
</tr>

<?php $_from = $this->_tpl_vars['out_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
<tr bgcolor="#eeeeee">
  <td><?php echo ((is_array($_tmp=$this->_tpl_vars['row']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
</td>
  <td><?php echo ((is_array($_tmp=$this->_tpl_vars['row']['email'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
</td>
  <td><?php echo $this->_tpl_vars['row']['account_type']; ?>
</td>
  <td><?php echo ((is_array($_tmp=$this->_tpl_vars['row']['group_owner_name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
</td>
  <td><?php echo $this->_tpl_vars['row']['status']; ?>
</td>
  <td><a href="<?php echo $this->_tpl_vars['row']['edit_url']; ?>
">edit</a></td>
  <td align="center"><?php echo ''; ?><?php if ($this->_tpl_vars['row']['delete_url'] == ""): ?><?php echo '<img border=0 src="images/trash.png">'; ?><?php else: ?><?php echo '<a href="'; ?><?php echo $this->_tpl_vars['row']['delete_url']; ?><?php echo '"><img border=0 src="images/trash.png" alt="Trash"></a>'; ?><?php endif; ?><?php echo ''; ?>
</td>
</tr>
<?php endforeach; endif; unset($_from); ?>

</table>
</td></tr>
</table>