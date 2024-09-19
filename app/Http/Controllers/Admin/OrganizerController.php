<?php

namespace App\Http\Controllers\Admin;

use App\Models\Organizer;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class OrganizerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'organizers' => Organizer::latest()->paginate(10)
        ];
        return view('admin.organizer.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.organizer.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreOrganizer $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['name']);
        $logo_image_path = $slug . '.' . $ext;
        $path = Storage::putFileAs('/public/organizers/', $file, $logo_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['logo'] = $logo_image_path;
        }
        $organizer = Organizer::create($form);
        return redirect()->route('admin.organizers.index')->withSuccess('Organizer Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function show(Organizer $organizer)
    {
        return view('admin.organizer.show')->withOrganizer($organizer);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function edit(Organizer $organizer)
    {
        return view('admin.organizer.edit')->withOrganizer($organizer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateOrganizer $request, Organizer $organizer)
    {
        $organizer->fill($request->all());
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/organizers/'. $organizer->logo);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $slug = Str::slug($request['name']);

            $logo_image_path = $slug . '.' . $ext;

            $path = Storage::putFileAs('/public/organizers/', $file, $logo_image_path, 'public');
            //dd($path);

            $organizer->logo = $logo_image_path;                                                                                                   
        }
        $organizer->save();
        return redirect()->route('admin.organizers.index')->withSuccess('Organizer Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Organizer $organizer)
    {
        //remove file
        Storage::delete('/public/organizers/'. $organizer->logo);
        $organizer->delete(true);
        return redirect()->route('admin.organizers.index')->withSuccess('Organizer Deleted!');
    }
}
