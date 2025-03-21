<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GamingSocietyController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/home', [GamingSocietyController::class, 'index']);
Route::get('/about', [GamingSocietyController::class, 'about']);
Route::get('/members', [GamingSocietyController::class, 'members']);
Route::get('/events', [GamingSocietyController::class, 'events']);
