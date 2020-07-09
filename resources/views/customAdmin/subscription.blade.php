
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg-{{ $model->id }}">Active</button>
<!-- Modal -->
<div class="modal fade bd-example-modal-lg-{{ $model->id }}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="{{ route('listFinish.create',$model->id) }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle"><b>{{ $model->student->name  }}</b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label><h4>{{trans('message.info')}}</h4></label> <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.student_name')}}</b></label>: {{ $model->student->name  }}<br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.student_name')}}</b></label>: {{ $model->student->class_code  }}<br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.student_name')}}</b></label>: {{ $model->student->student_code  }}<br>
                            <label><h4>{{trans('message.subscription.option_one')}}</h4></label> <br>
                            <label for="recipient-name" class="col-form-label"><b>ID</b></label>: {{ $model->optionOne->id  }} <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.project.name')}}</b></label>: {{ $model->optionOne->name_count  }} <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.teacher.name')}}</b></label>: {{ $model->optionOne->teacher->name  }} <br>
                            <label><h4>{{trans('message.subscription.option_two')}}</h4></label> <br>
                            <label for="recipient-name" class="col-form-label"><b>ID</b></label>: {{ $model->optionTwo->id  }} <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.project.name')}}</b></label>: {{ $model->optionTwo->name_count  }} <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.student_name')}}</b></label>: {{ $model->student->name  }}<br>
                            <label><h4>{{trans('message.subscription.offer')}}</h4></label> <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.offer')}}</b></label>: {{ $model->offer_project  }} <br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.subscription.description')}}</b></label>: {{ $model->description  }}<br>
                            <label for="recipient-name" class="col-form-label"><b>{{trans('message.topic')}}</b></label>:
                            @foreach($model->categories as $category)
                                <span class='label label-success'>{{ $category->name }}</span>
                            @endforeach
                            <br>

                        </div>
                        <div class="col-md-6 ml-auto">
                            <div class="form-group">
                            <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                <input type="checkbox" class="custom-control-input check-offer-student" id="check-offer-student" name="check-offer-student">
                                <label class="custom-control-label" for="customControlInline">{{ trans('message.use_offer') }}</label>
                            </div>
                            </div>
{{--                                <button type="button"   class='btn btn-success'>{{ $category->name }}</button>--}}
                            <div class="form-group">
                                <label class="control-label" for="fname"><b>{{ trans('message.subscription_finish.find_by') }}</b></label>
                                <div class="form-check form-check-inline">
                                    @foreach(\App\Category::all() as $category)
                                    <input class="form-check-input categories-select-{{$model->id}}" type="checkbox" id="categories-{{ $model->id.$category->id}}" name="categoryId" value="{{ $category->id }}">
                                    <span class="form-check-label" for="inlineCheckbox1">{{ $category->name }}</span>
                                    @endforeach
                                </div>
                            </div>
                            @csrf
                                <div class = "project_subscription">
                                    <div class="form-group">
                                        <label class="control-label" for="fname"><b>{{ trans('message.subscription_finish.project_name') }}</b></label>
                                        {{--                                {{ $model->select("option_one") }}--}}
                                        <div class="form-group">
                                            <select type="text" class="form-control form-control option_one-{{ $model->id }}" id="option_one"  name="project_id">
                                                @foreach(\App\Project::where('status',1)->get() as $project)
                                                    <option value="{{ $project->id }}" {{ $project->id===$model->optionTwo->id?'selected="selected"':'' }}>{{ $project->id }} - {{ $project->teacher->name }} - {{ $project->name_count }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('option_one'))
                                                <p class="text-danger">
                                                    {{ $errors->first('option_one') }}
                                                </p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="offer_student hidden">
                                    <div class="form-group">
                                        <label class="control-label" for="lname"><b>{{ trans('message.subscription_finish.project_name') }}</b></label>
                                        <input class="form-control" rows="5" id="name" placeholder="{{ trans('message.subscription_finish.project_name') }}" name="project_name" value="{{ $model->offer_project }}"></input>
                                        @if($errors->has('name'))
                                            <p class="text-danger">
                                                {{ $errors->first('name') }}
                                            </p>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="lname"><b>{{ trans('message.subscription_finish.teacher_name') }}</b></label>
                                        <select type="text" class="form-control form-control teacher_id" id="teacher_id"  name="teacher_id">
                                            @foreach(\App\User::where('type','Teacher')->where('is_active',1)->get() as $teacher)
                                                <option value="{{ $teacher->id }}" >{{ $teacher->id }} - {{ $teacher->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('teacher_id'))
                                            <p class="text-danger">
                                                {{ $errors->first('teacher_id') }}
                                            </p>
                                        @endif
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="control-label" for="lname"><b>{{ trans('message.subscription.description') }}*</b></label>
                                <textarea class="form-control description" rows="5" id="description" placeholder="{{ trans('message.subscription.description') }}" name="description" required></textarea>
                                @if($errors->has('description'))
                                    <p class="text-danger">
                                        {{ $errors->first('description') }}
                                    </p>
                                @endif
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.check-offer-student').on('click', function(){
            var checkedOffer = $('.check-offer-student').is(":checked");
            console.log(checkedOffer);
            if (checkedOffer)
            {
                $('.offer_student').removeClass('hidden');
                $('.project_subscription').addClass('hidden');
            }
            else {
                $('.offer_student').addClass('hidden');
                $('.project_subscription').removeClass('hidden');
            }
        })

        $('.categories-select-{!! $model->id !!}').on('click', function(){
            // var categoryId = $('.categoryId:checked').val();
            let data = [];
            //
            $("input[name='categoryId']:checked").each( function () {
                data.push( $(this).val() );
            });

            console.log(data);

            var url = '/api/list-categories';
            $.ajax({
                method: 'POST',
                data: {
                    categoriesId: data
                },
                url: url,
                success: function (response) {
                    $('.option_one-{!!$model->id!!}').children().remove();
                    response.data.forEach(function (item) {
                        $('.option_one-{!!$model->id!!}').append('<option value="'+item.id+'">'+item.id+' - '+item.teacher_name+' - '+item.name_count+'</option>');
                    });
                }
            });

        })


    });
</script>
