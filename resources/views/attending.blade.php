@extends('layouts.guest-user')

@section('title', 'Ticket Type')

@section('content')

<section class="bg-light">
    <div class="container p-5">
        @php
            $event = App\Models\Event::first();
        @endphp

        <div class="row d-flex justify-content-center">
            <div class="col-md-8 col-lg-8 col-sm-12">
                @if($event->tickets->count() > 0)
                    <div class="carddd mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="card-body">
                                    @php
                                        $order = App\Models\Order::where('event_id', $event->id)->where('user_id', Auth::user()->id)->first();
                                    @endphp
                                    
                                    @if($order)
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title mb-4">Ticket Details</h4>
                                                
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <h5>Code</h5>
                                                        <p>{{ $order->trans_code }}</p>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <h5>Date</h5>
                                                        <p>{{ $order->created_at }}</p>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <h5>Status</h5>
                                                        <p>{{ $order->status }}</p>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <div class="responsive">
                                                            <table class="table table-stripped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Ticket Name</th>
                                                                        <th>Quantity</th>
                                                                        <th>Unit Price</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @foreach($order->orderitems as $item)
                                                                    <tr>
                                                                        <td>{{ $item->ticket->name }}</td>
                                                                        <td>{{ $item->qty }}</td>
                                                                        <td>{{ $item->currency }} {{ $item->price }}</td>
                                                                        <td>{{ $item->qty * $item->price }}</td>
                                                                    </tr>
                                                                    @endforeach
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                    <div class="cardmen mb-3">
                                        <div class="card-body">
                                            <div class="mt-5 mb-5 text-center">
                                            	<h2 class="mb-4">STEP 2 OUT OF 3: Attendance Ticket Type</h2>
                                            	<p class="lead">How would you like to perticipate?</p>
                                            </div>
                                            <ul class="step d-flex flex-nowrap">
                                                <li class="step-item">
                                                    <a href="#!" class="">Personal Information</a>
                                                </li>
                                                <li class="step-item active">
                                                    <a href="#!" class="">Attendance Ticket Type</a>
                                                </li>
                                                <li class="step-item">
                                                    <a href="#!" class="">Payment Information</a>
                                                </li>
                                            </ul> 
                                            <form action="{{ route('checkout.event.order') }}" method="POST">
                                                {{ csrf_field() }}
                                                <input type="hidden" name="event_id"  value="{{ $event->id }}">
                                                
                                                    <div class="row">
                                                        @foreach($event->tickets as $ticket)
                                                        <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                                        <input type="hidden" name="price" value="{{ $ticket->price }}">
                                                        <input type="hidden" name="qty" value="1">
                                                        <input type="hidden" name="name" value="{{ old('name', Auth::user()->name) }}">
                                                        <input type="hidden" name="email" value="{{ old('email', Auth::user()->email) }}">
                                                        <input type="hidden" name="phone" value="{{ old('phone', Auth::user()->phone) }}">
                                                            <div class="col-md-6 col-lg-6 col-sm-12">
                                                            
                                                                <label>
                                                                    <input type="radio" name="ticket_id" value="{{ $ticket->id }}" class="card-input-element" required/>
                                                        
                                                                    <div class="card card-default card-input">
                                                                        <div class="card-header"><h4>{{ $ticket->name }}</h4></div>
                                                                        <div class="card-body">
                                                                            <h5>{{ $ticket->currency }} {{ number_format($ticket->price, 0) }}</h5>
                                                                            <p>{{ $ticket->desc }}</p>
                                                                        </div>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                    
                                                    <div class="form-row">
                                                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                                          <label>Your Company Name</label>
                                                          <input type="text" name="company" value="{{ old('company') }}" class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                                          <label>Your Job Title</label>
                                                          <input type="text" name="job_title" value="{{ old('job_title') }}" class="form-control">
                                                        </div>
                                                        <!--<div class="form-group col-md-12 col-lg-12 col-sm-12">
                                                          <label>Address</label>
                                                          <textarea class="form-control" name="address" rows="2">{{ old('address') }}</textarea>
                                                        </div>-->
                                                    </div>
                                                    
                                                    <br>
                                                    <h5 class="mb-3">How will you pay for your ticket?</h5>
                                                    
                                                      
                                                    <div class="row">
                                                        
                                                        <div class="col-md-12 col-lg-12 col-sm-12">
                                                            
                                                            <label>
                                                              <input type="radio" name="paymode" id="paymode" value="bankdeposit" required class="card-input-element" />
                                                    
                                                                <div class="card card-default card-input">
                                                                  <div class="card-body">
                                                                    Bank Deposit
                                                                  </div>
                                                                </div>
                                                    
                                                            </label>
                                                            
                                                          </div>
                                                          <div class="col-md-12 col-lg-12 col-sm-12">
                                                            
                                                            <label>
                                                              <input type="radio" name="paymode" id="paymode" value="mpesa" required class="card-input-element" />
                                                    
                                                                <div class="card card-default card-input">
                                                                  <div class="card-body">
                                                                    Pay with M-PESA
                                                                  </div>
                                                                </div>
                                                            </label>
                                                            
                                                          </div>
                                                    </div>
                                                  
                                                <div class="form-group">
                                                  <button type="submit" class="btn btn-yellow rounded-pill">Continue</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @else
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="mt-5 mb-5 text-center">
                            	<h2 class="mb-4">STEP 2 OUT OF 3: Attendance Ticket Type</h2>
                            	<p class="lead">How would you like to perticipate?</p>
                            </div>
                            <ul class="step d-flex flex-nowrap">
                                <li class="step-item">
                                    <a href="#!" class="">Personal Information</a>
                                </li>
                                <li class="step-item active">
                                    <a href="#!" class="">Attendance Ticket Type</a>
                                </li>
                                <li class="step-item">
                                    <a href="#!" class="">Payment Information</a>
                                </li>
                            </ul>
                            
                            <form action="{{ route('checkout.event.order') }}" method="POST">
                                {{ csrf_field() }}
                                <input type="hidden" name="event_id"  value="{{ $event->id }}">
                                
                                    <div class="row">
                                        @foreach($event->tickets as $ticket)
                                        <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                        <input type="hidden" name="price" value="{{ $ticket->price }}">
                                        <input type="hidden" name="qty" value="1">
                                            <div class="col-md-6 col-lg-6 col-sm-12">
                                            
                                                <label>
                                                    <input type="radio" name="ticket_id" value="{{ $ticket->id }}" class="card-input-element" required/>
                                        
                                                    <div class="card card-default card-input">
                                                        <div class="card-header"><h4>{{ $ticket->name }}</h4></div>
                                                        <div class="card-body">
                                                            <h5>{{ $ticket->currency }} {{ number_format($ticket->price, 0) }}</h5>
                                                            <p>{{ $ticket->desc }}</p>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                          <label>Your Company Name</label>
                                          <input type="text" name="company" value="{{ old('company') }}" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                          <label>Your Job Title</label>
                                          <input type="text" name="job_title" value="{{ old('job_title') }}" class="form-control">
                                        </div>
                                        <!--<div class="form-group col-md-12 col-lg-12 col-sm-12">
                                          <label>Address</label>
                                          <textarea class="form-control" name="address" rows="2">{{ old('address') }}</textarea>
                                        </div>-->
                                    </div>
                                    
                                    <br>
                                    <h5 class="mb-3">How will you pay for your ticket?</h5>
                                    
                                      
                                    <div class="row">
                                        
                                        <div class="col-md-12 col-lg-12 col-sm-12">
                                            
                                            <label>
                                              <input type="radio" name="paymode" id="paymode" value="bankdeposit" required class="card-input-element" />
                                    
                                                <div class="card card-default card-input">
                                                  <div class="card-body">
                                                    Bank Deposit
                                                  </div>
                                                </div>
                                    
                                            </label>
                                            
                                          </div>
                                          <div class="col-md-12 col-lg-12 col-sm-12">
                                            
                                            <label>
                                              <input type="radio" name="paymode" id="paymode" value="mpesa" required class="card-input-element" />
                                    
                                                <div class="card card-default card-input">
                                                  <div class="card-body">
                                                    Pay with M-PESA
                                                  </div>
                                                </div>
                                            </label>
                                            
                                          </div>
                                    </div>
                                  
                                <div class="form-group">
                                  <button type="submit" class="btn btn-yellow rounded-pill">Continue</button>
                                </div>
                            </form>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</section>

