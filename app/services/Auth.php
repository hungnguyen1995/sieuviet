<?php

namespace Website\Services;

class Auth extends \Phalcon\Di\Injectable
{

    // Add vào Ịnectable
    public function check($name = 'auth')
    {
        return $this->session->has($name);
    }

    public function user($name = 'auth')
    {
        return $this->session->get($name);
    }

}
