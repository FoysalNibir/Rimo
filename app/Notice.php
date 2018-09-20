<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
	protected $fillable = [
        'headline', 'notice', 'user_id',
    ];

    public static $rules = [
        'headline' => 'required',
        'notice' => 'required',
        'date' => 'required|date'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
