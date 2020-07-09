@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.subscription_finish.subscription_finish') }}</div>
    <div class="card-body">
        @if (count($subscriptionFinish) !==0 )
            <table class="table table-bordered table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>{{trans('message.subscription_finish.teacher_name')}}</th>
                    <th>{{trans('message.subscription_finish.student_name')}}</th>
                    <th>{{trans('message.subscription.project_name')}}</th>
                    <th>{{trans('message.subscription_finish.description')}}</th>
                    <th>{{trans('message.updated_at')}}</th>
                    <th>{{trans('message.action')}}</th>
                </tr>
                </thead>
                <tbody>
                @foreach( $subscriptionFinish as $subscription )
                    <tr class="tr-table">
                        <td>{{ $subscription->id }}</td>
                        <td>{{ $subscription->teacher->name }}</td>
                        <td>{{ $subscription->student->name }} </td>
                        <td>{{ $subscription->project->name_count }}</td>
                        <td>{{ $subscription->description }}</td>
                        <td>{{ ($subscription->updated_at)->format('Y:M:d - H:i:s') }}</td>
                        <th>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#idstudent{{ $subscription->student->id }}">
                                {{trans('message.action')}}
                            </button>
                        </th>
                        <div class="modal fade" id="idstudent{{ $subscription->student->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLongTitle"><b>{{ $subscription->student->name }}</b></h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            @if($subscription->student->avatar)
                                            <img src="{{ url('uploads/'.$subscription->student->avatar) }}" alt="Avatar" class="img-thumbnail" style="width: 200px ;height: 200px"><br>
                                            <hr>
                                            @endif
                                            <label><i class="far fa-address-card" style='font-size:14px;color:red'></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription_finish.student_name')}}</b>: {{ $subscription->student->name  }}</label><br>
                                            <label><i class="far fa-envelope"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.email')}}</b>: {{ $subscription->student->email  }}</label><br>
                                            <label><i class="fas fa-phone"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.phone_number')}}</b>: {{ $subscription->student->phone_number  }}</label><br>
                                            <label><i class="far fa-smile"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.class_code')}}</b>: {{ $subscription->student->class_code  }}</label><br>
                                            <label><i class="far fa-meh"></i></label> <label for="recipient-name" class="col-form-label"><b>{{trans('message.student_code')}}</b>: {{ $subscription->student->student_code  }}</label><br>
                                            <label><i class="	fas fa-tag"></i></label> <label for="recipient-name" class="col-form-label"><b>Project {{trans('message.subscription.project_name')}}</b>: {{ $subscription->project->name_count }}</label><br>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </tr>
                @endforeach
                </tbody>
            </table>
        @else
            <p>Not data</p>
        @endif
    </div>


@endsection
@section('script')

@endsection
