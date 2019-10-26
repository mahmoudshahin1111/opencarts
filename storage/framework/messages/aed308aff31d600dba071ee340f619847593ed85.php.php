<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;

class CheckUrlForStore
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
        if($store_id = $request->route('store_id')){
            $user = Auth::user();
            if(!$result = $user->Stores()->where('store_id',$store_id)->first()){
                Auth::logout();
            }
            else{
                URL::defaults(['store_id'=>$store_id]);
            }

        }
        else{
            Auth::logout();
        }
        return $next($request);
    }
}
