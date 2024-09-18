@extends('layouts.business')


@section('title', $event->title)

@section('description', '')

@section('content')

    <section>
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-12">
            <div class="card">
              <img src="{{ url('storage/events/'. $event->cover_img) }}" class="card-img-top" alt="...">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8 col-lg-8 col-sm-12">
                    <h5 class="text-orange">{{ \Carbon\Carbon::parse($event->from_date)->format('D, M d')}}</h5>
                    <h2 class="card-title">{{ $event->title }}</h2>
                    <p class="lead">{{ $event->short_desc }}</p>
                    <div class="card card-body bg-light">
                      <h5>Organized By: {{ $event->organizer->name }}</h5>
                    </div>

                      <br><br>
                      <h4 class="mb-4">Where and When</h4>

                      <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                          <h5>Date &amp; Time</h5>
                          <p>{{ \Carbon\Carbon::parse($event->from_date)->format('D, M d, Y') }} {{\Carbon\Carbon::parse($event->start_time)->format('g:i A') }} - {{ \Carbon\Carbon::parse($event->to_date)->format('D, M d, Y') }} {{\Carbon\Carbon::parse($event->end_time)->format('g:i A') }}</p>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                          <h5>Venue</h5>
                          <P class="text-muted">{{ $event->venue->name }}</P>
                          <p>{{ $event->venue->location->name }}</p>
                        </div>
                      </div>

                      <br><br><br>

                      <h4 class="mb-4">About this event</h4>

                      <p class="lead"> {{ $event->title }}</p>

                      <p class="lead">{!! $event->long_desc !!}</p>

                      <br><br><br>

                      <h4 class="mb-4">About the organizer</h4>

                      <div class="card">
                        <div class="card-body text-center">
                          <small>Organized By:</small>
                          <h4>{{ $event->organizer->name }}</h4>
                          <p>{{ $event->organizer->short_desc }}</p>

                          <a href="{{ $event->website }}" target="_blank" class="btn btn-link">{{ $event->website }}</a>
                        </div>
                      </div>

                  </div>
                  <div class="col-md-4 col-lg-4 col-sm-12">
                    <div class="card">
                      <div class="card-body">


                        {{--<a href="{{ $event->website }}" target="_blank" class="btn btn-warning btn-block btn-lg">Details &amp; Tickets</a>--}}




                        <form action="{{ url('checkout') }}" method="POST">
                          {{ csrf_field() }}
                        <input type="hidden" name="event_id"  value="{{ $event->id }}">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>Ticket</th>
                              <th>Price</th>
                              <th>Quantiry</th>
                              <th>Total Price</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($event->tickets as $ticket)
                            <tr>
                              <td>
                                {{ $ticket->name }} <br><small>Closes on: {{ $ticket->purchase_to }}</small>
                                <input type="hidden" name="ticket_id" value="{{ $ticket->id }}">
                                <input type="hidden" name="price" value="{{ $ticket->price }}">
                              </td>
                              <td>{{ $ticket->price }}</td>
                              <td>
                                <select name="qty" class="form-control">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="6">6</option>
                                  <option value="7">7</option>
                                  <option value="8">8</option>
                                  <option value="9">9</option>
                                  <option value="10">10</option>
                                </select>
                              </td>
                              <td>
                                0.00
                              </td>
                            </tr>
                            @endforeach
                          </tbody>
                        </table>
                        <div class="form-group">
                          <button type="submit" class="btn btn-warning btn-block">Checkout</button>
                        </div>
                      </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

@endsection
