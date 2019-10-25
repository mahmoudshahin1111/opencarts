<?php 
return [ 
    'sandbox'=>[
        'username'=>'',
        'password'=>'',
        'secret'=>'',
        'certificate'=>'',
        'app_id'=>'',
    ],
    'client_id' => env('PAYPAL_CLIENT_ID','AeIcL1pwdjETLhl2J2DdMwJ44FKnovgCd84ENQ4yMrbHJgq9s7TlUm4Ipi05YbdiGrjFfWWPPYVLLPq2'),
    'secret' => env('PAYPAL_SECRET','EDjBb_wi2DD7cx14oZY5yqCWiHDI1FjTKdKIid4cfaC7Ic_9lGEQzlyEuKlNyX0y78jPXI-ggTij5ihY'),
    'settings' => array(
        'mode' => env('PAYPAL_MODE','sandbox'),
        'http.ConnectionTimeOut' => 30,
        'log.LogEnabled' => true,
        'log.FileName' => storage_path() . '/logs/paypal.log',
        'log.LogLevel' => 'ERROR'
    ),
];