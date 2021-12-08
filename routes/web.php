<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;

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
    return view('welcome');
});


Route::group(['middleware'=>'auth:sanctum', 'verified'], function () {
    
	Route::get("/dashboard",[PostController::class,'home'])->name('dashboard');
	Route::post("/getLoc",[PostController::class,'getLoc'])->name('getLoc');
	Route::post("/match",[PostController::class,'match'])->name('match');
	Route::post("/matchCheck",[PostController::class,'matchCheck'])->name('matchCheck');
    Route::get("/profile-details/{id}",[PostController::class,'profileDetails'])->name('profileDetails');
    Route::get("/user-status/{id}",[PostController::class,'disliked'])->name('user.disliked');
});
