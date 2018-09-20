<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use App\Album;
use App\Photo;
use App\Userdetail;
use App\Notice;
use App\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; 
use Validator;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Support\Facades\Password;


class TestController extends Controller
{
	use SendsPasswordResetEmails;

	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function forgotPassword(Request $request) {
		$input = $request->all();
		$user = User::where('email', $input['email'])->first();
		if($user){
			Password::sendResetLink(['email' => $user->email]);
			return response()->json(['message' => 'success'], $this->successStatus);
		}	
		return response()->json(['message' => 'invalidemail'], $this->failedStatus);	
	}
}
