@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.subscription.list_subscriptions') }}
        {{ request()->is('list-subscriptions/option_one')?trans('message.subscription.option_one'): trans('message.subscription.option_two')}}
    </div>
    <div class="card-body">
            <a href="{{ route('listSubscriptions.index') }}"><button class="btn btn-success">{{ trans('message.subscription.option_one') }}</button></a>
            <a href="{{ route('listSubscriptions.optionTwo') }}"><button class="btn btn-success">{{ trans('message.subscription.option_two') }}</button></a>
            <div class="col-xl">
                <div class="contact-info">
                    @if($cronJob)
                    <p class="text-danger">{{ trans('message.project.subscription_check') }}{{$cronJob->start_at}}{{ trans('message.project.to')}}{{$cronJob->end_at}}.</p>
                @else
                        <p class="text-danger">{{ trans('message.project.expired') }}.</p>
                    @endif
                </div>
            </div>
        @if (count($listSubscriptions) !==0 )
        <table class="table table-bordered table-striped table-hover">
                     <thead>
                <tr>
                    <th>ID</th>
                    <th>{{trans('message.subscription.option_one')}}</th>
                    <th>{{trans('message.subscription.option_two')}}</th>
                    <th>{{trans('message.subscription.student_name')}}</th>
                    <th>{{trans('message.subscription.offer')}}</th>
                    <th>{{trans('message.subscription.description')}}</th>
                    <th>{{trans('message.subscription.update')}}</th>
                    @if($cronJob  && request()->is('list-subscriptions/option_one'))
                        <th>Action</th>
                    @endif
                </tr>
                </thead>
                <tbody>
                @foreach( $listSubscriptions as $subscription )
                    <tr class="tr-table">
                        <td>{{ $subscription->id }}</td>
                        <td><b>{{ $subscription->optionOne->name_count }}</b> - {{ $subscription->optionOne->teacher->name }}</td>
                        <td><b>{{ $subscription->optionTwo->name_count }}</b> - {{ $subscription->optionTwo->teacher->name }}</td>
                        <td>
                            <a href = ""data-toggle="modal" data-target="#idstudent{{ $subscription->student->id }}">
                                <b>{{ $subscription->student->name }} - {{ $subscription->student->student_code}}</b>
                            </a>

                        </td>
                        <td>{{ $subscription->offer_project }}</td>
                        <td>{{ $subscription->description }}</td>
                        <td>{{ ($subscription->updated_at)->format('Y:M:d - H:i:s') }}</td>

                        @if($cronJob && request()->is('list-subscriptions/option_one') )

                            <td>
                                <input class="choice_student col-xl" type="radio" name="choice_student_{{$subscription->option_one  }}" id="choice_student_{{$subscription->option_one  }}" value="{{ $subscription->id }}"
                                    {{ $subscription->subscriptionFinish?'checked':'' }}
                                />
                            </td>
                        @endif
                    </tr>

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
                                        <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription_finish.student_name')}}</b>: {{ $subscription->student->name  }}</label><br>
                                        <label for="recipient-name" class="col-form-label"><b>{{trans('message.email')}}</b>: {{ $subscription->student->email  }}</label><br>
                                        <label for="recipient-name" class="col-form-label"><b>{{trans('message.phone_number')}}</b>: {{ $subscription->student->phone_number  }}</label><br>
                                        <label for="recipient-name" class="col-form-label"><b>{{trans('message.class_code')}}</b>: {{ $subscription->student->class_code  }}</label><br>
                                        <label for="recipient-name" class="col-form-label"><b>{{trans('message.student_code')}}</b>: {{ $subscription->student->student_code  }}</label><br>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                </tbody>
            </table>
        @else
            <p>Not data</p>
        @endif
    </div>
@endsection
@section('script')
    <script>
        $(document).ready(function () {
            $('.choice_student').change(function () {
                $('.card-body').append('<div style=" position: absolute;  padding-top: 30%; " class="loading-api w-100 h-100 text-center fixed-top mx-auto">' +
                                            '<div  class="spinner-border" role="status" style=" position: absolute;">' +
                                        '  <span  class="sr-only">Loading...</span>' +
                                        '</div></div>');
                var value = $(this).val();
                console.log(value);
                if (confirm("Are you sure?")) {
                    $.ajax({
                        method: "POST",
                        url: '/api/list-subscriptions/check',
                        data : {
                            'subscriptionId': value
                        },
                        success: function (response) {
                            $('.loading-api').remove();
                            console.log(response)
                        }
                    });
                }
                $('.loading-api').remove();
            });
        })
    </script>
@endsection
