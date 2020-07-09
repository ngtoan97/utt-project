@extends('layouts.app')

@section('content')
    <div class=" home-dashboard" >
        <div class="row justify-content-center">
            <div class="col-md-2 menu-desktop d-md-block d-none pt-2 pb-2 border menu-teacher">
                <ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <li>
                        <a class="nav-link  {{ request()->is('home')?'active-menu':'' }}" href="{{ route('home') }}" role="tab" aria-selected="true">{{ trans('message.home') }}</a>
                    </li>
                    <li>
                        <a class="nav-link {{ request()->is('information')?'active-menu':'' }}" href="{{ route('information') }}" role="tab" aria-selected="true">{{ trans('message.info') }}</a>
                    </li>
                    <li>
                        <a class="nav-link {{ request()->is('list-project')||request()->is('list-project/*')?'active-menu':'' }}" href="{{ route('listProject.index') }}" role="tab" aria-selected="true">{{ trans('message.list_project') }}</a>
                    </li>
                    <li>
                        <a class="nav-link {{ request()->is('list-subscriptions')||request()->is('list-subscriptions/*')?'active-menu':'' }}" href="{{ route('listSubscriptions.index') }}" role="tab" aria-selected="true">{{ trans('message.subscription.list_subscriptions') }}</a>
                    </li>
                    <li>
                        <a class="nav-link {{ request()->is('list-teachers')||request()->is('list-teachers/*')?'active-menu':'' }}" href="{{ route('listTeachers.index') }}" role="tab" aria-selected="true">{{ trans('message.list_teacher') }}</a>
                    </li>
                    <li>
                        <a class="nav-link {{ request()->is('finish')||request()->is('finish/*')?'active-menu':'' }}" href="{{ route('listFinish.index') }}" role="tab" aria-selected="true">{{ trans('message.subscription_finish.subscription_finish') }}</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-10 content-dashboard" >

                <div class="card">
                    @yield('content-dashboard')
                </div>

            </div>
        </div>
    </div>

@endsection
