<?php

namespace App\Http\Controllers\Admin;

use App\Models\Ticket;
use App\Models\Event;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;

class TicketController extends Controller
{
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
    public function store(Requests\StoreTicket $request)
    {
        $form = $request->all();
        $form['code'] = Str::random(4).date('dmy');
        $ticket = Ticket::create($form);
        return redirect()->route('admin.events.show', $request->event_id)->withSuccess('Ticket Ticket Created!');
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
    public function update(Requests\UpdateTicket $request, Ticket $ticket)
    {
        $ticket->fill($request->all());
        $ticket->save();
        return redirect()->route('admin.events.show', $ticket->event_id)->withSuccess('Ticket Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ticket $ticket)
    {
        $event_id = $ticket->event_id;
        $ticket->delete(true);
        return redirect()->route('admin.events.show', $event_id)->withSuccess('Ticket Deleted!');
    }
}
