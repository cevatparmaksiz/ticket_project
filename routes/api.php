<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Auth;
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

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/


/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/
Route::post('adduser',[ApiController::class,'addUser']);
Route::post('login', [ApiController::class, 'login']);
Route::middleware('auth:api') -> group(function (){
    Route::get('/user', function(){
        return Auth::user(); 
    }
    );
   

Route::post('addcinema',[ApiController::class,'addCinema']);
Route::post('addmovie',[ApiController::class,'addMovie']);
Route::post('addticket',[ApiController::class,'addTicket']);
Route::post('setticketattendend',[ApiController::class,'setTicketAttendend']);
Route::post('setcinemaattendend',[ApiController::class,'setCinemaAttendend']);    
Route::post('buyticket',[ApiController::class,'setTicketBuying']);        
Route::get('getcity',[ApiController::class,'getCity']);  
Route::get('getcinemabycity',[ApiController::class,'getCinemaByCity']);
Route::get('getmoviesbycinema',[ApiController::class,'getMoviesByCinema']);
Route::get('getemptyseatsbymovie',[ApiController::class,'getEmptySeatsByMovie']);
});


