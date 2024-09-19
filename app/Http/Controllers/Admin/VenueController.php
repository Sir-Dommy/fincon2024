<?php

namespace App\Http\Controllers\Admin;

use App\Models\Location;
use App\Models\Venue;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class VenueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'venues' => Venue::latest()->paginate(10)
        ];
        return view('admin.venue.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.venue.create')->withLocations(Location::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreVenue $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['name']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/venues/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['cover_img'] = $cover_img_image_path;
        }
        $venue = Venue::create($form);
        return redirect()->route('admin.venues.index')->withSuccess('Venue Created!');   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function show(Venue $venue)
    {
        return view('admin.venue.show')->withVenue($venue);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function edit(Venue $venue)
    {
        return view('admin.venue.edit')->withVenue($venue)->withLocations(Location::all());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateVenue $request, Venue $venue)
    {
        $venue->fill($request->all());
        $slug = Str::slug($request['name']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/venues/'. $venue->cover_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/venues/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $venue->cover_img = $cover_img_image_path;                                                                                                   
        }
        $venue->save();
        return redirect()->route('admin.venues.index')->withSuccess('Venue Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function destroy(Venue $venue)
    {
        //remove file
        Storage::delete('/public/venues/'. $venue->cover_img);
        $venue->delete(true);
        return redirect()->route('admin.venues.index')->withSuccess('Venue Deleted!');
    }
}
