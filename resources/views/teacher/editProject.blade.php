@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.list_project') }}</div>
    <div class="card-body">
        <div class="container contact">
            <div class="form-group">
                <b>{{ trans('message.project.edit') }}</b>
                <hr>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="contact-info">
                        <p class="text-danger">{{ trans('message.project.notification') }}{{$cronJob->start_at}}{{ trans('message.project.to')}}{{$cronJob->end_at}}.</p>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="contact-form">
                        <form action="{{ route('listProject.update',[$project->id]) }}" method="POST">
                            @csrf

                            <div class="form-group">
                                <label class="control-label col-sm-10" for="fname"><b>{{ trans('message.project.name') }}*</b></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" placeholder="{{ trans('message.project.name') }}" name="name" value="{{ $project->name }}" required>
                                    @if($errors->has('name'))
                                        <p class="text-danger">
                                            {{ $errors->first('name') }}
                                        </p>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-10" for="email"><b>{{ trans('message.project.number') }}*</b></label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="number" placeholder="{{ trans('message.project.number') }}" name="number" value="{{ $project->number }}" required>
                                    @if($errors->has('number'))
                                        <p class="text-danger">
                                            {{ $errors->first('number') }}
                                        </p>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-10" for="email"><b>{{ trans('message.topic') }}</b></label>
                                <div class="col-sm-10 row">
                                    <div class="col-sm-9">
                                        <select type="category" class="form-control multiselect-ui categories-multiple" id="category" name="category[]" multiple>
                                            @foreach($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                        <!-- dribbble -->
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-primary col-sm-12 openAddCategory" data-toggle="modal" data-target="#modalAddCategory">{{ trans('message.add_category') }}</button>
                                    </div>
                                </div>
                            </div>


                            {{--                            Modal add category--}}
                            <div class="modal fade modalAddCategory" id="modalAddCategory" tabindex="-1" role="dialog" aria-labelledby="modalAddCategoryTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Add Category</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="name">{{ trans('message.category.name') }}*</label>
                                                <input type="text" name="category-name" class="form-control category-name">
                                                @if($errors->has('category-name'))
                                                    <p class="text-danger">
                                                        {{ $errors->first('category-name') }}
                                                    </p>
                                                @endif
                                            </div>
                                            <div class="form-group">
                                                <label for="name">{{ trans('message.category.description') }}*</label>
                                                <textarea type="text" name="category-description" class="form-control category-description" rows="3"></textarea>
                                                @if($errors->has('category-description'))
                                                    <p class="text-danger">
                                                        {{ $errors->first('category-description') }}
                                                    </p>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary category-submit">Save Category</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{--                            Modal add category--}}


                            <div class="form-group">
                                <label class="control-label col-xl" for="email"><b>{{ trans('message.project.student_chooser') }}</b>({{ trans('message.project.student_noti') }})</label>
                                <div class="col-sm-10">
                                    <select type="category" class="form-control multiselect-ui students-multiple" id="students" name="students[]" multiple>
                                        @foreach($students as $student)
                                            <option value="{{ $student->id }}">{{ $student->name }} - {{ $student->student_code }}</option>
                                        @endforeach
                                    </select>
                                    <!-- dribbble -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-10" for="lname"><b>{{ trans('message.project.description') }}*</b></label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="5" id="description" placeholder="{{ trans('message.project.description') }}" name="description" required>{{ $project->description }}</textarea>
                                    @if($errors->has('description'))
                                        <p class="text-danger">
                                            {{ $errors->first('description') }}
                                        </p>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <div class=" col-lg">
                                    <button type="submit" class="btn btn-success col-sm-10">{{ trans('message.project.edit') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(document).ready(function () {
            var sites = {!! json_encode($project->categories->pluck('id')->toArray()) !!};
            $('.categories-multiple').select2().val(sites);
            $('.categories-multiple').trigger('change');

            var studentsChoose = {!! json_encode($studentChoice) !!};
            $('.students-multiple').select2().val(studentsChoose);
            $('.students-multiple').trigger('change');

            $('.category-submit').on('click', function () {
                var categoryName = $('.category-name').val();
                var categoryDescription = $('.category-description').val();
                if (categoryName && categoryDescription) {
                    $.ajax({
                        method: 'POST',
                        url: '/api/add-category',
                        data: {
                            categoryName: categoryName,
                            categoryDescription: categoryDescription
                        },
                        success: function (response) {
                            $('.categories-multiple').children().remove();
                            response.data.forEach(function (item) {
                                $('.categories-multiple').append('<option value="' + item.id + '">' + item.name + '</option>');
                            });
                            $('#modalAddCategory').modal('toggle');

                            var sites = {!! json_encode($project->categories->pluck('id')->toArray()) !!};
                            $('.categories-multiple').select2().val(sites);
                            $('.categories-multiple').trigger('change');
                        }
                    })
                } else {
                    alert('{!! trans('message.not_back') !!}');
                }

            });

        })
    </script>
@endsection
