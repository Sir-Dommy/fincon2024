<?php

namespace App\Http\Controllers\Admin;

use App\Models\Location;
use App\Models\Speaker;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class SpeakerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'speakers' => Speaker::latest()->paginate(10)
        ];
        return view('admin.speaker.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.speaker.create')->withLocations(Location::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreSpeaker $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['name']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/speakers/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['profile_img'] = $cover_img_image_path;
        }
        $speaker = Speaker::create($form);
        return redirect()->route('admin.events.index')->withSuccess('Speaker Created!');   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Speaker  $speaker
     * @return \Illuminate\Http\Response
     */
    public function show(Speaker $speaker)
    {
        return view('admin.speaker.show')->withSpeaker($speaker);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Speaker  $speaker
     * @return \Illuminate\Http\Response
     */
    public function edit(Speaker $speaker)
    {
        return view('admin.speaker.edit')->withSpeaker($speaker);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venue  $speaker
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateSpeaker $request, Speaker $speaker)
    {
        $speaker->fill($request->all());
        $slug = Str::slug($request['name']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/speakers/'. $speaker->profile_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/speakers/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $speaker->profile_img = $cover_img_image_path;                                                                                                   
        }
        $speaker->save();
        return redirect()->route('admin.events.index')->withSuccess('Speaker Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Speaker  $speaker
     * @return \Illuminate\Http\Response
     */
    public function destroy(Speaker $speaker)
    {
        //remove file
        Storage::delete('/public/speakers/'. $speaker->profile_img);
        $speaker->delete(true);
        return redirect()->route('admin.events.index')->withSuccess('Speaker Deleted!');
    }
}
