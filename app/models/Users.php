<?php

namespace Website\Models;

use Phalcon\Mvc\Model;
use Website\Traits\Timestampable;


class Users extends Model
{
    use Timestampable;
    public function initialize()
    {
        $this->setSource('users');
    }

    public $id;
    public $name;
    public $email;

    public function registerUser($request)
    {
        $user = new Users();
        $data = $user->save($request, ['email', 'name', 'password']);
        return $data;
    }

    public function findFirstByLogin($email)
    {
        $user = Users::query()
            ->where('email = :email:')
            ->bind(['email' => $email])
            ->execute()->getFirst();
        return $user;
    }

}