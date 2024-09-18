<?php

namespace App\Http\Controllers;

use App\Models\Speaker;
use App\Models\Event;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SpeakerController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('verified');
    }

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('users.speakers');
    }

   
   
   public function show($id)
   {
       return view('users.speaker')->withSpeaker(Speaker::find($id));
   }
}
