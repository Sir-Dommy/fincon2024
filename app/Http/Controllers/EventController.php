<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Event;
use App\Models\Venue;
use App\Models\Location;
use App\Models\Category;
use App\Models\EventType;
use App\Models\Organizer;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
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
        $organizer = Organizer::where('user_id', Auth::guard('web')->user()->id)->first();

        if($organizer != null)
        {
            $data = [
                'events' => Event::where('organizer_id', $organizer->id)->paginate(10)
            ];
            return view('users.user-events', $data);
        } else {
            return redirect()->route('organizers.create')->withInfo('You need to have an Event Organizer Profile for you to post an Event. Enter details of the event organizer to continue!');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $organizers = Organizer::where('user_id', Auth::guard('web')->user()->id)->get();

        if(count($organizers) > 0)
        {
            return view('users.create-event')->withOrganizers($organizers)->withCategories(Category::all())->withEventtypes(EventType::all());
        } else {
            return redirect()->route('organizers.create')->withInfo('You need to have an Event Organizer Profile for you to post an Event. Enter details of the event organizer to continue!');
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreEvent $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['title']);
        $logo_image_path = time().$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/events/', $file, $logo_image_path, 'public');
        $form = $request->all();
        $form['code'] = Str::random(6).'USR';
        $form['slug'] = $slug;
        if ($path) {
            $form['cover_img'] = $logo_image_path;
        }
        //create location details
        $form2['name'] = $request->location;
        $location = Location::create($form2);

        //create venue details
        $form1['name'] = $request->venue;
        $form1['location_id'] = $location->id;
        $venue = Venue::create($form1);

        $form['venue_id'] = $venue->id;
        $event = Event::create($form);
        return redirect()->route('events.index')->withSuccess('Event Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $event = Event::find($id);
        return view('users.event-details')->withEvent($event);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $event = Event::find($id);
        return view('users.edit-event')->withEvent($event)->withOrganizers(Organizer::where('user_id', Auth::guard('web')->user()->id)->get())->withCategories(Category::all())->withEventtypes(EventType::all());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateEvent $request, $id)
    {
        $event = Event::find($id);

        /*Update Location and venue details using name
        $getlocation = Location::where('name', 'like', $request->location)->first();
        $getvenue = Venue::where('name', 'like', $request->venue)->first();

        if($getlocation != null && $getvenue != null) {
            $location_id = $getlocation->id;
            $getvenue->location_id = $location_id;
            $getvenue->save();
            $event->venue_id = $getvenue->id;
        } else if ($getlocation != null && $getvenue == null) {
            $location_id = $getlocation->id;
            $form1['name'] = $request->venue;
            $form1['location_id'] = $location_id;
            $venue = Venue::create($form1);
            $event->venue_id = $venue->id;
        } else if ($getlocation == null && $getvenue != null) {
            $event->venue_id = $getvenue->id;
            $form2['name'] = $request->location;
            $location = Location::create($form2);
            $location_id = $location->id;
            $getvenue->location_id = $location_id;
            $getvenue->save();
        } else if ($getlocation == null && $getvenue == null) {
            //create location details
            $form2['name'] = $request->location;
            $location = Location::create($form2);

            //create venue details
            $form1['name'] = $request->venue;
            $form1['location_id'] = $location->id;
            $venue = Venue::create($form1);
            $event->venue_id = $venue->id;
        }*/

        $getlocation = Location::where('id', $request->location_id)->first();
        $getvenue = Venue::where('id', $request->venue_id)->first();

        //update location details
        $getlocation->name = $request->location;
        $getlocation->save();

        //update venue details
        $getvenue->name = $request->venue;
        $getvenue->save();

        $event->fill($request->all());
        $slug = Str::slug($request['title']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/events/'. $event->cover_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $logo_image_path = time().$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/events/', $file, $logo_image_path, 'public');
            //dd($path);

            $event->cover_img = $logo_image_path;                                                                                                   
        }
        $event->slug = $slug;
        $event->save();
        return redirect()->route('events.index')->withSuccess('Event Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $event = Event::find($id);
        //remove file
        Storage::delete('/public/events/'. $event->logo);
        $event->delete(true);
        return redirect()->route('events.index')->withSuccess('Event Deleted!');
    }
}
