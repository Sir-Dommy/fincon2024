<?php

namespace App\Http\Controllers\Admin;

use App\Models\Partner;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class PartnerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'partners' => Partner::latest()->paginate(10)
        ];
        
        dd($data);
        return view('admin.partner.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.partner.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StorePartner $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['name']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/partners/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['company_logo'] = $cover_img_image_path;
        }
        $partner = Partner::create($form);
        return redirect()->route('admin.events.index')->withSuccess('Event Partner Created!');   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Partner  $partner
     * @return \Illuminate\Http\Response
     */
    public function show(Partner $partner)
    {
        return view('admin.partner.show')->withPartner($partner);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Partner  $partner
     * @return \Illuminate\Http\Response
     */
    public function edit(Partner $partner)
    {
        return view('admin.partner.edit')->withPartner($partner);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venue  $partner
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdatePartner $request, Partner $partner)
    {
        $partner->fill($request->all());
        $slug = Str::slug($request['name']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/partners/'. $partner->company_logo);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/partners/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $partner->company_logo = $cover_img_image_path;                                                                                                   
        }
        $partner->save();
        return redirect()->route('admin.events.index')->withSuccess('Event Partner Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Partner  $partner
     * @return \Illuminate\Http\Response
     */
    public function destroy(Partner $partner)
    {
        //remove file
        Storage::delete('/public/partners/'. $partner->cover_img);
        $partner->delete(true);
        return redirect()->route('admin.events.index')->withSuccess('Partner Deleted!');
    }
}
