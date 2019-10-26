<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\App;
use Xinax\LaravelGettext\Facades\LaravelGettext;

class SetLocaleAdabter
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
        $locale = App::getLocale();
        LaravelGettext::setlocale($locale);
        return $next($request);
    }
}
