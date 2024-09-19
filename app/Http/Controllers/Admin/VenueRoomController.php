<?php

namespace App\Http\Controllers\Admin;

use App\Models\VenueRoom;
use App\Models\Venue;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class VenueRoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreVenueRoom $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['name']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/rooms/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['cover_img'] = $cover_img_image_path;
        }
        $venue = VenueRoom::create($form);
        return redirect()->route('admin.venues.show', $request->venue_id)->withSuccess('Venue Room Created!');   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function show(VenueRoom $venueroom)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function edit(VenueRoom $venueroom)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venue  $venue
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateVenueRoom $request, VenueRoom $venueroom)
    {
        $venueroom->fill($request->all());
        $slug = Str::slug($request['name']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/rooms/'. $venueroom->cover_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/rooms/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $venueroom->cover_img = $cover_img_image_path;                                                                                                   
        }
        
        $venueroom->save();
        return redirect()->route('admin.venues.index')->withSuccess('Venue Room Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Venue  $venueroom
     * @return \Illuminate\Http\Response
     */
    public function destroy(VenueRoom $venueroom)
    {
        //remove file
        Storage::delete('/public/rooms/'. $venueroom->cover_img);
        $venueroom->delete(true);
        return redirect()->route('admin.venues.index')->withSuccess('Venue Room Deleted!');
    }
}
