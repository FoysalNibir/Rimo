<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{	
	public static $rules = [
        'type' => 'required|in:Debit,Credit',
        'amount' => 'required',
        'date' => 'required|date'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
