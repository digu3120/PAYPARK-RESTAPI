<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\SlideController;
use App\Http\Controllers\UserController;
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

Route::post('/register', [AuthController::class, 'Register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/images', [ImageController::class, 'index']);
Route::get('/slides', [SlideController::class, 'index']);
Route::get('/users/{email}', [UserController::class, 'getUserByEmail']);
Route::get('/users/phone/{phone}', [UserController::class, 'getUserByphone']);
Route::post('/check-email', [UserController::class, 'checkEmailExistence']);
Route::post('/check-phone', [UserController::class, 'checkPhoneExistence']);
Route::get('/data', [UserController::class, 'getEmailPhone']);

