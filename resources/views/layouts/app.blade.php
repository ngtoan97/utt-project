<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', '') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/custom.js') }}" defer></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <!-- Styles -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/home') }}">
                    <img src="http://utt.edu.vn/uploads/images/site/1461517779logo.png" style="height: 60px">
{{--                  {{ trans('message.dashboard') }}--}}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto flex-column">
                        <div class="text-right">
                            <span><a href="{{ route('change-lang',['vn']) }}"><img src="{{ url('/uploads/icon_vietnam.png') }}" style="width: 30px"></a></span>
                            <span><a href="{{ route('change-lang',['en']) }}"><img src="{{ url('/uploads/icon_england.png') }}" style="width: 30px"></a></span>

                        </div>
                        <div>

                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
{{--                            @if (Route::has('register'))--}}
{{--                                <li class="nav-item">--}}
{{--                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>--}}
{{--                                </li>--}}
{{--                            @endif--}}
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class=" dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ trans('message.logout') }}

                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                        </div>

                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-3">
            @yield('content')
        </main>
        <footer id="footer" class="footer" style="background-color:white">
            <div class="footer-inner">
                <div class="footer-center">
                    <div class="container">
                        <div class="row">
                            <div class="footer-four col-lg-3 col-md-4 col-sm-12 col-xs-12 column">
                                <div>
                                    <div class="block block-block-content">
                                        <h2 class="block-title"><span>Đại học Công nghệ GTVT</span></h2>
                                        <div class="content block-content">
                                            <div class="field field--name-body field--type-text-with-summary field--label-hidden field__item">
                                                <div class="contact-info">
                                                    <div>Số 54 Triều Khúc, Thanh Xuân, Hà Nội</div>
                                                    <div>Điện thoại: 0243.854 4264</div>
                                                    <div>Fax: 0243.854 7695</div>
                                                    <div class="description">Kết nối với UTT <a
                                                            href="https://www.facebook.com/utt.vn"
                                                            target="_blank"><img src="http://utt.edu.vn/publics/template/portal2019/images/Facebook-new.png"
                                                                                 width="25px"/></a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="footer-four col-lg-3 col-md-4 col-sm-12 col-xs-12 column">
                                <div>
                                    <div class="block block-block-content">
                                        <h2 class="block-title"><span>Cơ sở Vĩnh Phúc</span></h2>
                                        <div class="content block-content">
                                            <div class="field field--name-body field--type-text-with-summary field--label-hidden field__item">
                                                <div class="contact-info">
                                                    <div>Số 278 Lam Sơn, Đồng Tâm, TP. Vĩnh Yên, Vĩnh Phúc</div>
                                                    <div>Điện thoại: 0211.386.7405</div>
                                                    <div>Fax: 0211.386.7391</div>
                                                    <div class="description"><a href="https://www.facebook.com/uttvinhphuc" target="_blank">Fanpage</a> | <a href="https://www.google.com/maps/dir//%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%C3%B4ng+ngh%E1%BB%87+gtvt+v%C4%A9nh+ph%C3%BAc/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3134f00da3cb9321:0xc0f8f922d6230a80?sa=X&ved=2ahUKEwiUq-2K4JnhAhWGbN4KHY89B5cQ9RcwFnoECAwQDg" target="_blank">Chỉ đường</a> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="footer-four col-lg-3 col-md-4 col-sm-12 col-xs-12 column">
                                <div>
                                    <div class="block block-block-content">
                                        <h2 class="block-title"><span>Cơ sở Thái Nguyên</span></h2>
                                        <div class="content block-content">
                                            <div class="field field--name-body field--type-text-with-summary field--label-hidden field__item">
                                                <div class="contact-info">
                                                    <div>Phường Tân Thịnh, TP.Thái Nguyên, Thái Nguyên</div>
                                                    <div>Điện thoại: 0208.385.6545</div>
                                                    <div>Fax: 0208.374.6975</div>
                                                    <div class="description"><a href="https://www.facebook.com/uttthainguyen" target="_blank">Fanpage</a> | <a href="https://www.google.com/maps/dir//%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%C3%B4ng+ngh%E1%BB%87+gtvt+th%C3%A1i+nguy%C3%AAn/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3135272eda758f99:0xf73f6015c74220a3?sa=X&ved=2ahUKEwjQsZqC4ZnhAhWI7WEKHRLKBocQ9RcwC3oECA0QDg" target="_blank">Chỉ đường</a> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="footer-four col-lg-3 col-md-4 col-sm-12 col-xs-12 column">
                                <div>
                                    <div class="block block-block-content">
                                        <div class="content block-content">
                                            <div class="field field--name-body field--type-text-with-summary field--label-hidden field__item">
                                                <img src="http://api.qrserver.com/v1/create-qr-code/?color=000000&amp;bgcolor=FFFFFF&amp;data=http%3A%2F%2Futt.edu.vn%2Ftuyensinh&amp;qzone=1&amp;margin=0&amp;size=200x200&amp;ecc=L" alt="qr code" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="copyright" style="background: #1F1E23; color: #bbbbbb; padding:5px;">
                <div class="container">
                    <div class="copyright-inner">
                        <div>
                            <div id="block-gavias-edubiz-copyright"
                                 class="block block-block-content block-block-content61f17841-749f-436d-9799-1dfeefd7ad43 no-title">

                                <div class="content block-content">

                                    <div class="field field--name-body field--type-text-with-summary field--label-hidden field__item">
                                        <div class="text-center">
                                            Copyright © 2020 Đại học Công nghệ Giao thông vận tải
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
{{--            <div id="gva-popup-ajax" class="clearfix">--}}
{{--                <div class="pajax-content"><a href="javascript:void(0);" class="btn-close"><i class="fa fa-times"></i></a>--}}
{{--                    <div class="gva-popup-ajax-content clearfix"></div>--}}
{{--                </div>--}}
{{--            </div>--}}

        </footer>
    </div>
</body>
</html>
@yield('script')
