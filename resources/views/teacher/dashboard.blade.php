@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.dashboard') }}</div>

    <div class="card-body">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif
        You are logged in! Teacher
    </div>
@endsection
