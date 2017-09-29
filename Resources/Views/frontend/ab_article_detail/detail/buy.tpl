
   {extends file='parent:frontend/detail/buy.tpl'}

{ {block name="frontend_detail_buy_button_container_outer"}
            {if (!isset($sArticle.active) || $sArticle.active)}
                {if $sArticle.isAvailable}
                    {block name="frontend_detail_buy_button_container"}
                        <div class="buybox--button-container block-group{if $NotifyHideBasket && $sArticle.notification && $sArticle.instock <= 0} is--hidden{/if}">

                            {* Quantity selection *}
                            {block name='frontend_detail_buy_quantity'}
                                <div class="buybox--quantity block">
                                    {$maxQuantity=$sArticle.maxpurchase+1}
                                    {if $sArticle.laststock && $sArticle.instock < $sArticle.maxpurchase}
                                        {$maxQuantity=$sArticle.instock+1}
                                    {/if}

                                    {block name='frontend_detail_buy_quantity_select'}
                                        <select id="sQuantity" name="sQuantity" class="quantity--select">
                                            {section name="i" start=$sArticle.minpurchase loop=$maxQuantity step=$sArticle.purchasesteps}
                                                <option value="{$smarty.section.i.index}">{$smarty.section.i.index}{if $sArticle.packunit} {$sArticle.packunit}{/if}</option>
                                            {/section}
                                        </select>
                                    {/block}
                                </div>
                            {/block}

                            {* "Buy now" button *}
                            {block name="frontend_detail_buy_button"}
                                {if $sArticle.sConfigurator && !$activeConfiguratorSelection}
                                    <button class="buybox--button block btn is--disabled is--icon-right is--large" disabled="disabled" aria-disabled="true" name="{s name="DetailBuyActionAdd"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
                                        {s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i>
                                    </button>
                                {else}
                                    <button class="buybox--button block btn is--primary is--icon-right is--center is--large" name="{s name="DetailBuyActionAdd"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
                                        {s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i>
                                    </button>
                                {/if}
                            {/block}
                        </div>
                    {/block}
                {/if}
            {/if}
        {/block}