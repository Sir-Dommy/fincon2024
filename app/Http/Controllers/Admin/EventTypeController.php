<?php

namespace App\Http\Controllers\Admin;

use App\Models\EventType;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EventTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'eventtypes' => EventType::latest()->paginate(10)
        ];
        return view('admin.eventtype.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.eventtype.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreEventType $request)
    {
        $form = $request->all();
        $eventtype = EventType::create($form);
        return redirect()->route('admin.eventtypes.index')->withSuccess('EventType Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EventType  $eventtype
     * @return \Illuminate\Http\Response
     */
    public function show(EventType $eventtype)
    {
        return view('admin.eventtype.show')->withEventtype($eventtype);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventType  $eventtype
     * @return \Illuminate\Http\Response
     */
    public function edit(EventType $eventtype)
    {
        return view('admin.eventtype.edit')->withEventtype($eventtype);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EventType  $eventtype
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateEventType $request, EventType $eventtype)
    {
        $eventtype->fill($request->all());
        $eventtype->save();
        return redirect()->route('admin.eventtypes.index')->withSuccess('EventType Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EventType  $eventtype
     * @return \Illuminate\Http\Response
     */
    public function destroy(EventType $eventtype)
    {
        $eventtype->delete(true);
        return redirect()->route('admin.eventtypes.index')->withSuccess('EventType Deleted!');
    }
}
