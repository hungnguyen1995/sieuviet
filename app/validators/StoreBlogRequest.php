<?php

namespace Website\validators;

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\File as FileValidator;

class StoreBlogRequest extends Validation
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
            'category_id',
            new PresenceOf(
                [
                    'message' => 'The category_id is required',
                ]
            )
        );
        $this->add(
            'content',
            new PresenceOf(
                [
                    'message' => 'The content is required',
                ]
            )
        );


    }

    public function checkFileImage()
    {
        $this->add(
            "avatar",
            new FileValidator(
                [
                    "maxSize" => "2M",
                    "messageSize" => ":field exceeds the max filesize (:max)",
                    "allowedTypes" => [
                        "image/jpeg",
                        "image/png",
                    ]
                ]
            )
        );
    }


}
