<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use App\Album;
use App\Photo;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; 
use Validator;

class AlbumController extends Controller
{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function getAlbums(Album $albums){ 
		$albums = Album::with(['photos' => function($q) {$q->groupBy('album_id');}])->get(); 
		return response()->json($albums, $this->successStatus); 
	}

	public function getAlbum($id){ 
		$photos = Photo::where('album_id', $id)->orderBy('created_at','desc')->get(); 
		return response()->json($photos, $this->successStatus); 
	}
}
