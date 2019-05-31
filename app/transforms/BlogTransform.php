<?php

namespace Website\Transforms;
use League\Fractal;

class BlogTransform extends Fractal\TransformerAbstract
{
    public function transform($item)
    {
        return  $item;
    }
}