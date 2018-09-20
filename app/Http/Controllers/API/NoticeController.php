<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Notice;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; 
use Validator;

class NoticeController extends Controller
{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function getNotices(){ 
		$notices = Notice::with('user')->where('status',1)->orderBy('created_at','desc')->get();
		return response()->json($notices, $this->successStatus); 
	}

	public function postNotice(Request $request){ 
		$validator = Validator::make($request->all(), Notice::$rules);
		if ($validator->fails()){
			return response()->json(['message' => 'invalid'], $this->invalidStatus);
		}
		$notice = new Notice;
		$notice->headline = $request->get('headline');
		$notice->date = $request->get('date');
		$notice->notice = $request->get('notice');
		$notice->user_id = Auth::id();

		$png_url = "avatar-".time().".jpg";
        $avatarDBName = 'notices\\August2018\\'.$png_url;

        $image_string = $request->get('photo');
        $image = base64_decode($image_string);
 
        $path = public_path() . "/storage/notices/August2018/" . $png_url;
        $success = file_put_contents($path, $image);
 
        $notice->picture = $avatarDBName;
        $save = $notice->save();
        if ($save) {
        	$result['success'] = true;
        	return response()->json($result);
        }
        $result['success'] = false;
        $result['message'] = 'Notice could not be created'		
		return response()->json($result); 
	}
}
