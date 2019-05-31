<?php

namespace Website\Models;

use Phalcon\Mvc\Model;


class Category extends Model
{
    public function beforeCreate()
    {
        $this->created_at = date('Y-m-d H:i:s');
    }

    public function beforeUpdate()
    {
        $this->updated_at = date('Y-m-d H:i:s');
    }

    public function initialize()
    {
        $this->setSource('category');
    }

    public $id;
    public $name;
    public $parent;

    public static function getCategories()
    {
        $categories = Category::query()->execute();
        return $categories;
    }

    public static function createCategory($request)
    {
        $category = new Category();
        $category->name = $request['name'];
        $category->parent = $request['parent'];
        return $category->save();
    }

    public static function deleteCategory($id)
    {
        $data = Category::findFirst($id);

        if (count($data->child) > 0) {
            return 'child';
        } elseif (count($data->blog) > 0) {
            return 'blog';
        } else {
            $data->delete();
            return 'ok';
        }
    }

    public static function showCategory($id)
    {
        return Category::findFirst($id);
    }

    public static function updateCategory($request, $id)
    {
        $category = Category::findFirst($id);
        $category->name = $request['name'];
        $category->parent = $request['parent'];
        return $category->save();
    }
}