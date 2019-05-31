<?php
namespace Website\validators;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;

class UpdateCategoryRequest extends Validation
{
    public function initialize()
    {

        $this->add(
            'name',
            new PresenceOf(
                [
                    'message' => 'The name is required',
                ]
            )
        );


        $this->add(
            'parent',
            new PresenceOf(
                [
                    'message' => 'The name is required',
                ]
            )
        );


    }


}
