<?php

namespace App\Admin\Controllers;

use App\Category;
use App\Project;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProjectController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\Project';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Project());
        $grid->model()->orderBy('teacher_id', 'desc')->orderBy('updated_at', 'desc');

        $grid->column('id', __('Id'));
        $grid->column('name', trans('message.project.name'));
        $grid->column('number', trans('message.project.number'));
        $grid->status(trans('message.project.status'))->select([
            0 => trans('message.pending'),
            1 => trans('message.approve'),
            2 => trans('message.disapprove')
        ]);

        $grid->column('description', trans('message.project.description'));
        $grid->teacher()->name(trans('message.project.teacher_name'));
        $grid->categories(trans('message.topic'))->display(function ($categories) {

            $categories = array_map(function ($categories) {
                return "<span class='label label-success'>{$categories['name']}</span>";
            }, $categories);

            return join('&nbsp;', $categories);
        });
        $grid->column('created_at', trans('message.created_at'))->date('Y-m-d H:i:s');
        $grid->column('updated_at', trans('message.updated_at'))->date('Y-m-d H:i:s');
        $grid->filter(function($filter){
            $filter->column(1/2, function ($filter) {
                $filter->like('name', trans('message.project.name'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->in('status', trans('message.project.status'))->checkbox([
                    0 => trans('message.pending'),
                    1 => trans('message.approve'),
                    2 => trans('message.disapprove')
                ]);
            });
            $filter->between('created_at',trans('message.created_at'))->date();
        });


        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Project::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', trans('message.project.name'));
        $show->field('number', trans('message.project.number'));
        $show->field('status', trans('message.project.status'));
        $show->field('description', trans('message.project.description'));
        $show->field('teacher_id', trans('message.project.teacher_id'));
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
        $form = new Form(new Project());

        $form->text('name', trans('message.project.name'))->required();
        $form->number('number', trans('message.project.number'))->default(1)->required();
        $form->select('status', trans('message.project.status'))->options([
            0 => trans('message.pending'),
            1 => trans('message.approve'),
            2 => trans('message.disapprove')
        ]);
//        $form->multipleSelect('categories');
        $form->textarea('description', trans('message.project.description'))->required();
        $form->select('teacher_id', trans('message.project.teacher_name'))->options(User::where('type', 'Teacher')->get()->pluck('name', 'id'))->required();
        $form->multipleSelect('categories',trans('message.topic'))->options(Category::all()->pluck('name', 'id'))->required();

        return $form;
    }
}
