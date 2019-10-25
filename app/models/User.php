<?php

namespace App;

use App\models\Pivots\UserStore;
use App\models\Store;
use App\Traits\HasImage;
use App\Traits\RefreshApiToken;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasPermissions;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable,RefreshApiToken;
    use HasPermissions;
    use HasImage;
    protected $guard = 'store';

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
    public function Stores(){
        return $this->belongsToMany(Store::class,UserStore::class,'user_id','store_id');
    }
}
