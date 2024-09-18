<?php

namespace App\Http\Controllers;

use App\Models\Exhibitor;
use Illuminate\Http\Request;

class ExhibitorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        return view('exhibitor-request-form');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $form = $request->all();
        $form['event_id'] = '1';
        $form['status'] = 'pending';
        $exhibitor = Exhibitor::create($form);
        
        return redirect()->route('view.request.form')->withSuccess('Exhibitor Registered Successfully!');
    }

}
