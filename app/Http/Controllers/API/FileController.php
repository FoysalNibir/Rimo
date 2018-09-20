<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Carbon\Carbon;
use Validator;

class FileController extends Controller
{
    public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function postUpdateAvatar(Request $request){
 
        $user = Auth::user();
        $png_url = "avatar-".time().".jpg";
        $avatarDBName = 'users\\August2018\\'.$png_url;

        $image_string = $request->get('avatar');
        $image = base64_decode($image_string);
 
        $path = public_path() . "/storage/users/August2018/" . $png_url;
        $success = file_put_contents($path, $image);
 
        $user->avatar = $avatarDBName;
        $user->save();
 
        return response()->json(['message' => 'success'], $this->successStatus);
 
    }
}
