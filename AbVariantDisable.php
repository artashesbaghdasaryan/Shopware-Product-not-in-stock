<?php
/**
 * @copyright  Copyright (c) 2017, Artashes Baghdasaryan
 * @category   Shopware
 * @author     Artashes Baghdasaryan
 */
namespace AbVariantDisable;

use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Symfony\Component\DependencyInjection\ContainerBuilder;


class AbVariantDisable extends Plugin
{
    /**
     * @param InstallContext $context
     * @throws \Exception
     */
    public function install(InstallContext $context)
    {
        
   
        parent::install($context);
    }
    
     public function uninstall(UninstallContext $context)
    {
        
        parent::uninstall($context);
    }

    
     public function build(ContainerBuilder $container) {
        $container->setParameter('ab_variant_disable.plugin_dir', $this->getPath());
        $container->setParameter('ab_variant_disable.view_dir', $this->getPath() . '/Resources/Views');
        parent::build($container);
    }
    
   
}

     
