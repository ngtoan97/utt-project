<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    //    teacher route
    $router->resource('teachers', TeacherController::class)->except(['store']);
    $router->resource('students', StudentController::class)->except(['store']);

//    projects route
    $router->resource('projects', ProjectController::class);

    $router->resource('subscriptions', SubscriptionController::class);
    $router->resource('subscription-finishes', SubscriptionFinishController::class);
    $router->resource('not-subscriptions', NotSubscriptionController::class);

    //category routes
    $router->resource('categories', CategoryController::class);

    $router->post('/teachers', 'TeacherController@insert')->name('teachers.store');
    $router->post('/students', 'StudentController@insert')->name('students.store');

    $router->resource('cron-jobs', CronJobController::class);


//    $router->get('/category/create', 'CategoryController@create')->name('admin.category.create');
//    $router->post('/category/create', 'CategoryController@insert')->name('admin.category.create');
//    $router->get('/category/{id}/edit', 'CategoryController@edit');
});
