<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Session;

class SetLocale
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $language = Session::get('language', config('app.locale'));
        switch ($language) {
            case 'en':
                $language = 'en';
                break;

            default:
                $language = 'vn';
                break;
        }
            app()->setLocale($language);
        return $next($request);
    }
}
