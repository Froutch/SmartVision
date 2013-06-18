<?php /* Smarty version 2.6.26, created on 2013-06-17 13:55:31
         compiled from list_domains.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'list_domains.tpl', 9, false),array('function', 'cycle', 'list_domains.tpl', 51, false),)), $this); ?>
    <table width="70%" border=0 cellspacing=5 cellpadding=3 bgcolor="white">
        <tr bgcolor="#cccccc">
            <td colspan="6" align="center">

            <table width="100%" border=0 cellspacing=0 cellpadding=3 bgcolor="#cccccc">
                <tr valign="top" bgcolor="#cccccc">
                <td align="left" colspan="2">

                Listing <?php echo $this->_tpl_vars['first_domain']; ?>
 - <?php echo $this->_tpl_vars['last_domain']; ?>
 of <?php echo $this->_tpl_vars['totaldomains']; ?>
 Domains <?php echo ((is_array($_tmp=$this->_tpl_vars['searchtexttag'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
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
                    <input type="hidden" name="mode" value="domains">
                    <input type="hidden" name="<?php echo $this->_tpl_vars['session_name']; ?>
" value="<?php echo $this->_tpl_vars['session_id']; ?>
">
                    <input type="text" name="search" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['search'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'html') : smarty_modifier_escape($_tmp, 'html')); ?>
">
                    <input type="submit" value="search"></form>

                </td>
                </tr>
               <tr>
                <td align="center" colspan="6" width=100%>
<a href="<?php echo $this->_tpl_vars['all_url']; ?>
">ALL</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=num">0-9</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=a">A</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=b">B</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=c">C</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=d">D</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=e">E</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=f">F</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=g">G</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=h">H</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=i">I</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=j">J</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=k">K</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=l">L</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=m">M</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=n">N</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
?&scope=o">O</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=p">P</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=q">Q</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=r">R</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=s">S</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=t">T</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=u">U</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=v">V</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=x">X</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=w">W</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=y">Y</a> | <a href="<?php echo $this->_tpl_vars['all_url']; ?>
&scope=z">Z</a>
                </td>
               </tr>

            </table>


            </td>
        </tr>
        <tr bgcolor="#cccccc">
            <td nowrap><?php echo $this->_tpl_vars['Domain']; ?>
</td><td nowrap><?php echo $this->_tpl_vars['Status']; ?>
</td>
            <td align="center" nowrap><?php echo $this->_tpl_vars['Owner']; ?>
</td>
            <td align="center" nowrap><?php echo $this->_tpl_vars['Group_Owner']; ?>
</td>
            <td align="center" nowrap>Change Status</td>
            <td width="1%">Delete</td>
        </tr>

        <?php $_from = $this->_tpl_vars['out_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
        <tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#ffffff,#dcdcdc"), $this);?>
">
            <td><a href="<?php echo $this->_tpl_vars['row']['edit_url']; ?>
"><?php echo $this->_tpl_vars['row']['domain']; ?>
</td>
            <td width="1%" nowrap><?php echo $this->_tpl_vars['row']['status']; ?>
</td>
            <td width="1%" align="center" nowrap>
            <?php if ($this->_tpl_vars['row']['change_owner_url'] != ""): ?>
                <a href="<?php echo $this->_tpl_vars['row']['change_owner_url']; ?>
"><?php echo $this->_tpl_vars['row']['owner_name']; ?>
</a>
            <?php else: ?>
                <?php echo $this->_tpl_vars['row']['owner_name']; ?>

            <?php endif; ?>
            </td>
            <td width="1%" align="center" nowrap>
            <?php if ($this->_tpl_vars['row']['change_owner_url'] != ""): ?>
                <a href="<?php echo $this->_tpl_vars['row']['change_owner_url']; ?>
"><?php echo $this->_tpl_vars['row']['group_owner_name']; ?>
</a>
            <?php else: ?>
                <?php echo $this->_tpl_vars['row']['group_owner_name']; ?>

            <?php endif; ?>
            </td>
            <td width="1%" align="center">
            <?php echo ''; ?><?php if ($this->_tpl_vars['row']['status'] == 'active'): ?><?php echo ''; ?><?php if ($this->_tpl_vars['row']['deactivate_url'] != ""): ?><?php echo '<a href="'; ?><?php echo $this->_tpl_vars['row']['deactivate_url']; ?><?php echo '">de-activate</a>'; ?><?php else: ?><?php echo 'de-activate'; ?><?php endif; ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php if ($this->_tpl_vars['row']['activate_url'] != ""): ?><?php echo '<a href="'; ?><?php echo $this->_tpl_vars['row']['activate_url']; ?><?php echo '">activate</a>'; ?><?php else: ?><?php echo 'activate'; ?><?php endif; ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?>

            </td>
            <td align="center" width="1%"><a href="<?php echo $this->_tpl_vars['row']['delete_url']; ?>
"><img src="images/trash.png" border=0 alt="Trash"></a></td>
            </tr>
        <?php endforeach; endif; unset($_from); ?>
    </table>