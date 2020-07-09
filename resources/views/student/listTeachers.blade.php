@extends('student.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.list_teacher') }}</div>
    <div class="card-body">
            <div class="form-group pull-right pl-0 mr-0 " >
                <input type="text" class="search form-control  col-xl-4" placeholder="What you looking for?">
            </div>
            {{--                <span class="counter pull-right"></span>--}}
            <table class="table table-bordered table-striped table-hover results">
                <thead>
                <tr>
                    <th>{{trans('message.full_name')}}</th>
                    <th>{{trans('message.email')}}</th>
                    <th>{{trans('message.phone_number')}}</th>
                    <th>{{trans('message.teacher.speciality')}}</th>

                </tr>
                </thead>
                <tbody>
                @foreach( $teachers as $teacher )
                    <tr class="tr-table">
                        <td class="td-table">{{ $teacher->name }}</td>
                        <td class="td-table">{{ $teacher->email }}</td>
                        <td class="td-table">{{ ($teacher->phone_number)}}</td>
                        <td class="td-table">{{ $teacher->speciality }}</td>

{{--                        <td class="td-table">{{ ($project->teacher->speciality)}}</td>--}}
{{--                        <td class="td-table">--}}
{{--                            @foreach ($project->categories as $category)--}}
{{--                                <a href="{{ route('listProject.index',['category'=>$category->id])}}"><button class="btn btn-sm btn-success">{{ $category->name }}</button></a>--}}
{{--                            @endforeach--}}
{{--                        </td>--}}
                    </tr>
                @endforeach
                </tbody>
            </table>
    </div>
@endsection
