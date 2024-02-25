<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/event/create',[EventController::class, 'create'])->name('event.create')->middleware(["auth:api"]);
Route::post('/event/{id}/update',[EventController::class, 'update'])->name('event.update');
Route::post('/event/{id}/destroy',[EventController::class, 'destroy'])->name('event.destroy');
Route::post('/event/list',[EventController::class, 'show'])->name('event.list')->middleware(["auth:api","admin"]);

Route::post('loginapi',[EventController::class,'login']);
// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
