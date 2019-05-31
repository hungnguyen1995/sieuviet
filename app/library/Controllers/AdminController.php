<?php

namespace Website\Controllers;
use Website\Services\Auth;

class AdminController extends BaseController
{
    public function onConstruct()
    {
        //check nếu chưa đăng nhập
        if (!$this->auth->check()) {
            return $this->response->redirect('/login');
        }
    }





}