<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens, Notifiable;

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

    public static $update_rules = [
        'name' => 'sometimes',
        'email' => 'sometimes|email|unique:users',
        'password' => 'sometimes|confirmed',
        'avatar' => 'sometimes'
    ];

    public function userdetail()
    {
        return $this->hasOne('App\Userdetail');
    }

    public function notices()
    {
        return $this->hasMany('App\Notice');
    }

    public function transactions()
    {
        return $this->hasMany('App\Transaction');
    }
}
