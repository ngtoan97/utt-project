<?php

namespace App\Admin\Controllers;

use App\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\Category';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category());

        $grid->column('id', __('Id'));
        $grid->column('name', trans('message.category.name'));
        $grid->column('description',  trans('message.category.description'));
        $grid->column('created_at',  trans('message.created_at'))->date('Y-m-d H:i:s');
        $grid->column('updated_at',  trans('message.updated_at'))->date('Y-m-d H:i:s');

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Category::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name',  trans('message.category.name'));
        $show->field('description',  trans('message.category.description'));
        $show->field('created_at', trans('message.created_at'));
        $show->field('updated_at', trans('message.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Category());

        $form->text('name',  trans('message.category.name'))->required();
        $form->textarea('description', trans('message.category.description'))->required();

        return $form;
    }
}
