<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Models\Image;
use App\Models\Event;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class EventController extends Controller
{
    public function login(Request $request){
        try{
            $request->validate([
                "username" => "required",
                "password" => "required"
            ]);
        }catch(ValidationException $e){
            return $e->errors();
        }

        if(Auth::attempt([
            "email" => $request->username,
            "password" => $request->password,
        ]
        )){
            $user = Auth::user();
            $token = $user->createToken('myToken')->accessToken;
    
            return response()->json([
                "status" => true,
                "message" => "Login Successful",
                "access_token" => $token
            ]);
        }
        return response()->json([
            "status" => false,
            "message" => "Invalid credentials"
        ]);
        
    }
    public function create(Request $request)
    {
        //dd($request->all());
        $imageData = $request->photo;
        $decodeImage = base64_decode($imageData);
        $filename = Str::uuid(). '.jpg';
        Storage::disk('public')->put('images/'. $filename, $decodeImage);
        $photosArr = [
            "photo" => $filename,
            "datetime" => $request->publish_datetime
        ];
        try{
            $request->validate([
                "title" => 'required',
                'category' => 'required',
            ]);
        }catch(ValidationException $e){
            return $e->errors();
        }
        $user = Auth::user();
        $createEvent = Event::create([
            "title" => $request->title,
            "description" => $request->description,
            "category" => $request->category,
            "photos" => json_encode($photosArr),
            "until_datetime" => $request->until_datetime,
            "user_id" => $user->id
        ]);
        if($createEvent){
            return response()->json([
                "status" => true,
                "message" => "Event created successfully."
            ]);
        }else{
            return response()->json([
                "status" => false,
                "message" => "Event creation failed."
            ]);
        }
    }

    public function update($id)
    {
        
    }

    public function destroy($id)
    {
        $getRecord = Event::findOrFail($id);
        $deleteRecord = $getRecord->delete();
        if($deleteRecord){
            return response()->json([
                "status" => true,
                "message" => "Record Deleted Successfully."
            ]);
        }
    }

    public function show(Request $request)
    {
        //$userTimeZone = $request->user()->timezone;
        $userTimeZone = $request->timezone;
        $events = Event::all();
        foreach($events as $event){
            $event->until_datetime = Carbon::parse($event->until_datetime)->setTimezone($userTimeZone)->toDateTimeString();
            $event->created_at = Carbon::parse($event->created_at)->setTimezone($userTimeZone)->toDateTimeString();
            $event->updated_at = Carbon::parse($event->updated_at)->setTimezone($userTimeZone)->toDateTimeString();
        }
        
        $user = Auth::user();
        return response()->json($events->toArray());
    }

    public function updateTimeZone(Request $request)
    {
        dd($request->all());
    }

    public function Eventlist()
    {
        $user = Auth::user();
        dd($user);
        $events = Event::all();
        return view('/event/list',compact('events'));
    }
}
