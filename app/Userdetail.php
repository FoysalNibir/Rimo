<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Userdetail extends Model
{
	public static $rules = [
		'cadet_no' => 'required|numeric',
		'address' => 'required',
		'house' => 'required',
		'profession' => 'sometimes',
		'phone' => ['required', 'regex:/(^[+]{1}[8]{2}[01]{1}[0-9]{9}|^[8]{2}[01]{1}[0-9]{9}|^[01]{2}[0-9]{9})$/']
	];

	public static $update_rules = [
		'address' => 'sometimes',
		'profession' => 'sometimes',
		'phone' => ['sometimes', 'regex:/(^[+]{1}[8]{2}[01]{1}[0-9]{9}|^[8]{2}[01]{1}[0-9]{9}|^[01]{2}[0-9]{9})$/']
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
