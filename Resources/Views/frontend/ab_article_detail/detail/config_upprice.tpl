
   {extends file='parent:frontend/detail/config_upprice.tpl'}

  {block name='frontend_detail_group_selection'}
            <select name="group[{$sConfigurator.groupID}]"{if $theme.ajaxVariantSwitch} data-ajax-select-variants="true"{else} data-auto-submit="true"{/if}>
                {foreach $sConfigurator.values as $configValue}
                    {if !{config name=hideNoInstock} || ({config name=hideNoInstock} && $configValue.selectable)}
                        <option{if $configValue.selected} selected="selected"{/if} value="{$configValue.optionID}">
                            {$configValue.optionname}{if $configValue.upprice} {if $configValue.upprice > 0}{/if}{/if}
                        </option>
                         {else}
                         <option value="{$configValue.optionID}" disabled="disabled" style="color:lightblue;">
                            {$configValue.optionname}
                        </option>
                    {/if}
                {/foreach}
            </select>
        {/block}