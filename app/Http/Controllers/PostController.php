<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use App\Models\userConnection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Validator;
use DB;



class PostController extends Controller
{
    //
    function udata()
    {

    }

    public function home()
    {
        $id = Auth::id();
        $allUsers =  User::where('id','!=',$id)
                        ->get();

        $u1 = User::find($id);

        $allUser = collect();

        foreach( $allUsers as $usr){
        
            $theta = $u1->longitude - $usr->longitude; 
            $dist = sin(deg2rad($u1->latitude)) * sin(deg2rad($usr->latitude)) +  cos(deg2rad($u1->latitude)) * cos(deg2rad($usr->latitude)) * cos(deg2rad($theta)); 
            $dist = acos($dist); 
            $dist = rad2deg($dist); 
            $miles = $dist * 60 * 1.1515;

            $d = $miles * 1.609344;

            if($d < 5 ){

                $allUser->push($usr);  
            }

        }      


        return view('dashboard', compact('allUser'));
    }

    public function getLoc(Request $request)
    {

        $id = Auth::id();

        $usr                        = User::find($id); 
        $usr->latitude              = $request->get('lat');
        $usr->longitude             = $request->get('lng');

        $usr->save();

        $usr = User::find($id); 

        return json_encode($usr);
    }

    public function match(Request $request)
    {

        $primaryUser = Auth::id();
        $secondaryUser = $request->get('id');

        $usr                       = new userConnection();
        $usr->primaryUser          = $primaryUser;
        $usr->secondaryUser        = $secondaryUser;
        $usr->liked                = 1;

        $usr->created_by           = $primaryUser;
        $usr->created_at           = Carbon::now()->timestamp;

        $usr->save();

        $match = userConnection::where('primaryUser',$secondaryUser)
                                ->where('secondaryUser',$primaryUser)
                                ->where('liked',1)
                                ->count();
        if($match > 0){
            $msg = "Congratulations! it's a match";
        }

        else{

            $msg = "You liked the profile";
        }

        return json_encode($msg);
    }

    public function matchCheck(Request $request)
    {

        $primaryUser = Auth::id();
        $secondaryUser = $request->get('id');

        $match = userConnection::where('primaryUser',$secondaryUser)
                                ->where('secondaryUser',$primaryUser)
                                ->where('liked',1)
                                ->count();

        $match2 = userConnection::where('primaryUser',$primaryUser)
                                ->where('secondaryUser',$secondaryUser)
                                ->where('liked',1)
                                ->count();

        if($match > 0 && $match2 > 0 ){

            $match =1;
        }
        else{

            $match = 0;
        }

        return json_encode($match);
    }

    public function profileDetails($id)
    {

        $usr                        = User::find($id);

        return view('profileDetails', compact('usr'));
    }

    public function disliked($id)
    {
        $primaryUser = Auth::id();

        $usr                       = new userConnection();
        $usr->primaryUser          = $primaryUser;
        $usr->secondaryUser        = $id;
        $usr->liked                 = 0;

        $usr->created_by           = $primaryUser;
        $usr->created_at           = Carbon::now()->timestamp;


        $usr->save();

        return redirect()->route("dashboard");

    }

    function login(Request $req)
    {
        $user = User::where('email',$req->email)->first();

        if(!$user || !Hash::check($req->password,$user->password))
        {

            return "Email or Password does not match";
            
        }
        return $user;
    }

    public function point2point_distance($lat1, $lon1, $lat2, $lon2) 
    { 
        $theta = $lon1 - $lon2; 
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta)); 
        $dist = acos($dist); 
        $dist = rad2deg($dist); 
        $miles = $dist * 60 * 1.1515;

        $d = $miles * 1.609344;
        
        return $d;
      
    } 
}
