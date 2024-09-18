@extends('layouts.business')

@section('title', 'Ticket Details')

@section('content')
    
    @php
      $event = App\Models\Event::find($inputs['event_id']);
    @endphp

    <section class="bg-light">
      <div class="container mt-5">
        <div class="row mb-5">
          <div class="col-md-8 col-lg-8 col-sm-12">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-tile">Ticket Details</h4>
                @php
                  $tickets = App\Models\Ticket::find($inputs['ticket_id']);
                @endphp

                  <form action="{{ route('checkout.event.order') }}" method="POST">
                    {{ csrf_field() }}
                    <input type="hidden" name="event_id" value="{{ $event->id }}">
                    <input type="hidden" name="ticket_id" value="{{ $inputs['ticket_id'] }}">
                    <input type="hidden" name="currency" value="{{ $tickets->currency }}">
                    <input type="hidden" name="price" value="{{ $tickets->price }}">
                    <input type="hidden" name="qty" value="{{ $inputs['qty'] }}">
                    <div class="form-group">
                      <label>Full Name</label>
                      <input type="text" name="name" value="{{ old('name', Auth::user()->name) }}" class="form-control" required>
                    </div>
                    <div class="form-row">
                      <div class="form-group col-md-6 col-lg-6 col-sm-12">
                        <label>Email</label>
                        <input type="email" name="email" value="{{ old('email', Auth::user()->email) }}" class="form-control" readonly="readonly">
                      </div>
                      <div class="form-group col-md-6 col-lg-6 col-sm-12">
                        <label>Phone</label>
                        <input type="tel" name="phone" value="{{ old('phone', Auth::user()->phone) }}" class="form-control" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Company</label>
                      <input type="text" name="company" value="{{ old('company') }}" class="form-control">
                    </div>
                    <div class="form-group">
                      <label>Job Title</label>
                      <input type="text" name="job_title" value="{{ old('job_title') }}" class="form-control">
                    </div>
                    <div class="form-group">
                      <label>Address</label>
                      <textarea class="form-control" name="address" rows="2">{{ old('address') }}</textarea>
                    </div>
                    <!-- Add logic to add ticket details of more than one ticket -->
                    
                    <br>
                    <h5 class="mb-3">How will you pay for your ticket?</h5>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymode" id="paymode" value="bankdeposit" required>
                            <label class="form-check-label" for="bankdeposit">
                            Bank Deposit
                        </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymode" id="paymode" value="mpesa" required>
                            <label class="form-check-label" for="mpesa">
                            Pay with M-PESA
                            </label>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div class="form-group">
                          <button type="submit" class="btn btn-yellow rounded-pill">Continue</button>
                        </div>
                        <div class="form-group">
                          <a href="{{ url('attending') }}" class="btn btn-yellow rounded-pill">Back</a>
                        </div>
                    </div>
                  </form>
                </div>
              </div>
          </div>
          <div class="col-md-4 col-lg-4 col-sm-12">
            <div class="card">
              <img src="{{ url('storage/events/'. $event->cover_img) }}" class="card-img-top" alt="...">
              <div class="card-body">
                <h4>{{ $event->title }}</h4>
                <p class="lead"><b>From Date:</b> {{ \Carbon\Carbon::parse($event->from_date)->format('D d M') }}</p>
                <p class="lead"><b>To Date:</b> {{ \Carbon\Carbon::parse($event->to_date)->format('D d M  Y') }}</p>
                
                <p class="lead"><b>Ticket Type:</b> {{ $inputs['qty'] }} - {{ $tickets->name }}</p>
                <p class="lead"><b>Ticket Amount:</b> {{ $tickets->currency.' '.$tickets->price }}</p>
              </div>
              <div class="card-header">
                <h4>Total Payable: {{ $tickets->currency.' '.$tickets->price * $inputs['qty'] }}</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

@endsection
