<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Organizer;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class OrganizerController extends Controller
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
        $data = [
            'organizers' => Organizer::where('user_id', Auth::guard('web')->user()->id)->paginate(10)
        ];
        return view('users.organizers', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.create-organizer');
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
        $form['user_id'] = Auth::guard('web')->user()->id;
        $organizer = Organizer::create($form);
        return redirect()->route('organizers.index')->withSuccess('Organizer Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function show(Organizer $organizer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $organizer = Organizer::find($id);
        return view('users.edit-organizer')->withOrganizer($organizer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateOrganizer $request, $id)
    {
        $organizer = Organizer::find($id);
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
        return redirect()->route('organizers.index')->withSuccess('Organizer Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Organizer  $organizer
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $organizer = Organizer::find($id);
        //remove file
        Storage::delete('/public/organizers/'. $organizer->logo);
        $organizer->delete(true);
        return redirect()->route('organizers.index')->withSuccess('Organizer Deleted!');
    }
}
