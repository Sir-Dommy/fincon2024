<?php

namespace App\Http\Controllers\Admin;

use App\Models\Event;
use App\Models\Category;
use App\Models\EventType;
use App\Models\Venue;
use App\Models\VenueRoom;
use App\Models\Organizer;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'events' => Event::latest()->paginate(10)
        ];
        return view('admin.event.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.event.create')->withOrganizers(Organizer::all())->withCategories(Category::all())->withEventtypes(EventType::all())->withVenues(Venue::all());
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
        $form['code'] = Str::random(6);
        $form['slug'] = $slug;
        if ($path) {
            $form['cover_img'] = $logo_image_path;
        }
        $event = Event::create($form);
        return redirect()->route('admin.events.index')->withSuccess('Event Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function show(Event $event)
    {
        return view('admin.event.show')->withEvent($event)->withRooms(VenueRoom::where('venue_id', 1)->get());
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit(Event $event)
    {
        return view('admin.event.edit')->withEvent($event)->withOrganizers(Organizer::all())->withCategories(Category::all())->withEventtypes(EventType::all())->withVenues(Venue::all());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateEvent $request, Event $event)
    {
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
        return redirect()->route('admin.events.index')->withSuccess('Event Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function destroy(Event $event)
    {
        //remove file
        Storage::delete('/public/events/'. $event->logo);
        $event->delete(true);
        return redirect()->route('admin.events.index')->withSuccess('Event Deleted!');
    }
}
