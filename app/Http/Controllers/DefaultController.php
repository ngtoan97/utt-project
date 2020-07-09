<?php

namespace App\Http\Controllers;

use App\Category;
use App\CronJob;
use App\Http\Requests\InfomationRequest;
use App\Http\Requests\ProjectRequest;
use App\Http\Requests\SubscriptionRequest;
use App\Project;
use App\Subscription;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Input;

class DefaultController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function changeLang(string $lang)
    {
        $language = config('app.locale');
        if ($lang === 'en') {
            $language = 'en';
        }
        if ($lang === 'vn') {
            $language = 'vn';
        }
        Session::put('language', $language);

        return redirect()->back();

    }

    /**
     * Show the application dashboard.
     *
     */
    public function getInformation()
    {
        $information = Auth::user();

        if (Auth::user()->type === 'Teacher') {
            return view('teacher.information', compact('information'));
        }

        return view('student.information', compact('information'));

    }

    public function updateInformation(InfomationRequest $request)
    {
        $user  = Auth::user();
        $input = $request->all();
        if ($input['password'] !== null) {
            $input['password'] = bcrypt($input['password']);
        } else {
            unset($input['password']);
        }
        if ($request->hasFile('avatar')) {
            $file = $request->avatar;
            $file->move('uploads/images', $file->getClientOriginalName());
            $input['avatar'] = 'images/' . $file->getClientOriginalName();
        }


        $user->update($input);

        return back()->with('message', trans('message.update'));
    }

    public function getListProject(Request $request)
    {
        if (Auth::user()->type === 'Teacher') {
            $cronJob     = $this->getCrojob(0);
            $listProject = Project::where('teacher_id', Auth::user()->id)->get();

            return view('teacher.listProject', compact('listProject', 'cronJob'));

        }
        $cronJob     = $this->getCrojob(2);
        $listProject = Project::paginate(20);
        $category    = $request->input('category');
        if ($category) {
            $category    = Category::find($category);
            $listProject = $category->projects;
        }


        return view('student.listProject', compact('listProject', 'cronJob'));

    }

    public function createProject()
    {
        $cronJob    = $this->getCrojob();
        $students   = $this->getStudents();
        $categories = Category::all();

        return view('teacher.createProject', compact('cronJob', 'categories', 'students'));
    }

    public function storeProject(ProjectRequest $request)
    {
        $input               = $request->all();
        $input['status']     = 0;
        $input['teacher_id'] = Auth::id();


        $project = new Project();
        $project = $project->create($input);
        if (isset($input['students'])) {
            foreach ($input['students'] as $idStudent) {
                $subscription              = new Subscription();
                $subscription->option_one  = $project->id;
                $subscription->option_two  = $project->id;
                $subscription->student_id  = $idStudent;
                $subscription->description = 'Giảng viên ' . Auth::user()->name . ' chỉ định';
                $subscription->save();
            }
        }
//        $category            = Category::find($input['category']);
        $project->categories()->sync($input['category']);

        return redirect()->route('listProject.index');
    }

    public function deleteProject(int $id)
    {
        $project = Project::find($id)->delete();

        return back()->with(['message' => trans('message.delete_noti')]);
    }

    public function editProject(int $id)
    {
        $project       = Project::find($id);
        $cronJob       = $this->getCrojob();
        $categories    = Category::all();
        $students      = $this->getStudents();
        $studentChoice = array();
        foreach ($project->optionOne as $subscription) {
            $studentChoice[] = $subscription->student->id;
        }

        $select = $project->categories->pluck('id')->toArray();

        return view('teacher.editProject', compact('project', 'cronJob', 'categories', 'select', 'students', 'studentChoice'));

    }

    public function updateProject(ProjectRequest $request, int $id)
    {
        $input   = $request->all();
        $project = Project::find($id);
        isset($input['category']) ? $project->categories()->sync($input['category']) : null;

        $subscription = Subscription::where('option_one', $id)->delete();

        if (isset($input['students'])) {
            foreach ($input['students'] as $idStudent) {
                $subscription = Subscription::where('student_id', $idStudent)->first();
                if ( ! $subscription) {
                    $sub              = new Subscription();
                    $sub->option_one  = $project->id;
                    $sub->option_two  = $project->id;
                    $sub->student_id  = $idStudent;
                    $sub->description = 'Giảng viên ' . Auth::user()->name . ' chỉ định';
                    $sub->save();
                }
            }
        }
        $project->update($input);

        return redirect()->route('listProject.index');
    }

    public function getSubscriptions()
    {
        $categories = Category::all();

        if (Auth::user()->type === 'Teacher') {
            $cronJob           = $this->getCrojob(1);
            $listSubscriptions = new Collection();
            $projects          = Project::where('teacher_id', Auth::id())->get();
            foreach ($projects as $project) {
                $subscription      = $project->optionOne;
                $listSubscriptions = $listSubscriptions->merge($subscription);
            }

            $listSubscriptions = $listSubscriptions->sortBy('updated_at,option_one');

            return view('teacher.listSubscriptions', compact('listSubscriptions', 'cronJob'));
        }
        $cronJob      = $this->getCrojob(2);
        $listProject  = Project::where('status', 1)->get();
        $subscription = Subscription::where('student_id', Auth::id())->first();
        if ($subscription) {
            return view('student.subscriptionsUpdate', compact('listProject', 'cronJob', 'subscription', 'categories'));
        }

        return view('student.subscriptions', compact('listProject', 'cronJob', 'categories'));
    }

    public function getSubscriptionsOptionTwo()
    {
        $cronJob = $this->getCrojob(1);
        if (Auth::user()->type === 'Teacher') {
            $listSubscriptions = new Collection();
            $projects          = Project::where('teacher_id', Auth::id())->get();
            foreach ($projects as $project) {
                $subscription      = $project->optionTwo;
                $listSubscriptions = $listSubscriptions->merge($subscription);
            }

            $listSubscriptions = $listSubscriptions->sortBy('updated_at,option_one');

            return view('teacher.listSubscriptions', compact('listSubscriptions', 'cronJob'));
        }
    }

    public function getSubscriptionsStore(SubscriptionRequest $request)
    {
        $input               = $request->all();
        $input['student_id'] = Auth::id();

        $subscription = new Subscription();
        $subscription = $subscription->create($input);
        $subscription->categories()->sync($input['category'] ?? null);


        return back()->with(['message' => 'Created Subscription Successfully']);;
    }


    public function getSubscriptionsUpdate(SubscriptionRequest $request, int $id)
    {
        $input = $request->all();

        $subscription = Subscription::find($id);
        isset($input['category']) ? $subscription->categories()->sync($input['category']) : null;

        $subscription = $subscription->update($input);

        return back()->with(['message' => 'Update Subscription Successfully']);
    }

    public function getCrojob($model = 0)
    {
        $now = (new \DateTime(null, new \DateTimeZone('Asia/Ho_Chi_Minh')))->format('Y-m-d H:i:s');

        return CronJob::where('model', $model)
                      ->where('start_at', '<=', $now)->where('end_at', '>=', $now)
                      ->first();
    }

    public function getListTeachers()
    {
        $teachers = User::where('type', 'Teacher')->where('is_active', 1)->get();

        return view('student.listTeachers', compact('teachers'));
    }

    public function getStudents()
    {
        return User::where('type', 'Student')->where('is_active', 1)->get();
    }
}
