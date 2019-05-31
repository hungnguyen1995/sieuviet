<?php

namespace Website\Models;

use Phalcon\Mvc\Model;

use Website\Traits\Timestampable;
use Phalcon\Paginator\Factory;
use League\Fractal\Pagination\IlluminatePaginatorAdapter;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;


class Blog extends Model
{
    use Timestampable;

    public function initialize()
    {
        $this->setSource('blog');
        $this->belongsTo(
            'category_id',
            'Website\Models\Category',
            'id',
            ['alias' => 'category']
        );
    }

    public $id;
    public $name;
    public $category_id;
    public $avatar;

    public function createBlog($request)
    {
        $blog = new Blog();
        $blog->name = $request['name'];
        $blog->avatar = $request['avatar'];
        $blog->content = $request['content'];
        $blog->category_id = $request['category_id'];
        $blog->save();
        return $blog;
    }

    public function getBlogs()
    {

        $currentPage = (int)$_GET['page'];

        $builder = $this
            ->modelsManager
            ->createBuilder()
            ->from('Website\Models\Blog');

        $options = [
            'builder' => $builder,
            'limit' => 20,
            'page' => $currentPage,
            'adapter' => 'queryBuilder',
        ];


        $paginator = Factory::load($options)->getPaginate();
        return $paginator;
    }

    public function deleteBlog($id)
    {
        return Blog::findFirst($id)->delete();
    }

    public function showBlog($id)
    {
        return Blog::findFirst($id);
    }

    public function updateBlog($request, $id)
    {
        $blog = Blog::findFirst($id);
        $blog->name = $request['name'];
        $blog->avatar = $request['avatar'];
        $blog->content = $request['content'];
        $blog->category_id = $request['category_id'];
        $blog->save();
        return $blog;
    }


}