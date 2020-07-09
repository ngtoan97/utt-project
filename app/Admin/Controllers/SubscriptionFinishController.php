<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\SubscriptionFinishExporter;
use App\Project;
use App\SubscriptionFinish;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SubscriptionFinishController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Subscription Finish';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SubscriptionFinish());

        $grid->column('id', __('Id'));
        $grid->column('teacher_name',trans('message.subscription_finish.teacher_name'));
        $grid->column('student_name',trans('message.subscription_finish.student_name'));
        $grid->project()->name_count(trans('message.subscription_finish.project_name'));
        $grid->column('description',trans('message.subscription_finish.description'));
        $grid->column('created_at', trans('message.created_at'))->date('Y-m-d H:i:s');
        $grid->column('updated_at', trans('message.updated_at'))->date('Y-m-d H:i:s');
        $grid->exporter(new SubscriptionFinishExporter());

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
        $show = new Show(SubscriptionFinish::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('teacher_id',trans('message.subscription_finish.teacher_name'))->label();
        $show->field('student_id', trans('message.subscription_finish.student_name'));
        $show->field('project_id', trans('message.subscription_finish.project_name'));
        $show->field('description', trans('message.subscription_finish.description'));
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
        $form = new Form(new SubscriptionFinish());

        $form->select('teacher_id',trans('message.subscription_finish.teacher_name'))->options(User::where('type','Teacher')->get()->pluck('name','id'))->required();
        $form->select('student_id',trans('message.subscription_finish.student_name'))->options(User::where('type','Student')->get()->pluck('name','id'))->required();
        $form->select('project_id',trans('message.subscription_finish.project_name'))->options(Project::all()->pluck('name_count','id'))->required();
        $form->text('description', trans('message.subscription_finish.description'))->required();

        return $form;
    }
}
