<?php

namespace AbVariantDisable\Subscriber;

use \Enlight\Event\SubscriberInterface;
use \Symfony\Component\DependencyInjection\ContainerInterface;

class Frontend implements SubscriberInterface {

  private $container;
  
  public function __construct(ContainerInterface $container) {
    $this->container = $container;
  }

  public static function getSubscribedEvents() {

    return array(
      'Enlight_Controller_Action_PostDispatchSecure_Frontend_Detail' => 'onPostDispatchFrontendDetail',
      );
  }
  public function onPostDispatchFrontendDetail(\Enlight_Controller_ActionEventArgs $args) {
   $controller = $args->get('subject');
   $view = $controller->View();
   $request = $controller->Request();
   $view->addTemplateDir($this->getPluginPath());        
   $view->extendsTemplate('frontend/ab_article_detail/detail/config_upprice.tpl');
  
 }



      /**
     * @return string
     */
      private function getPluginPath()
      {
        return Shopware()->Container()->getParameter('ab_variant_disable.view_dir');
      }

    }
