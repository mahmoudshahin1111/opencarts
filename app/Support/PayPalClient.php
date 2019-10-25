<?php

namespace Sample;

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
class PayPalClient
{
    public static $client_id;
    public static  $clientSecret;
    /**
     * Returns PayPal HTTP client instance with environment which has access
     * credentials context. This can be used invoke PayPal API's provided the
     * credentials have the access to do so.
     */
    public static function client()
    {
        return new PayPalHttpClient(self::environment());
    }
    
    /**
     * Setting up and Returns PayPal SDK environment with PayPal Access credentials.
     * For demo purpose, we are using SandboxEnvironment. In production this will be
     * LiveEnvironment.
     */
    public static function environment()
    {
        return new SandboxEnvironment(self::$client_id,self::$clientSecret);
    }
    public static function  boot(){
        if(get_class(Auth::user())){
            
        }
    }
}