<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; 
use Validator;

class LoginController extends Controller
{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function login(){

		if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
			$user = Auth::user();
			$token = $user->createToken('MyApp')->accessToken;
			return response()->json(['message' => 'success', 'token' => $token], $this->successStatus);
		} 
		else{ 
			return response()->json(['message' => 'unauthorised'], $this->successStatus);
		}

	}

	public function validateToken(){
		return response()->json(['message' => 'success'], $this->successStatus);
	}
}
