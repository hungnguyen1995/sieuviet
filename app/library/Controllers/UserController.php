<?php

namespace Website\Controllers;

use Website\Controller as WController;
use Website\Forms\LoginRegisterForm;
use Website\Models\Users;
use Website\Validators\RegisterUserRequest;
use Website\Validators\LoginUserRequest;

class UserController extends WController
{
    protected $user;

    public function onConstruct()
    {
      // do nothing
    }

    public function logoutAction()
    {
        $this->session->remove('auth');
        return $this->response->redirect('/login');
    }

    public function postRegisterAction()
    {
        $request = $this->request->getPost();
        $request['password'] = md5('SV@'.$request['password']);


        //validation field
        $validation = new RegisterUserRequest();
        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        } else {
            Users::RegisterUser($request);
            $this->flashSession->success('SignUp Success');
            return $this->response->redirect('/login');
        }
    }

    public function getLoginAction()
    {
        if ($this->auth->check()) {
            return $this->response->redirect('/');
        }

        return $this->viewSimple->render('user/login');
    }

    public function getSignUpAction()
    {
        if ($this->auth->check()) {
            return $this->response->redirect('/');
        }
        return $this->viewSimple->render('user/signup');
    }

    public function postLoginAction()
    {
        $request = $this->request->getPost();
        $validation = new LoginUserRequest();
        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        } else {
            $user = Users::findFirstByLogin($request['email']);
            if ($user) {
                if (md5('SV@'.$request['password']) == $user->password) {
                    $this->flashSession->success('Đăng nhập thành công ');
                    $this->session->set('auth', $user);
                    return $this->response->redirect('/');
                } else {
                    $this->flashSession->error('Đăng nhập thất bại ! ');
                    return $this->response->redirect('/login');
                }
            } else {
                $this->flashSession->error('Đăng nhập thất bại !');
                return $this->response->redirect('/login');

            }
        }
    }
}
