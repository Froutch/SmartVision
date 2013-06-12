<?php /* Smarty version 2.6.26, created on 2013-06-11 11:11:12
         compiled from account_form.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'account_form.tpl', 13, false),array('function', 'html_options', 'account_form.tpl', 44, false),)), $this); ?>
<form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
<input type="hidden" name="state" value="<?php echo $this->_tpl_vars['state']; ?>
">
<input type="hidden" name="mode" value="users">
<?php if ($this->_tpl_vars['cid'] != ""): ?>
<input type="hidden" name="cid" value="<?php echo $this->_tpl_vars['cid']; ?>
">
<?php endif; ?>
<input type="hidden" name="<?php echo $this->_tpl_vars['session_name']; ?>
" value="<?php echo $this->_tpl_vars['session_id']; ?>
">
<input type="hidden" name="user_mode" value="<?php echo $this->_tpl_vars['user_mode_next']; ?>
">

<table border=0 bgcolor="white">
<tr><td>
    <table border=0 width="100%">
    <tr bgcolor="#cccccc"><td align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['account_title'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
</td></tr>
    </table>

    <table border=0 width=100%>
    <tr bgcolor="#eeeeee">
        <td>First Name:</td>
        <td><input type="text" name="first_name" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['first_name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"></td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Last Name:</td>
        <td><input type="text" name="last_name" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['last_name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"></td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Email Address:</td>
        <td><input type="text" name="email_address" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['email_address'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"></td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Phone Number:</td>
        <td><input type="text" name="phone" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['phone'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"></td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Password:</td>
        <td><input type="password" name="password"></td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Re-Type Password:</td>
        <td><input type="password" name="password2"></td>
    <?php if ($this->_tpl_vars['user_account_type'] == 'senior_admin'): ?>
    <tr bgcolor=#eeeeee>
        <td>Account Type:</td>
        <td><select name="account_type">
                <?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['select_account_type'],'selected' => $this->_tpl_vars['type_selected'],'output' => $this->_tpl_vars['select_account_type']), $this);?>

            </select>
        </td>
    </tr>
    <tr bgcolor="#eeeeee">
        <td>Account Status:</td>
        <td><select name="status">
                <?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['select_status'],'selected' => $this->_tpl_vars['status_selected'],'output' => $this->_tpl_vars['select_status']), $this);?>

            </select>
        </td>
    </tr>
    <?php else: ?>
         <?php if ($this->_tpl_vars['user_mode'] != 'add_account' && $this->_tpl_vars['user_mode'] != 'add_account_now'): ?>
        <tr bgcolor="#eeeeee">
            <td>Account Type:</td>
            <td><?php echo $this->_tpl_vars['account_type']; ?>
</td>
        </tr>
        <tr bgcolor="#eeeeee">
            <td>Status</td>
            <td><?php echo $this->_tpl_vars['account_status']; ?>
</td>
        <?php endif; ?>
    <?php endif; ?>

    <?php if ($this->_tpl_vars['user_account_type'] == 'senior_admin'): ?>
    <tr bgcolor="#eeeeee">
        <td>Group Owner:</td>
        <td><input type="text" name="group_email_address" value="<?php echo $this->_tpl_vars['group_email_address']; ?>
">
        </td>
    </tr>
    <?php endif; ?>
    </table>
</td></tr>
</table>
    <br><input type="submit" value="<?php echo $this->_tpl_vars['submit']; ?>
">
</form>