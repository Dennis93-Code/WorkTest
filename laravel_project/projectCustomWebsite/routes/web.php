<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GamingSocietyController;
use App\Http\Controllers\SportController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/home', [GamingSocietyController::class, 'home']);
Route::get('/about', [GamingSocietyController::class, 'about']);
Route::get('/members', [GamingSocietyController::class, 'members']);
Route::get('/events', [GamingSocietyController::class, 'events']);
Route::get('/score', [GamingSocietyController::class, 'score']);

// Form Section Procedure
Route::get('/sports/create', [SportController::class, 'create'])->name('sports.create');
Route::post('/sports/store', [SportController::class, 'store'])->name('sports.store');
