<?php

namespace Website\Controllers;

use Website\Controllers\AdminController as Admin;
use Website\Models\Blog;
use Website\Models\Category;
use Website\Validators\StoreBlogRequest;
use Website\Validators\UpdateBlogRequest;


class BlogController extends Admin
{
    public function onConstruct()
    {
        parent::onConstruct();
        $this->blog = new Blog();
        $this->category = new Category();
    }

    public function createBlogAction()
    {
        $categories = $this->category->getCategories();
        if (count($categories) == 0) {
            return $this->response->redirect('/blog/category/create');
        }
        $this->viewSimple->categories = $categories;
        return $this->viewSimple->render('blog/create');
    }
    /*
     * Post Blog
     */
    public function storeBlogAction()
    {
        $request = $this->request->getPost();
        $validation = new StoreBlogRequest();
        if ($this->request->hasFiles('avatar')) {
            $request = array_merge($request, $_FILES);
            $validation->checkFileImage();
        }

        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        }
        if ($this->request->hasFiles('avatar')) {
            $month = date('M');
            if (!file_exists('upload/' . $month . '/')) {
                mkdir('upload/' . $month, 0777);
            }
            $path = 'upload/' . $month . '/' . date('h-i-s') . '-' . $this->request->getUploadedFiles('avatar')[0]->getName();
            $upload = $this->request->getUploadedFiles('avatar')[0]->moveTo($path);

        }
        $upload ? $request['avatar'] = $path : null;

        $data = $this->blog->createBlog($request);
        if ($data) {
            $this->flashSession->success('Create Success');
            return $this->response->redirect('/blog/list');
        }
    }

    /*
     * Update BLog
     */

    public function updateBlogAction($id)
    {
        $request = $this->request->getPost();
        $validation = new UpdateBlogRequest();
        if ($this->request->hasFiles('avatar')) {
            $request = array_merge($request, $_FILES);
            $validation->checkFileImage();
        }

        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        }
        if ($this->request->hasFiles('avatar')) {
            $month = date('M');
            if (!file_exists('upload/' . $month . '/')) {
                mkdir('upload/' . $month, 0777);
            }
            $path = 'upload/' . $month . '/' . date('h-i-s') . '-' . $this->request->getUploadedFiles('avatar')[0]->getName();
            $this->request->getUploadedFiles('avatar')[0]->moveTo($path);
            $request['avatar'] = $path;
        } else {
            $request['avatar'] = $request['oldavatar'];
        }
        $data = $this->blog->updateBlog($request, $id);
        if ($data) {
            $this->flashSession->success('Update Success');
            return $this->response->redirect('/blog/list');
        }
    }

    public function listBlogAction()
    {
        $categories = $this->category->getCategories();
        foreach ($categories as $category) {
            $pluck[$category->id] = $category->name;
        }
        $this->viewSimple->categories = $pluck;
        $blog = $this->blog->getBlogs();
        $this->viewSimple->blogs = $blog;
        return $this->viewSimple->render('blog/list');
    }

    /*
     * Delete block
     */

    public function destroyBlogAction($id)
    {
        if ($this->blog->deleteBlog($id)) {
            return $this->response->setJsonContent('delete success')->setStatusCode(200);
        }
    }

    public function editBlogAction($id)
    {
        $this->viewSimple->categories = $this->category->getCategories();
        $this->viewSimple->data = $this->blog->showBlog($id);
        return $this->viewSimple->render('blog/edit');
    }
}


