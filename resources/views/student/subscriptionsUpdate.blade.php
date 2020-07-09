@extends('student.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.subscription.list_subscriptions') }}</div>
    <div class="card-body">
        @if (count($listProject) !==0  && $cronJob)
            <div class="container contact">
                <div class="form-group">
                    <b>{{ trans('message.subscription.update') }}</b>
                    <hr>
                    @if(session('message'))
                    <div class="text-center alert alert-success" role="alert">
                            {{session('message')}}
                    </div>
                    @endif

                    <div class="text-center step">

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="contact-info">
                            <p class="text-danger">{{ trans('message.project.project_register') }}{{$cronJob->start_at}}{{ trans('message.project.to')}}{{$cronJob->end_at}}.</p>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="contact-form">
                            <form action="{{ route('subscriptions.update',[$subscription->id]) }}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label class="control-label col" for="fname"><b>{{ trans('message.subscription.option_one') }}</b></label>
                                    <div class="col-sm-10">
                                        <select type="text" class="form-control option-project" id="option_one"   data-subscription="{{ $listProject }}" placeholder="{{ trans('message.subscription.option_one') }}" name="option_one">
                                            @foreach($listProject as $project)
                                                <option value="{{ $project->id }}" {{ ($project->id===$subscription->option_one)?'selected="selected"':'' }}>{{ $project->id }} - {{ $project->name_count }} - {{ $project->teacher->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('option_one'))
                                            <p class="text-danger">
                                                {{ $errors->first('option_one') }}
                                            </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label class="control-label col" for="email"><b>{{ trans('message.subscription.option_two') }}</b></label>
                                    <div class="col-sm-10">
                                        <select type="text" class="form-control option-project "  id="option_two"  placeholder="{{ trans('message.subscription.option_two') }}" name="option_two">
                                        </select>
                                        @if($errors->has('option_two'))
                                            <p class="text-danger">
                                                {{ $errors->first('option_two') }}
                                            </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col" for="lname"><b>{{ trans('message.subscription.offer') }}</b></label>
                                    <div class="col-sm-10">
                                        <input  type="text" class="form-control" id="offer_project" placeholder="{{ trans('message.subscription.offer') }}" name="offer_project" value="{{ $subscription->offer_project }}"/>
                                        @if($errors->has('offer'))
                                            <p class="text-danger">
                                                {{ $errors->first('offer') }}
                                            </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col" for="email"><b>{{ trans('message.project.category') }}</b></label>
                                    <div class="col-sm-10">
                                        <select type="category" class="form-control multiselect-ui categories-multiple"  id="category" name="category[]" multiple>
                                            @foreach($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                        <!-- dribbble -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="lname"><b>{{ trans('message.subscription.description') }}</b></label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="5" id="description" placeholder="{{ trans('message.subscription.description') }}" name="description">
                                            {{ $subscription->description }}
                                        </textarea>
                                            @if($errors->has('description'))
                                            <p class="text-danger">
                                                {{ $errors->first('description') }}
                                            </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class=" col-lg">
                                        <button type="submit" class="btn btn-success col-sm-10">{{ trans('message.subscription.update') }}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        @else
            <p class="text-danger">{{ trans('message.project.expired') }}.</p>

        @endif
    </div>
@endsection

@section('script')
    @if (count($listProject) !==0  && $cronJob)
        <script>
    $(document).ready(function() {
        var sites = {!! json_encode($subscription->categories->pluck('id')->toArray()) !!};
        $('.categories-multiple').select2().val(sites);
        $('.categories-multiple').trigger('change');
        var select = $('.option-project').val();
        var url = '/api/get-list-project/'+select;
        $.ajax({
            method: 'GET',
            url: url,
            success: function (response) {
                response.forEach(function (item) {
                    $('#option_two').append("<option value="+item.id+" {{ ($project->id===$subscription->option_two)?'selected="selected"':'' }}>"+item.id+" - "+item.name_count+" - "+item.teacherName+"</option>");
                });
            }
        });

        $('.step').append('<p class="text-danger">{{ trans('message.step_1') }}</p>')

        $('.option-project').select2({
            allowClear: true,
            placeholder: "Select a Project",
        });


        $('#option_one').change(function () {
            $('.step').children().remove();
            $('.step').append('<p class="text-danger">{{ trans('message.step_2') }}</p>')
            var select = $('.option-project').val();
            $('#option_two').children().remove();
            $('#option_two').append("<option></option>");
            var url = '/api/get-list-project/'+select;
            $.ajax({
                method: 'GET',
                url: url,
                success: function (response) {
                    response.forEach(function (item) {
                        $('#option_two').append("<option value="+item.id+" {{ ($project->id===$subscription->option_two)?'selected="selected"':'' }}>"+item.id+" - "+item.name_count+" - "+item.teacherName+"</option>");
                    });
                }
            });
        });
        $('#option_two').change(function () {
            $('.step').children().remove();
            $('.step').append('<p class="text-danger">{{ trans('message.step_3') }}</p>');
            $('.offer').attr('readonly',false);
        });
        $('.offer').change(function () {
            $('.step').children().remove();
            $('.step').append('<p class="text-danger">{{ trans('message.step_4') }}</p>')
            $('.description').attr('readonly',false)
        })
    });
</script>
@endif

@endsection
