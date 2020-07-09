<?php

namespace App\Http\Controllers;

use App\Project;
use App\Subscription;
use App\SubscriptionFinish;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FinishController extends DefaultController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $cronJob = $this->getCrojob(2);

        if (Auth::user()->type === 'Teacher') {
            $subscriptionFinish = SubscriptionFinish::where('teacher_id', Auth::id())->get();

            return view('teacher.subscriptionFinish', compact('subscriptionFinish'));
        }
        $subscriptionFinish = SubscriptionFinish::where('student_id', Auth::id())->first();

        return view('student.subscriptionFinish', compact('subscriptionFinish', 'cronJob'));
    }


    public function checkSubscriptionsFinish(Request $request, int $id)
    {
        $input                = $request->all();
        $subscription         = Subscription::find($id);
        $subscription->status = true;
        $subscription->update();
        if (isset($input['check-offer-student']) && $input['check-offer-student'] === 'on') {
            $project              = new Project();
            $project->name        = $input['project_name'];
            $project->number      = 1;
            $project->status      = 1;
            $project->description = $input['description'];
            $project->teacher_id  = $input['teacher_id'];

            $project->save();
            $input['project_id'] = $project->id;

        } else {
            $project             = Project::find($input['project_id']);
            $input['project_id'] = $project->id;

        }
        $finish                   = SubscriptionFinish::where('student_id', $subscription->student_id)->first();
        $input['teacher_id']      = $project->teacher_id;
        $input['student_id']      = $subscription->student_id;
        $input['subscription_id'] = $id;
        if ($finish) {
            $finish->update($input);
        } else {
            $finish = new SubscriptionFinish();
            $finish->create($input);
        }

        return back()->with(['message' => 'Updated Successfully']);
    }
}
