<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Venue;
use App\Models\Location;
use App\Models\Category;
use App\Models\EventType;
use App\Models\Organizer;
use App\Http\Requests;
use Illuminate\Http\Request;

class BrowseEventsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'events' => Event::where('to_date', '>', date('Y-m-d'))->paginate(20)
        ];
        return view('events', $data);
    }



    public function search(Request $request)
    {
        $search_text = $request->search;
        $search_venue = $request->city;
        $data = [
            'events' => Event::with('venue.location')->join('venues', 'events.venue_id', '=', 'venues.id')->where('title', 'like', $search_text)->paginate(20)
        ];
        /*$data = [
            'events' => Location::with('events')->where('name', 'like', $search_venue)->paginate(20)
        ];
        dd($data);*/
        return view('events', $data);
    }




    public function details($slug)
    {
        $event = Event::where('slug', $slug)->first();
        return view('event')->withEvent($event);
    }

    
}
