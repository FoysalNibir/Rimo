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

class UserController extends Controller

{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;


	public function getAdmins(){ 
		$admins = User::where('id', '!=', Auth::id())->where('role_id', 1)->get(); 
		return response()->json($admins, $this->successStatus);
	}

	public function getProfile(){ 
		//$profile = Auth::user()->with('userdetail')->first(); 
		$profile = User::where('id', Auth::id())->with('userdetail')->first();
		return response()->json($profile, $this->successStatus);
	}

	public function postUpdateEmail(Request $request){
		$validator_user = Validator::make($request->all(), User::$update_rules);
		if ($validator_user->fails()){
			return response()->json(['message' => 'invalid'], $this->invalidStatus);
		}
		$user=User::where('id', Auth::id())->first();
		$user->email=$request->get('email', $user->email);
		$save_user=$user->update();
		if($save_user){
			return response()->json(['message' => 'success'], $this->successStatus);
		}
		return response()->json(['message' => 'failed'], $this->failedStatus);
	}

	public function postUpdateProfile(Request $request){
		$validator_user = Validator::make($request->all(), User::$update_rules);
		$validator_detail = Validator::make($request->all(), Userdetail::$update_rules);
		if ($validator_user->fails() || $validator_detail->fails()){
			return response()->json(['message' => 'invalid'], $this->invalidStatus);
		}

		$user=User::where('id', Auth::id())->first();
		$user->avatar=$request->get('avatar', $user->avatar);
		$user->name=$request->get('name', $user->name);

		$userdetail=Userdetail::where('user_id', Auth::id())->first();
		$userdetail->address=$request->get('address', $userdetail->address);
		$userdetail->profession=$request->get('profession', $userdetail->profession);
		$userdetail->phone=$request->get('phone', $userdetail->phone);
		$userdetail->house=$request->get('house', $userdetail->house);
		$userdetail->cadet_no=$request->get('cadet_no', $userdetail->cadet_no);
		$userdetail->dob=$request->get('dob', $userdetail->dob);

		$save_user=$user->update();
		$save_detail=$userdetail->update();

		if($save_user && $save_detail){
			return response()->json(['message' => 'success'], $this->successStatus);
		}
		return response()->json(['message' => 'failed'], $this->failedStatus);
	}

	public function postDetail(Request $request){ 

		$validator = Validator::make($request->all(), Userdetail::$rules);
		if ($validator->fails()){
			return response()->json(['message' => 'invalid'], $this->invalidStatus);
		}

		$detail=new Userdetail;
		$detail->user_id=Auth::user()->first()->id;;
		$detail->cadet_no=$request->get('cadet_no');	
		$detail->address=$request->get('address');
		$detail->house=$request->get('house');
		$detail->profession=$request->get('profession');
		$save=$detail->save();
		if($save){
			return response()->json(['message' => 'success'], $this->successStatus);
		} 	
		return response()->json(['message' => 'failed'], $this->failedStatus);
	}

	public function getUser($id){ 
		$user = User::where('id', '!=', Auth::id())->where('id', $id)->with('userdetail')->with('role')->first(); 
		return response()->json($user, $this->successStatus); 
	}

	public function getUsers(){ 
		$users = User::where('id', '!=', Auth::id())->get(); 
		return response()->json($users, $this->successStatus); 
	}
}
