<?php
namespace Website\validators;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Website\Models\Category;
class StoreCategoryRequest extends Validation
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
            'name',
            new Uniqueness(
                [
                    "model"   => new Category(),
                    "message" => ":field must be unique",

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
