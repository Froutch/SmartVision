<?php /* Smarty version 2.6.26, created on 2013-06-11 11:14:48
         compiled from list_records.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'list_records.tpl', 101, false),)), $this); ?>
<b>Edit Domain</b><br>
<table border=0 width="90%" bgcolor="white">
<tr><td>

<?php if ($this->_tpl_vars['display_soa']): ?>
<table border=0 width="100%">
<tr bgcolor="#cccccc">
  <td>Properties (SOA)</td>
  <td align="right" width="5%"><a href="<?php echo $this->_tpl_vars['edit_soa_url']; ?>
">edit</a></td>
</table>


<table border=0 width="100%">
  <tr bgcolor="#eeeeee">
      <td width="10%">Domain:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['domain']; ?>
</td>
      <td width="10%" nowrap>Refresh:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['refresh']; ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Contact Address:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['tldemail']; ?>
</td>
      <td width="10%" nowrap>Retry:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['retry']; ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Primary Nameserver:&nbsp</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['tldhost']; ?>
</td>
      <td width="10%" nowrap>Expiration:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['expire']; ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Serial Number:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['serial']; ?>
</td>
      <td width="10%" nowrap>Minimum TTL:&nbsp</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['minimum']; ?>
</td>
  </tr>
  <tr bgcolor="#eeeeee">
      <td width="10%" nowrap>Default TTL:</td>
      <td width="40%" nowrap><?php echo $this->_tpl_vars['ttl']; ?>
</td>
      <td width="10%" nowrap>&nbsp</td>
      <td width="40%" nowrap>&nbsp</td>
  </tr>
</table>
<br>
<?php endif; ?>

<table border=0 width="100%">
<tr bgcolor="#cccccc">
    <td colspan=6 align="center">
            <table width="100%" border=0 cellspacing=0 cellpadding=3 bgcolor="#cccccc">
                <tr valign="top" bgcolor="#cccccc">
                <td align="left" colspan="2">

                Listing <?php echo $this->_tpl_vars['first_record']; ?>
 - <?php echo $this->_tpl_vars['last_record']; ?>
 of <?php echo $this->_tpl_vars['totalrecords']; ?>
 Records <?php echo $this->_tpl_vars['searchtexttag']; ?>
</td>
                <td align="center" colspan="2">
                <?php if ($this->_tpl_vars['previous_url'] != ""): ?> <a href=<?php echo $this->_tpl_vars['previous_url']; ?>
>previous</a>
                <?php else: ?>previous<?php endif; ?>
                <?php if ($this->_tpl_vars['next_url'] != ""): ?> <a href=<?php echo $this->_tpl_vars['next_url']; ?>
>next</a>
                <?php else: ?>next<?php endif; ?>
                <?php if ($this->_tpl_vars['first_url'] != ""): ?> <a href=<?php echo $this->_tpl_vars['first_url']; ?>
>first</a>
                <?php else: ?>first<?php endif; ?>
                <?php if ($this->_tpl_vars['last_url'] != ""): ?> <a href=<?php echo $this->_tpl_vars['last_url']; ?>
>last</a>
                <?php else: ?>last<?php endif; ?>
                <a href=<?php echo $this->_tpl_vars['all_url']; ?>
>all</a>
                </td>
                <td align="right" colspan="2">
                    <form action="<?php echo $this->_tpl_vars['php_self']; ?>
">
                    <input type="hidden" name="state" value="<?php echo $this->_tpl_vars['state']; ?>
">
                    <input type="hidden" name="mode" value="records">
                    <input type="hidden" name="<?php echo $this->_tpl_vars['session_name']; ?>
" value="<?php echo $this->_tpl_vars['session_id']; ?>
">
                    <input type="hidden" name="domain" value="<?php echo $this->_tpl_vars['domain']; ?>
">
                    <input type="text" name="search" value="<?php echo $this->_tpl_vars['search']; ?>
">
                    <input type="submit" value="search"></form>

                </td>
                </tr>
            </table>
    </td>
</tr>
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
      <td nowrap><?php echo $this->_tpl_vars['Name']; ?>
</td>
      <td width="5%" nowrap><?php echo $this->_tpl_vars['Type']; ?>
</td>
      <td nowrap><?php echo $this->_tpl_vars['Address']; ?>
</td>
      <td nowrap width="10%"><?php echo $this->_tpl_vars['Distance']; ?>
</td>
      <td nowrap width="10%">Weight</td>
      <td nowrap width="5%">Port</td>
      <td nowrap width="5%"><?php echo $this->_tpl_vars['TTL']; ?>
</td>
      <td width="5%">Delete</td>
  </tr>

<?php $_from = $this->_tpl_vars['out_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
    <tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#ffffff,#dcdcdc"), $this);?>
">
        <td nowrap width="20%"><a href="<?php echo $this->_tpl_vars['row']['edit_url']; ?>
"><?php echo $this->_tpl_vars['row']['host']; ?>
</a></td>
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