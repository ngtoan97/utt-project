<?php

namespace App\Admin\Controllers;

use App\CronJob;
use App\Mail\MailService;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CronJobController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\CronJob';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CronJob());

        $grid->column('id', __('Id'));
        $grid->column('model', trans('message.cronjob.model'))->using([
            0 => trans('message.cronjob.project'),
            1 => trans('message.cronjob.check_subscription'),
            2 => trans('message.cronjob.subscription')
        ]);
        $grid->column('description', trans('message.cronjob.description'));
        $grid->column('end_at',  trans('message.cronjob.end_at'));
        $grid->column('start_at',  trans('message.cronjob.start_at'));
        $isActive = [
            'on' => ['is_send_mail' => true, 'text' => 'Active', 'color' => 'success'],
            'off' => ['is_send_mail' => false, 'text' => 'Block', 'color' => 'danger'],
        ];
        $grid->column('is_send_mail',trans('message.cronjob.is_send_mail'))->switch($isActive);
        $grid->column('created_at',  trans('message.created_at'));
        $grid->column('updated_at',  trans('message.updated_at'));

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
        $show = new Show(CronJob::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('model', trans('message.cronjob.model'));
        $show->field('description', trans('message.cronjob.description'));
        $show->field('end_at',  trans('message.cronjob.end_at'));
        $show->field('start_at',  trans('message.cronjob.start_at'));
        $isActive = [
            'on' => ['is_active' => true, 'text' => 'Active', 'color' => 'success'],
            'off' => ['is_active' => false, 'text' => 'Block', 'color' => 'danger'],
        ];
        $show->switch('is_send_mail',trans('message.cronjob.is_send_mail'))->states($isActive);
        $show->field('created_at',  trans('message.created_at'));
        $show->field('updated_at',  trans('message.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CronJob());

//        $form->text('model', trans('message.cronjob.model'));
        $form->select('model', trans('message.cronjob.model'))->options([
            0 => trans('message.cronjob.project'),
            1 => trans('message.cronjob.check_subscription'),
            2 => trans('message.cronjob.subscription')
        ]);
        $form->text('description', trans('message.cronjob.description'))->required();
        $form->datetime('end_at',  trans('message.cronjob.end_at'))->default(date('Y-m-d H:i:s'))->required();
        $form->datetime('start_at', trans('message.cronjob.start_at'))->default(date('Y-m-d H:i:s'))->required();
        $isActive = [
            'on' => ['is_send_mail' => true, 'text' => 'Active', 'color' => 'success'],
            'off' => ['is_send_mail' => false, 'text' => 'Block', 'color' => 'danger'],
        ];
        $form->switch('is_send_mail',trans('message.cronjob.is_send_mail'))->states($isActive);
        $form->saving(function (Form $form) {
            if ($form->is_send_mail ==='on') {

                if ($form->model ==0)
                {

                    $teachers = User::where('type', 'Teacher')->get();
                    foreach ($teachers as $teacher)
                    {
                        MailService::sendMailNotification($teacher->email,$teacher->name,trans('message.project.notification').$form->start_at.trans('message.project.to').$form->end_at);
                    }
                }
                else if($form->model ==2)
                {
                    $students = User::where('type', 'Student')->get();
                    foreach ($students as $student)
                    {
                        MailService::sendMailNotification($student->email,$student->name,trans('message.project.project_register').$form->start_at.trans('message.project.to').$form->end_at);
                    }
                }
                else{
                    $teachers = User::where('type', 'Teacher')->get();
                    foreach ($teachers as $teacher)
                    {
                        MailService::sendMailNotification($teacher->email,$teacher->name,trans('message.project.subscription_check').$form->start_at.trans('message.project.to').$form->end_at);
                    }
                }
            }
        });

        return $form;
    }
}
