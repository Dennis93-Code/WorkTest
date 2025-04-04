<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GamingSocietyController;
use App\Http\Controllers\SportController;
use App\Http\Controllers\ManagementController; // Ensure this is imported

Route::get('/', function () {
    return view('welcome');
});
Route::get('/home', [GamingSocietyController::class, 'home']);
Route::get('/about', [GamingSocietyController::class, 'about']);
Route::get('/members', [GamingSocietyController::class, 'members']);
Route::get('/events', [GamingSocietyController::class, 'events']);
Route::get('/score', [GamingSocietyController::class, 'score']);

// Management Page
Route::get('/management', [ManagementController::class, 'index'])->name('management.index');

// Form Section Procedure
Route::get('/sports/create', [SportController::class, 'create'])->name('sports.create');
Route::post('/sports/store', [SportController::class, 'store'])->name('sports.store');
Route::get('/manage-sports', [SportController::class, 'index'])->name('manage.sports');
Route::get('/sports/{id}/edit', [SportController::class, 'edit'])->name('sports.edit');
Route::post('/sports/{id}', [SportController::class, 'update'])->name('sports.update');
