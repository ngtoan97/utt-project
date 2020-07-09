@extends('student.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.list_project') }}</div>
    <div class="card-body">
        @if($cronJob)
            <div>
                <p class="text-danger">{{ trans('message.project.notification') }}{{$cronJob->start_at}}{{ trans('message.project.to')}}{{$cronJob->end_at}}.</p>
            </div>
        @else
            <p class="text-danger">{{ trans('message.project.expired') }}.</p>
        @endif
        @if (count($listProject) !==0 )
                <div class="form-group pull-right pl-0 mr-0 " >
                    <input type="text" class="search form-control  col-xl-4" placeholder="What you looking for?">
                </div>
{{--                <span class="counter pull-right"></span>--}}
                <table class="table table-bordered table-striped table-hover results">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{trans('message.subscription.project_name')}}</th>
                        <th>{{trans('message.project.description')}}</th>
                        <th>{{trans('message.project.number')}}</th>
                        <th>{{trans('message.teacher.name')}}</th>
                        <th>{{trans('message.teacher.speciality')}}</th>
                        <th>{{trans('message.topic')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach( $listProject as $project )
                        <tr class="tr-table">
                            <td class="td-table">{{ $project->id }}</td>
                            <td class="td-table">{{ $project->name_count }}</td>
                            <td class="td-table">{{ $project->description }}</td>
                            <td class="td-table">{{ $project->number }}</td>
                            <td class="td-table">
                                {{ ($project->teacher->name)}}
                            </td>
                            <td class="td-table">{{ ($project->teacher->speciality)}}</td>
                            <td class="td-table">
                                @foreach ($project->categories as $category)
                                    <a href="{{ route('listProject.index',['category'=>$category->id])}}"><button class="btn btn-sm btn-success">{{ $category->name }}</button></a>
                                @endforeach
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        {{ isset($_GET["category"]) ?'':$listProject->links() }}
                    </ul>
                </nav>
        @else
             <p>Not data</p>
        @endif
    </div>
@endsection
