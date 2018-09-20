<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use Illuminate\Support\Facades\Auth; 

class ResetPasswordController extends Controller
{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function resetPassword(Request $request) {
		$input = $request->all();
		$user = Auth::user();

		if( isset($input['old_password']) && !empty($input['old_password']) && $input['old_password'] !== "" && $input['old_password'] !=='undefined') {
			$check  = Auth::guard('web')->attempt([
				'email' => $user->email,
				'password' => $input['old_password']
			]);
			if($check && isset($input['new_password']) && !empty($input['new_password']) && $input['new_password'] !== "" && $input['new_password'] !=='undefined' && $input['new_password'] === $input['copy_new_password']) {
				$user->password = bcrypt($input['new_password']);
				//$user->token()->revoke();
				//$token = $user->createToken('newToken')->accessToken;
				$user->save();

				return response()->json(['message' => 'success'], $this->successStatus);
			}
			else {
				return response()->json(['message' => 'failed'], $this->failedStatus);
			}
		}
		return response()->json(['message' => 'failed'], $this->failedStatus);
	}
}
