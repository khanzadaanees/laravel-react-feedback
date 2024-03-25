<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FeedbackController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
Route::get('/allFeedback', [FeedbackController::class, 'index']);
Route::post('/storeFeedback', [FeedbackController::class, 'storeFeedback']);
Route::get('/viewFeedback/{id}', [FeedbackController::class, 'viewFeedback']);
Route::post('/feedbackComment/{id}', [FeedbackController::class, 'storeComment']);
