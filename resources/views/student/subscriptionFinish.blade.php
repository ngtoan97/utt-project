@extends('student.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.subscription_finish.subscription_finish') }}</div>
    <div class="card-body">
        @if ($cronJob && $subscriptionFinish)
            <div class="container contact">
                <div class="row">
                    <div class="col-md-6">
                        <div>
                            <h4><b>Subscription</b></h4>
                            <hr>
                        </div>
                        <div class="contact-info">
                            @if($subscriptionFinish->student->avatar)
                            <img src="{{ url('uploads/'.$subscriptionFinish->student->avatar) }}" alt="Avatar" class="img-thumbnail" style="width: 200px ;height: 200px"><br>
                            <hr>
                            @endif
                            <label><i class="far fa-address-card" style='font-size:14px;color:red'></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription_finish.student_name')}}</b>: {{ $subscriptionFinish->student->name  }}</label><br>
                            <label><i class="far fa-envelope"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.email')}}</b>: {{ $subscriptionFinish->student->email  }}</label><br>
                            <label><i class="fas fa-phone"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.phone_number')}}</b>: {{ $subscriptionFinish->student->phone_number  }}</label><br>
                            <label><i class="far fa-smile"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.class_code')}}</b>: {{ $subscriptionFinish->student->class_code  }}</label><br>
                            <label><i class="far fa-meh"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.student_code')}}</b>: {{ $subscriptionFinish->student->student_code  }}</label><br>
                            <label><i class="	fas fa-tag"></i></label> <label for="recipient-name" class="col-form-label"><b>Project {{trans('message.project.name')}}</b>: {{ $subscriptionFinish->project->name }}</label><br>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <h4><b>Teacher Information</b></h4>
                            <hr>

                        </div>
                        <div >
                            @if($subscriptionFinish->teacher->avatar)
                            <img src="{{ url('uploads/'.$subscriptionFinish->teacher->avatar) }}" alt="Avatar" class="img-thumbnail" style="width: 200px ;height: 200px"><br>
                                <hr>
                            @endif
                                <label><i class="far fa-address-card" style='font-size:14px;color:red'></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription_finish.teacher_name')}}</b>: {{ $subscriptionFinish->teacher->name  }}</label><br>
                                <label><i class="far fa-envelope"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.email')}}</b>: {{ $subscriptionFinish->teacher->email  }}</label><br>
                                <label><i class="fas fa-phone"></i></label>  <label for="recipient-name" class="col-form-label"><b>{{trans('message.phone_number')}}</b>: {{ $subscriptionFinish->teacher->phone_number  }}</label><br>
                                <label><i class="fas fa-school"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.speciality')}}</b>: {{ $subscriptionFinish->teacher->speciality  }}</label><br>
                        </div>

                    </div>
                </div>
            </div>
        @else
            <p class="text-danger">{{ trans('message.project.expired') }}.</p>
        @endif
    </div>
@endsection
