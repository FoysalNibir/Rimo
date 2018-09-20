<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
// 	return $request->user();
// });



Route::post('login', 'API\LoginController@login');

Route::post('forgotpassword', 'API\ForgotPasswordController@forgotPassword');

Route::group(['middleware' => 'auth:api'], function(){

	Route::get('validatetoken', 'API\LoginController@validateToken');

	Route::post('resetpassword', 'API\ResetPasswordController@resetPassword');

	Route::get('profile', 'API\UserController@getProfile');
	Route::get('admins', 'API\UserController@getAdmins');		
	Route::get('users', 'API\UserController@getUsers');
	Route::get('users/{id}', 'API\UserController@getUser')->where('id', '[0-9]+');
	Route::post('profile/detail', 'API\UserController@postDetail');
	Route::post('updateemail', 'API\UserController@postUpdateEmail');
	Route::post('profile', 'API\UserController@postUpdateProfile');

	Route::post('updateavatar', 'API\FileController@postUpdateAvatar');

	Route::get('balance', 'API\BalanceController@getBalances');
	Route::get('balance/{id}', 'API\BalanceController@getBalance')->where('id', '[0-9]+');
	Route::get('transactions', 'API\BalanceController@getTransactions');
	Route::post('transactions', 'API\BalanceController@postTransactions');
	Route::post('createtransaction', 'API\BalanceController@postCreateTransactions');

	Route::get('albums', 'API\AlbumController@getAlbums');
	Route::get('albums/{id}', 'API\AlbumController@getAlbum')->where('id', '[0-9]+');

	Route::get('notices', 'API\NoticeController@getNotices');
	Route::post('createnotice', 'API\NoticeController@postNotice');	

});