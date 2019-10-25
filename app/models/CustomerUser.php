<?php

namespace App\models;

use App\Traits\RefreshApiToken;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasPermissions;

class CustomerUser extends Authenticatable
{
    use HasPermissions;
    use Notifiable;
    use RefreshApiToken;
    protected $guard = 'customer';
        /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'customer_user';
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
