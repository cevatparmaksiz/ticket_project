<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class ApiController extends Controller
{
    
    public function login(Request $req) {
        $email = $req -> email;
        $password = $req -> password;
         
        if(auth()->attempt(['email' => $email,'password' => $password])){
           $user = Auth::user();
            $succes['token'] = $user -> createToken("Login")-> accessToken;

            return response()->json([
                'success' => $succes,
            ],200);
        }
     return response()->json([
            'error' => 'Unauthorized',
        ],401);
    }
    
    public function addUser(Request $req) {
        
             return \App\Models\User::create([
            'name' => $req -> username,
            'email' => $req -> email,
            'password' => bcrypt($req -> password),
        ]);
        
        
       
    }
    
    public function addCinema(Request $req) {
       
        if(Auth::check()){
            $cityArr = \App\Models\city::where("city_id","=",$req -> cityId)->get();
            if(sizeof($cityArr) > 0){
                $city = $cityArr[0];
                   return \App\Models\cinema::create([
                    'cinemaName' => $req -> cinemaName,
                    'cinemaAddress' => $req -> cinemaAddress,
                    'cityId' => $city ->city_id,    
                    'cinemaNo' => $req -> cinemaNo,
                    'seatCount' => $req -> seatCount,
                    'flag1' => '',
                    'flag2' => '',
                    'visible' => $req -> visible,    
                ]);
            }
            else{
                 return response()->json([
                    'error' => 'city ​​information cannot be blank',
                ],401);
            }
           
           
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
  
     public function addMovie(Request $req) {
        $user = Auth::user();
        if($user != null){
            $startdate =  \DateTime::createFromFormat('d/m/Y',$req -> startDate )->format('Y-m-d');
             $enddate =  \DateTime::createFromFormat('d/m/Y',$req -> endDate )->format('Y-m-d');
              return \App\Models\movie::create([
            'movieName' => $req -> movieName,
            'movieExp' => $req -> movieExp,
            'startDate' => $startdate,
            'endDate' => $enddate,
            'flag1' => '',
            'flag2' => '',
            'visible' => $req -> visible,    
        ]);
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
     public function addTicket(Request $req) {
        $user = Auth::user();
        if($user != null){
            $startdate =  \DateTime::createFromFormat('d/m/Y',$req -> ticketStartDate )->format('Y-m-d');
             $enddate =  \DateTime::createFromFormat('d/m/Y',$req -> ticketEndDate )->format('Y-m-d');
             $movie = \App\Models\movie::find($req -> movieId);
             if($movie != null){
                    return \App\Models\ticket::create([
                    'ticketName' => $req -> ticketName,
                    'ticketPrice' => $req -> ticketPrice,
                    'ticketDiscountPrice' => $req -> ticketDiscountPrice,
                    'ticketStartDate' => $startdate,
                    'ticketEndDate' => $enddate,
                    'movieId' => $movie -> id,
                    'flag2' => '',  
                    'visible' => $req -> visible,    
                ]);
             }
             else{
                   return response()->json([
                    'error' => 'missing field error',
                ],401);
             }
           
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
    public function setTicketAttendend(Request $req) {
        $user = Auth::user();
        if($user != null){
            $ticket = \App\Models\ticket::find($req -> ticketId);
            $cinema = \App\Models\cinema::find($req -> cinemaId);
            $movie = \App\Models\movie::find($req -> movieId);
            if($ticket != null && $cinema != null  && $movie != null){
                  for($count=1; $count <= $cinema -> seatCount;$count++){
                       \App\Models\ticket_attendend::create([
                            'ticketId' =>  $ticket -> id,
                            'cinemaId' =>  $cinema -> id,
                            'movieId' => $movie -> id,
                            'flag2' => '',
                            'seatNo' => $count,
                            'visible' => $req -> visible,    
                        ]);
                  }
                return response()->json([
                    'succes' => 'ticket assignment successful',
                ],200);
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
   
    
    public function getCity(Request $req) {
        $user = Auth::user();
        if($user != null){
            $city = \App\Models\city::all();
            
            if(sizeof($city) > 0 ){
                  
                     return response()->json([
                    'success' => $city,
                ],200);
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
    public function getCinemaByCity(Request $req) {
        $user = Auth::user();
        if($user != null){
            $cityArr = \App\Models\city::where("city_id","=",$req -> cityId)->get();
            
            if(sizeof($cityArr) == 1 ){
                  $city = $cityArr[0];
                   $cinemaArr = \App\Models\cinema::where("cityId","=",$city -> city_id)->get();
                     return response()->json([
                    'success' => $cinemaArr,
                ],200);
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
     public function getMoviesByCinema(Request $req) {
        $user = Auth::user();
        if($user != null){
            $cinema = \App\Models\cinema::find($req -> cinemaId);
            if($cinema != null) {
                 
                   
                   $attendendTicketArr = \Illuminate\Support\Facades\DB::table('ticket_attendend')
                    ->select('movieId', \Illuminate\Support\Facades\DB::raw('COUNT(*) as `count`'))
                    ->groupBy('movieId')
                    ->havingRaw('COUNT(*) > 1')
                    ->get();
                   $array = array();
                   for($count=0;$count < sizeof($attendendTicketArr);$count++){
                      $movies = \App\Models\movie::where("id","=",$attendendTicketArr[$count] -> movieId)->get(); 
                      array_push($array, $movies);
                   }
                   
                     return response()->json([
                    'success' => $array,
                ],200);
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
    public function getEmptySeatsByMovie(Request $req) {
        $user = Auth::user();
        if($user != null){
           $movie = \App\Models\movie::find($req -> movieId);
            if($movie != null) {
                   $ticket_attendendArr = \App\Models\ticket_attendend::where("movieId","=", $movie -> id)->get();
                        if(sizeof($ticket_attendendArr) > 0){
                              $array = array();
                        for($count=0;$count < sizeof($ticket_attendendArr);$count++){
                            $date = \Illuminate\Support\Carbon::now()->toDateTimeString();
                           $ticket_attendend = $ticket_attendendArr[$count];
                           $ticketbuyingArr = \App\Models\ticket_buying::where("ticketattendendId","=", $ticket_attendend -> id)->where("expiryDate",">=",$date )->get();
                           if(sizeof($ticketbuyingArr) == 0){
                               array_push($array, $ticket_attendend);
                           }

                        }

                          return response()->json([
                         'success' => $array,
                     ],200);
                   }
                   else{
                         return response()->json([
                            'error' => 'missing field error',
                        ],401);
                   }
                 
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
     public function setTicketBuying(Request $req) {
        $user = Auth::user();
        if($user != null){
            $ticket = \App\Models\ticket::find($req -> ticketId);
            $cinema = \App\Models\cinema::find($req -> cinemaId);
            $movie = \App\Models\movie::find($req -> movieId);
            $seats = explode(",", $req -> seats);//string 1,2,3,....
            if($ticket != null && $cinema != null && $movie != null){
                $ticketAttendendArr = \App\Models\ticket_attendend::where("ticketId","=",$ticket -> id)->where("cinemaId","=",$cinema -> id)->whereIn("seatNo",$seats)->get();
                if(sizeof($ticketAttendendArr) > 0)
                {
                    $duplicate = ApiController::checkSeatByCinema($ticketAttendendArr,$cinema -> id,$user -> id);
                    if($duplicate == false){
                        $expiryDate =  \DateTime::createFromFormat('d/m/Y H:i:s',$req -> expiryDate )->format('Y-m-d H:i:s');
                        try {
                            for($count=0; $count < sizeof($ticketAttendendArr);$count++){
                                $ticketAttendend = $ticketAttendendArr[$count];
                                $ticket_buying = \App\Models\ticket_buying::create([
                                  'ticketattendendId' => $ticketAttendend -> id,
                                  'cinemaId' =>  $cinema -> id,
                                  'userId' =>  $user -> id,
                                  'ticketCount' => sizeof($seats),  
                                  'seatNo' => $ticketAttendend -> seatNo,
                                  'expiryDate' => $expiryDate,  
                                  'visible' => $req -> visible,    
                              ]);
                            }
                            
                             return response()->json([
                            'success' => 'purchase successful',
                        ],200);


                         } catch (Exception $e) {
                        return response()->json([
                        'error' => 'purchase failed',
                        ],401);
                         }
                    }
                    else{
                          return response()->json([
                        'error' => 'the selected seat number is full',
                        ],401);
                    }
                      
                }
                else{
                    return response()->json([
                    'error' => 'the selected ticket is not available at the selected cinema',
                    ],401);
                }
              
            }
            else{
                 return response()->json([
                    'error' => 'missing field error',
                ],401);
            }
            
        }
        else{
              return response()->json([
               'error' => 'Unauthorized',
           ],401);
        }
    }
    
      public function checkSeatByCinema($arrTicketAttendend,$cinemaId,$userId) {
        $duplicate = false;
        $date = \Illuminate\Support\Carbon::now()->toDateTimeString();
        for($c= 0; $c < sizeof($arrTicketAttendend);$c++){
            $ticketAttendend = $arrTicketAttendend[$c];
            $ticket_buyingArr = \App\Models\ticket_buying::where("ticketattendendId","=",$ticketAttendend -> id)->where("cinemaId" ,"=",$cinemaId)->where("userId" ,"=",$userId)->where("expiryDate",">=",$date )->get();
            if(sizeof($ticket_buyingArr) > 0){
                for($count =0;$count < sizeof($ticket_buyingArr);$count++){
                    $ticket_buying = $ticket_buyingArr[$count];
                    if($ticket_buying -> seatNo == $ticketAttendend -> seatNo){
                          $duplicate = true;
                                break 2;
                    }
                    
                }
            }
        }
        
        
        return $duplicate;
    }
    
    
    
    
   
}
