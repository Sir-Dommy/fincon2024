<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use App\Models\Event;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class TicketController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('verified');
    }

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('attending');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function payments()
    {
        return view('users.tickets');
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function checkout(Request $request)
    {
        //store info in session
        $request->session()->put('event_id', $request->event_id);
        $request->session()->put('ticket_id', $request->ticket_id);
        $request->session()->put('currency', $request->currency);
        $request->session()->put('price', $request->price);
        $request->session()->put('qty', $request->qty);
        $request->session()->put('name', $request->name);
        $request->session()->put('email', $request->email);
        $request->session()->put('phone', $request->phone);
        $request->session()->put('company', $request->company);
        $request->session()->put('job_title', $request->job_title);
        $request->session()->put('address', $request->address);
        $request->session()->put('paymode', $request->paymode);
        
        return redirect()->route('order.payments');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreTicket $request)
    {
        $form = $request->all();
        $form['code'] = Str::random(4).date('dmy');
        $ticket = Ticket::create($form);
        return redirect()->route('events.show', $request->event_id)->withSuccess('Ticket Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function show(Ticket $ticket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Ticket $ticket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateTicket $request, $id)
    {
        $ticket = Ticket::find($id);
        $ticket->fill($request->all());
        $ticket->save();
        return redirect()->route('events.show', $ticket->event_id)->withSuccess('Ticket Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $ticket = Ticket::find($id);
        $event_id = $ticket->event_id;
        $ticket->delete(true);
        return redirect()->route('events.show', $event_id)->withSuccess('Ticket Deleted!');
    }
}
