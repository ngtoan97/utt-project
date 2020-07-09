<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('get-list-project/{id}','ApiController@getListProjectApi');
Route::post('/list-subscriptions/check', 'ApiController@checkApiSubscriptions')->name('listSubscriptions.checkSubscriptions');
Route::post('/list-categories', 'ApiController@getListCategories')->name('listCategories.get');
Route::post('/add-category', 'ApiController@addCategories')->name('categories.addCategories');
