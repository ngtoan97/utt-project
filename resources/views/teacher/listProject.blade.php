@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.list_project') }}</div>
    <div class="card-body">
        @if($cronJob)
            <div>
                <a href="{{ route('listProject.create') }}">
                    <button class="btn btn-success ">+ {{ trans('message.add') }}</button>
                </a>
            </div>
            <div>
                <p class="text-danger">{{ trans('message.project.notification') }}{{$cronJob->start_at}}{{ trans('message.project.to')}}{{$cronJob->end_at}}.</p>
            </div>
        @else
            <p class="text-danger">{{ trans('message.project.expired') }}.</p>
        @endif
        @if (count($listProject) !==0 )
            <table class="table table-bordered table-striped table-hover">
                <thead>
                <tr>
                    <th>{{trans('message.subscription.project_name')}}</th>
                    <th>{{trans('message.project.description')}}</th>
                    <th>{{trans('message.project.number')}}</th>
                    <th>{{trans('message.project.status')}}</th>
                    <th>{{ trans('message.topic')}}</th>
                    <th>{{trans('message.created_at')}}</th>
                    @if($cronJob )
                        <th>Action</th>
                    @endif
                </tr>
                </thead>
                <tbody>
                @foreach( $listProject as $project )
                    <tr class="tr-table">
                        <td>{{ $project->name_count }}</td>
                        <td>{{ $project->description }}</td>
                        <td>{{ $project->number }}</td>
                        <td>
                            {{ ($project->status==='0')?trans('message.pending'):(($project->status==='1')? trans('message.approve'):trans('message.disapprove'))}}
                        </td>
                        <td>
                            @foreach ($project->categories as $category)
                                <button class="btn btn-sm btn-success">{{ $category->name }}</button>
                            @endforeach
                        </td>

                        <td>{{ ($project->created_at)->format('Y:M:d') }}</td>
                        @if($cronJob )
                            <td>
                                <span><a href="{{ route('listProject.edit',[$project->id]) }}"><button type="button" class="btn btn-primary btn-sm">{{ trans('message.edit') }}</button></a></span>
                                <span><a href="{{ route('listProject.delete',[$project->id]) }}" onclick="return confirm(`{{ trans('message.delete_check') }}`)"><button type="button" class="btn btn-danger btn-sm">{{ trans('message.delete') }}</button></a></span>
                            </td>
                        @endif
                    </tr>
                @endforeach
                </tbody>
            </table>
        @else
            <p>Not data</p>
        @endif
    </div>
@endsection