@endsection

@push('styles')
    <style>
        /**
          Component
        **/
        
        label {
            width: 100%;
        }
        
        .card-input-element {
            display: none;
        }
        
        .card-input {
            margin: 10px;
            padding: 0px;
        }
        
        .card-input:hover {
            cursor: pointer;
        }
        
        .card-input-element:checked + .card-input {
             box-shadow: 0 0 1px 1px #2ecc71;
        }
        
        /*
        *
        *WIZARD STEPS
        *
        */
        .step {
          list-style: none;
          margin: .2rem 0;
          width: 100%;
        }
        
        .step .step-item {
          -ms-flex: 1 1 0;
          flex: 1 1 0;
          margin-top: 0;
          min-height: 1rem;
          position: relative; 
          text-align: center;
        }
        
        .step .step-item:not(:first-child)::before {
          background: #0069d9;
          content: "";
          height: 2px;
          left: -50%;
          position: absolute;
          top: 9px;
          width: 100%;
        }
        
        .step .step-item a {
          color: #acb3c2;
          display: inline-block;
          padding: 20px 10px 0;
          text-decoration: none;
        }
        
        .step .step-item a::before {
          background: #0069d9;
          border: .1rem solid #fff;
          border-radius: 50%;
          content: "";
          display: block;
          height: .9rem;
          left: 50%;
          position: absolute;
          top: .2rem;
          transform: translateX(-50%);
          width: .9rem;
          z-index: 1;
        }
        
        .step .step-item.active a::before {
          background: #fff;
          border: .1rem solid #0069d9;
        }
        
        .step .step-item.active ~ .step-item::before {
          background: #e7e9ed;
        }
        
        .step .step-item.active ~ .step-item a::before {
          background: #e7e9ed;
        }
    </style>
@endpush
