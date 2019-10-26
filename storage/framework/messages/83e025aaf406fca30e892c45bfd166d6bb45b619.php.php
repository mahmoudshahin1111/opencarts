<?php

namespace App\Http\Middleware;

use App\models\CustomerUser;
use App\models\SupplierUser;
use App\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;

class CheckGuardShouldUse
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        /**
         * 1-Validate Email then check any guard has that email 
         * 2- change atuh guard 
         * 3- logout if logged in 
         */
        $request->validate([
            'email' => ['email'],
        ]);
        $guards = Config::get('auth.guards');
        $selected_guard = null;
        foreach ($guards as $guard => $values) {

            if ($guard === 'store') {
                $store = User::where('email', $request->email)->first();
                if (!empty($store)) {
                    $selected_guard = $guard;
                }
            } else if ($guard === 'customer') {
                $customer = CustomerUser::where('email', $request->email)->first();
                if (!empty($customer)) {
                    $selected_guard = $guard;
                }
            } else if ($guard === 'supplier') {
                $supplier = SupplierUser::where('email', $request->email)->first();
                if (!empty($supplier)) {
                    $selected_guard = $guard;
                }
            }
            if ($selected_guard) {
                if (Auth::check()) {
                    Auth::logout();
                }
                Auth::shouldUse($selected_guard);
                break;
            }

        }
        return $next($request);
    }
}
