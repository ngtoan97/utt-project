<?php

namespace App\Http\Controllers;

use App\Category;
use App\CronJob;
use App\Http\Resources\DataResource;
use App\Project;
use App\Subscription;
use App\SubscriptionFinish;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class ApiController extends Controller
{
    public function getListProjectApi(int $id)
    {
        $listProject = Project::join('users', 'projects.teacher_id', '=', 'users.id')->select('projects.*', 'users.name as teacherName')->where('projects.status', 1)->where('projects.id', '!=', $id)->get();

        return response()->json($listProject);
    }


    public function checkApiSubscriptions(Request $request)
    {
        $input        = $request->all();
        $subscription = Subscription::find($input['subscriptionId']);
        $subscription->status = true;
        $subscription->update();
        $finish                   = SubscriptionFinish::where('project_id', $subscription->option_one)->first();
        $input['teacher_id']      = $subscription->optionOne->teacher_id;
        $input['student_id']      = $subscription->student_id;
        $input['project_id']      = $subscription->option_one;

        $input['subscription_id'] = $subscription->id;
        $input['description']     = 'Teacher checked';

        if ($finish) {
            $subscriptionOlder = $finish->subscription;
            $subscriptionOlder->status = false;
            $subscriptionOlder->update();

            $finish->update($input);
        } else {
            $finish = new SubscriptionFinish();
            $finish->create($input);
        }

        return response()->json(['message' => 'Updated Successfully']);
    }

    public function getListCategories(Request $request)
    {
        $input = $request->all();
        $projects = array();
        if (isset($input['categoriesId']) && $input['categoriesId'])
        {
            $listId = $input['categoriesId'];
            $projects = Project::where('status',1)->whereHas('categories' , function($query) use ($listId) {
                $query->whereIn('category_id', $listId);
            })->get();
        }
        else{
            $projects = Project::where('status',1)->get();
        }


        return \App\Http\Resources\Project::collection($projects);
    }

    public function addCategories(Request $request)
    {
        $input = $request->all();
        $category = new Category();
        $category->name = $input['categoryName'];
        $category->description = $input['categoryDescription'];
        $category->save();

        return new DataResource(Category::all());
    }

}
