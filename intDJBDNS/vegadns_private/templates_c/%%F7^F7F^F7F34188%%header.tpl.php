<?php /* Smarty version 2.6.26, created on 2013-06-17 09:56:45
         compiled from header.tpl */ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
    <HEAD>
        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
        <TITLE>VegaDNS Administration</TITLE>
        <link rel="STYLESHEET" type="text/css" href="templates/core-style.css">
    <!--[if gte IE 5.5000]>
    <script type="text/javascript" src="templates/pngfix.js"></script>
    <![endif]-->

    </HEAD>
    <body background="images/background.jpg">

<center>

<table border=0 width="100%">
    <tr valign="top">

<?php if ($this->_tpl_vars['state'] == 'logged_in' && $this->_tpl_vars['email'] != ""): ?>
    <td width="25%">
    &nbsp;logged in as:<br>
    &nbsp;<b><?php echo $this->_tpl_vars['email']; ?>
</b><br>
    &nbsp<a href="<?php echo $this->_tpl_vars['logout_url']; ?>
">log out</a><br>
    </td>
<?php endif; ?>
    <td align="center">
    <img src="images/vegadns.png" alt="VegaDNS">
    <br>tinydns administration - version <?php echo $this->_tpl_vars['version']; ?>

    </td>
<?php if ($this->_tpl_vars['state'] == 'logged_in' && $this->_tpl_vars['email'] != ""): ?>
    <td width="25%">
    </td>
<?php endif; ?>
</tr>
</table>

<p>

<?php if ($this->_tpl_vars['state'] == 'logged_in' && $this->_tpl_vars['email'] != ""): ?>

<table border=0>
    <tr>
        <td align="center">
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=domains">Domains</a>&nbsp | &nbsp
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=domains&domain_mode=add">New Domain</a>&nbsp | &nbsp
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=users&user_mode=edit_account&cid=<?php echo $this->_tpl_vars['cid']; ?>
">Edit My Account</a> | &nbsp
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=dnsquery">DNS Query</a>
        </td>
    </tr>

    <?php if ($this->_tpl_vars['account_type'] == 'senior_admin' || $this->_tpl_vars['account_type'] == 'group_admin'): ?>
    <tr>
        <td align="center">
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=users&user_mode=show_users">Accounts</a>&nbsp | &nbsp
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=users&user_mode=add_account">Add Account</a>&nbsp | &nbsp
            <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=default_records">Default Records</a>&nbsp

        <?php if ($this->_tpl_vars['account_type'] == 'senior_admin'): ?>
            | &nbsp <a href="<?php echo $this->_tpl_vars['base_url']; ?>
&mode=domains&domain_mode=import_domains">Import Domains via AXFR</a>&nbsp
        <?php endif; ?>
        </td>
    </tr>
    <?php endif; ?>
</table>
        </td>
    </tr>

</table>
<?php endif; ?>
<p>


        <br><?php display_msg() ?></b><br>
    <p>