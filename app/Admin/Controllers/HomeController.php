<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Project;
use App\Subscription;
use App\SubscriptionFinish;
use App\User;
use Carbon\Carbon;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return Admin::content(function (Content $content) {
            $data                    = [];
            $colorData               = [$this->random_color(), $this->random_color(), $this->random_color(), $this->random_color(), $this->random_color(), $this->random_color()];
            $labelData               = [
                trans('message.total_student'),
                trans('message.total_teacher'),
                trans('message.total_project'),
                trans('message.total_project_approved'),
                trans('message.total_subscription'),
                trans('message.total_finish')
            ];
            $totalStudents           = count(User::where('type', 'Student')->where('is_active', 1)->get());
            $totalTeacher            = count(User::where('type', 'Teacher')->where('is_active', 1)->get());
            $totalProject            = count(Project::all());
            $totalProjectApproved    = count(Project::where('status', '1')->get());
            $totalSubscription       = count(Subscription::all());
            $totalSubscriptionFinish = count(SubscriptionFinish::all());
            $data                    = [
                $totalStudents,
                $totalTeacher,
                $totalProject,
                $totalProjectApproved,
                $totalSubscription,
                $totalSubscriptionFinish
            ];
            $content->header('Total of ');
            $content->description('.....');

            $content->body(view('admin.charts.bar')->with('data', $data)->with('colorData', $colorData)->with('labelData', $labelData));
        });
    }

    public function random_color()
    {
        return '#' . $this->random_color_part() . $this->random_color_part() . $this->random_color_part();
    }

    public function random_color_part()
    {
        return str_pad(dechex(mt_rand(0, 255)), 2, '0', STR_PAD_LEFT);
    }


    public function checkIsset($array, $item)
    {
        $isCheck  = false;
        $keyArray = 0;
        foreach ($array as $key => $element) {
            if (empty($array) == false) {
                if ($element === $item) {
                    $isCheck  = true;
                    $keyArray = $key;
                }
            }

        }
        if ($isCheck) {
            return $keyArray;
        } else {
            return -1;
        }

    }



//    public function index(Content $content)
//    {
    //        return $content
//            ->title('Dashboard')
//            ->description('Description...')
//            ->row(Dashboard::title())
//            ->row(function (Row $row) {
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::environment());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::extensions());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::dependencies());
//                });
//            });
//    }
}
