<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('home');
});






Route::group(['middleware' => 'setLocale'], function () {
    Auth::routes();

    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/information', 'DefaultController@getInformation')->name('information');
    Route::post('/information', 'DefaultController@updateInformation')->name('information.update');
    Route::get('/list-project', 'DefaultController@getListProject')->name('listProject.index');
    Route::get('/list-project/create', 'DefaultController@createProject')->name('listProject.create');
    Route::post('/list-project/store', 'DefaultController@storeProject')->name('listProject.store');
    Route::get('/list-project/delete/{id}', 'DefaultController@deleteProject')->name('listProject.delete');
    Route::get('/list-project/edit/{id}', 'DefaultController@editProject')->name('listProject.edit');
    Route::post('/list-project/update/{id}', 'DefaultController@updateProject')->name('listProject.update');

    //subscription for teacher
    Route::get('/list-subscriptions/option_one', 'DefaultController@getSubscriptions')->name('listSubscriptions.index');
    Route::get('/list-subscriptions/option_two', 'DefaultController@getSubscriptionsOptionTwo')->name('listSubscriptions.optionTwo');
    Route::get('/list-subscriptions/save', 'DefaultController@getSubscriptionSave')->name('listSubscriptions.save');

    //subscription for student
    Route::post('/list-subscriptions/store', 'DefaultController@getSubscriptionsStore')->name('subscriptions.store');
    Route::post('/list-subscriptions/update/{id}', 'DefaultController@getSubscriptionsUpdate')->name('subscriptions.update');

    Route::post('/admin/import/student', 'ImportController@importStudent')->name('import.student');
    Route::get('/admin/import/show', 'ImportController@index')->name('import.showForm');
    Route::get('/admin/import/show/teacher', 'ImportController@teacher')->name('import.teacher');
    Route::post('/admin/import/teacher', 'ImportController@importTeacher')->name('import.teacherImport');

    //subscription finish teacher
    Route::get('/finish', 'FinishController@index')->name('listFinish.index');

    Route::get('change-language/{lang}', 'DefaultController@changeLang')->name('change-lang');

    //List teachers
    Route::get('list-teachers', 'DefaultController@getListTeachers')->name('listTeachers.index');


    Auth::routes();

    Route::get('/home', 'HomeController@index')->name('home');
    Route::post('/finish/create/{id}', 'FinishController@checkSubscriptionsFinish')->name('listFinish.create');



});


//Route::get('/change_lang/england', 'aultController@englandLang')->name('change-lang.england');

