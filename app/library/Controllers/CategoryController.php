<?php

namespace Website\Controllers;

use Website\Controllers\AdminController as Admin;
use Website\Models\Category;
use Website\Validators\StoreCategoryRequest;
use Website\Validators\UpdateCategoryRequest;
use Website\Services\recursion;

class CategoryController extends Admin
{
    public function onConstruct()
    {
        parent::onConstruct();
    }

    public function createCategoryAction()
    {
        $categories = Category::getCategories();
        $this->viewSimple->categories = $categories;
        return $this->viewSimple->render('category/create');
    }

    public function storeCategoryAction()
    {
        $request = $this->request->getPost();
        $validation = new StoreCategoryRequest();
        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        }
        Category::createCategory($request);
        $this->flashSession->success('Create Success');
        return $this->response->redirect('/blog/category/list');
    }

    public function updateCategoryAction($id)
    {
        $request = $this->request->getPost();
        $validation = new UpdateCategoryRequest();
        $messages = $validation->validate($request);
        $mes = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $mes .= $message . '  ';
            }
            $this->flashSession->error($mes);
            return $this->response->redirect($this->request->getHTTPReferer());
        }
        Category::updateCategory($request, $id);
        $this->flashSession->success('Update Success');
        return $this->response->redirect('/blog/category/list');
    }

    public function listCategoryAction()
    {

        $categories = Category::getCategories()->toArray();
        $this->viewSimple->categories = Recursion::recursion($categories);
        return $this->viewSimple->render('category/list');
    }

    public function destroyCategoryAction($id)
    {
        $data = Category::deleteCategory($id);
        if ($data == 'child') {
            return $this->response->setJsonContent('delete fail - exist child')->setStatusCode(400);
        } elseif ($data == 'blog') {
            return $this->response->setJsonContent('delete fail - exist blog in category')->setStatusCode(400);
        } else {
            return $this->response->setJsonContent($data)->setStatusCode(200);
        }
    }

    public function editCategoryAction($id)
    {
        $data = Category::showCategory($id);
        if ($data) {
            $this->viewSimple->categories = Category::getCategories();
            $this->viewSimple->data = $data;
            return $this->viewSimple->render('category/edit');
        }
    }

}
