<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;

use App\Models\Post;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/Apilogin', function() {
    return 'ok';
});

Route::get('/posts', function() {
    return Post::all();
});

Route::post('/posts', function() {
    return Post::create([
        'name' => 'ahsan',
        'designation' => 'ao'
    ]);
});


Route::get("apidata",[PostController::class,'apidata']);
Route::post("login_api",[PostController::class,'login']);