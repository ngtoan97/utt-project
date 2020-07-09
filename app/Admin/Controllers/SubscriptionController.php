<?php

namespace App\Admin\Controllers;

use App\Category;
use App\Project;
use App\Subscription;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class SubscriptionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\Subscription';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Subscription());

        $grid->column('id', __('Id'));
        $grid->optionOne()->name_count(trans('message.subscription.option_one'))->modal('Project Finish',function ($model) {

            $projects= $model->optionOne->finish->map(function ($finish) {
                return [
                    'id'=>$finish->id,
                    'teacher_name'=>$finish->teacher->name,
                    'student_name'=>$finish->student->name,
                    'project_name'=>$finish->project->name,
                    'description'=>$finish->description
                ];
            });
            return new Table([
                'ID',
                trans('message.subscription_finish.teacher_name'),
                trans('message.subscription_finish.student_name'),
                trans('message.subscription_finish.project_name'),
                trans('message.subscription_finish.description')
            ], $projects->toArray());

        });
        $grid->optionTwo()->name_count(trans('message.subscription.option_two'))->modal('Project Finish',function ($model) {

            $projects= $model->optionTwo->finish->map(function ($finish) {
                return [
                    'id'=>$finish->id,
                    'teacher_name'=>$finish->teacher->name,
                    'student_name'=>$finish->student->name,
                    'project_name'=>$finish->project->name,
                    'description'=>$finish->description
                ];
            });
            return new Table([
                'ID',
                trans('message.subscription_finish.teacher_name'),
                trans('message.subscription_finish.student_name'),
                trans('message.subscription_finish.project_name'),
                trans('message.subscription_finish.description')
            ], $projects->toArray());

        });
        $grid->student()->name(trans('message.subscription.student_name'));
        $grid->column('offer_project', trans('message.subscription.offer'));
        $grid->column('description', trans('message.subscription.description'));
        $grid->categories(trans('message.topic'))->display(function ($categories) {

            $categories = array_map(function ($categories) {
                return "<span class='label label-success'>{$categories['name']}</span>";
            }, $categories);

            return join('&nbsp;', $categories);
        });
        $grid->column('status')->bool();
        $grid->column('created_at', trans('message.created_at'))->date('Y-m-d H:i:s');
        $grid->column('updated_at', trans('message.updated_at'))->date('Y-m-d H:i:s');

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
        $show = new Show(Subscription::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('option_one',trans('message.subscription.option_one'));
        $show->field('option_two',trans('message.subscription.option_two'));
        $show->field('student_id',trans('message.subscription.student_id'));
        $show->field('offer_project',trans('message.subscription.offer'));
        $show->field('description',trans('message.subscription.description'));
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
        $form = new Form(new Subscription());

        $form->select('option_one',trans('message.subscription.option_one'))->options(Project::all()->pluck('name_count','id'))->required();
        $form->select('option_two', trans('message.subscription.option_two'))->options(Project::all()->pluck('name_count','id'))->required();
        $form->select('student_id',trans('message.subscription.student_name'))->options(User::where('type','Student')->get()->pluck('name','id'))->required();
        $form->text('offer_project', trans('message.subscription.offer'))->required();
        $form->textarea('description', trans('message.subscription.description'))->required();
        $form->multipleSelect('categories',trans('message.topic'))->options(Category::all()->pluck('name', 'id'))->required();

        return $form;
    }
}
