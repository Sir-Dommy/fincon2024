<?php

namespace App\Http\Controllers\Admin;

use App\Models\Location;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'locations' => Location::latest()->paginate(10)
        ];
        return view('admin.location.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.location.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreLocation $request)
    {
        $form = $request->all();
        $location = Location::create($form);
        return redirect()->route('admin.locations.index')->withSuccess('Location Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function show(Location $location)
    {
        return view('admin.location.show')->withLocation($location);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function edit(Location $location)
    {
        return view('admin.location.edit')->withLocation($location);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateLocation $request, Location $location)
    {
        $location->fill($request->all());
        $location->save();
        return redirect()->route('admin.locations.index')->withSuccess('Location Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function destroy(Location $location)
    {
        $location->delete(true);
        return redirect()->route('admin.locations.index')->withSuccess('Location Deleted!');
    }
}
