<?php

namespace App\Http\Controllers;

use App\Models\OrderTicketDetail;
use Illuminate\Http\Request;

class OrderTicketDetailController extends Controller
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
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\OrderTicketDetail  $orderTicketDetail
     * @return \Illuminate\Http\Response
     */
    public function show(OrderTicketDetail $orderTicketDetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\OrderTicketDetail  $orderTicketDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(OrderTicketDetail $orderTicketDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\OrderTicketDetail  $orderTicketDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, OrderTicketDetail $orderTicketDetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\OrderTicketDetail  $orderTicketDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(OrderTicketDetail $orderTicketDetail)
    {
        //
    }
}
