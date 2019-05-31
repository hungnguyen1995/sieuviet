<?php

namespace Website\Controllers;

use Website\Controllers\AdminController;


/**
 * Class IndexController
 *
 * @package Website\Controllers
 *
 * @property \Phalcon\Registry $registry
 */
class IndexController extends AdminController
{
    public function indexAction()
    {




        return $this->viewSimple->render('index/index');
    }


}
