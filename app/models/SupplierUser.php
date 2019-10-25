<?php

namespace App\models;

use App\Traits\RefreshApiToken;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasPermissions;

class SupplierUser extends Authenticatable
{
    use Notifiable;
    use RefreshApiToken;
    use HasPermissions;
    protected $guard = 'supplier';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'supplier_users';
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
