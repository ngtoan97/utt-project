<?php

namespace App\Admin\Controllers;

use App\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class CategoryCustomController extends AdminController
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
        $grid->column('name', __('Name'));
        $grid->column('number', __('Number'));
        $grid->column('description', __('Description'));
        $grid->column('teacher_id', __('Teacher id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show->field('name', __('Name'));
        $show->field('number', __('Number'));
        $show->field('description', __('Description'));
        $show->field('teacher_id', __('Teacher id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

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

        $form->text('name', __('Name'))->required();
        $form->number('number', __('Number'))->default(1)->required();
        $form->textarea('description', __('Description'))->required();
        $form->number('teacher_id', __('Teacher id'))->required();
        if ($form->isCreating()){
            $form->setAction(route('admin.category.create'));
        }
        else{

        }
        return $form;
    }

    public function insert(Request $request)
    {
        $category = Category::create($request->all());
        $category->save();
        return redirect(route('admin.category'));

    }
}
