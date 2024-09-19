<?php

namespace App\Http\Controllers\Admin;

use App\Models\Agenda;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class AgendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'agendas' => Agenda::latest()->paginate(10)
        ];
        return view('admin.agenda.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.agenda.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreAgenda $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['title']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/agendas/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['cover_img'] = $cover_img_image_path;
        }
        $agenda = Agenda::create($form);
        return redirect()->route('admin.events.index')->withSuccess('Event Agenda Created!');   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function show(Agenda $speaker)
    {
        return view('admin.agenda.show')->withAgenda($agenda);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function edit(Agenda $agenda)
    {
        return view('admin.agenda.edit')->withAgenda($agenda);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venue  $speaker
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateAgenda $request, Agenda $agenda)
    {
        $agenda->fill($request->all());
        $slug = Str::slug($request['title']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/agendas/'. $agenda->cover_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/agendas/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $agenda->cover_img = $cover_img_image_path;                                                                                                   
        }
        $agenda->save();
        return redirect()->route('admin.events.index')->withSuccess('Event Agenda Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function destroy(Agenda $agenda)
    {
        //remove file
        Storage::delete('/public/agendas/'. $agenda->cover_img);
        $agenda->delete(true);
        return redirect()->route('admin.events.index')->withSuccess('Speaker Deleted!');
    }
}
