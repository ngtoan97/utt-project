<?php

namespace App\Admin\Controllers;

use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class StudentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Students';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('id', __('Id'))->filter();
        $grid->column('name', trans('message.full_name'));
        $grid->column('email',  trans('message.email'));
        $grid->column('avatar', 'Avatar')->image(null, 100,100);
        $grid->column('phone_number',  trans('message.phone_number'));
        $grid->column('student_code', trans('message.student_code'));
        $grid->column('class_code',   trans('message.student_code'));
        $grid->column('type',  trans('message.type'));
        $grid->column('gender',  trans('message.gender'));
        $grid->column('birth_day',  trans('message.gender'));
        $isActive = [
            'on' => ['is_active' => true, 'text' => 'Active', 'color' => 'success'],
            'off' => ['is_active' => false, 'text' => 'Block', 'color' => 'danger'],
        ];
        $grid->column('is_active')->switch($isActive);

        $grid->column('created_at',  trans('message.created_at'))->date('Y-m-d H:i:s');
        $grid->column('updated_at',  trans('message.updated_at'))->date('Y-m-d H:i:s');
        $grid->tools(function ($tools) {
            $tools->append("<a href='/admin/import/show' class='btn btn-sm btn-success'>Import</a>");
        });

        $grid->model()->where('type','student');
        $grid->filter(function($filter){
            $filter->column(1/2, function ($filter) {
                $filter->like('name', trans('message.full_name'));
                $filter->like('email', trans('message.email'));
                $filter->like('phone_number', trans('message.phone_number'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->like('student_code',  trans('message.student_code'));
                $filter->like('class_code',  trans('message.class_code'));
                $filter->in('gender', trans('message.gender'))->checkbox([
                    'male'    => 'Male',
                    'female'    => 'Female',
                ]);
                $filter->equal('birth_day', trans('message.birth_day'))->date();
            });


        });

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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', trans('message.full_name'));
        $show->field('email',  trans('message.email'));
        $show->field('phone_number',  trans('message.phone_number'));
        $show->field('student_code',  trans('message.student_code'));
        $show->field('class_code',  trans('message.class_code'));
        $show->field('type',  trans('message.type'));
        $show->field('gender', trans('message.gender'));
        $show->field('birth_day', trans('message.birth_day'));
        $show->field('is_active',  trans('message.is_active'));
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
        $form = new Form(new User());

        $form->text('name',  trans('message.full_name'))->required();
//        $form->email('email',  trans('message.email'))->required();
        $form->email('email', trans('message.email'))
             ->creationRules(['required', "unique:users"])
             ->updateRules(['required', "unique:users,email,{{id}}"]);
        $form->text('phone_number',  trans('message.phone_number'))
             ->creationRules(['required', "unique:users"])
             ->updateRules(['required', "unique:users,phone_number,{{id}}"]);
        $form->image('avatar','Avatar');
        $form->text('student_code',  trans('message.student_code'))
            ->creationRules(['required', "unique:users"])
            ->updateRules(['required', "unique:users,student_code,{{id}}"]);
        $form->text('class_code',  trans('message.class_code'))->required();
        $form->text('type', trans('message.type'))->value('Student')->readonly();
        $form->radio('gender', trans('message.gender'))->options([
            'female' => trans('message.female'),
            'male'   => trans('message.male'),
            'other'  => trans('message.other')
        ]);
        $form->date('birth_day', trans('message.birth_day'))->required();
        $form->password('password', trans('message.password'))->required();
        $isActive = [
            'on' => ['is_active' => true, 'text' => 'Active', 'color' => 'success'],
            'off' => ['is_active' => false, 'text' => 'Block', 'color' => 'danger'],
        ];
        $form->switch('is_active',trans('message.is_active'))->states($isActive);

        $form->saving(function (Form $form) {
            $user = User::find( $form->model()->id);
            if ($form->password && $user->password != $form->password) {
                $form->password =  bcrypt($form->password);
            }
        });
        return $form;
    }

    public function insert(Request $request)
    {

        $input             = $request->all();
        $input['password'] = bcrypt($input['password']);
        User::create($input);

        return redirect()->route('students.index')->with('message', 'Create teacher successfully');
    }
}
