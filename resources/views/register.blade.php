@extends('layouts.business')

@section('title', 'Register')

@section('content')
<section class="testimonials bg-light">
    <div class="container h-custom">`
        
        @php
            $event = App\Models\Event::first();
        @endphp
        
        <div class="row d-flex justify-content-center align-items-center h-100 mb-5 mt-4">
            <div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 ">
                <div class="py-5">
                    <h2>Register for your FinCon2024 Delegate Account</h2>
                    <p class="lead">Registration offers access to our two-day conference and exposition, professional education program plus networking events and activities. What are you waiting for? Let’s go.</p>
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-lg-6 col-xl-6 ">
                <div class="card mt-4 border border-white rounded-lg shadow p-3 mb-5 bg-white">
                    <div class="card-body py-5 px-md-5">
                        <h4 class="card-title mb-5">Delegate Registration</h4>
                        
                        <form method="POST" action="{{ route('registration.store') }}">
                            @csrf

                            <input type="hidden" name="event_id"  value="{{ $event->id }}">
                            
                            
                            <div class="form-label-group">
                                <input type="text" name="name" value="{{ old('name') }}" id="inputName" class="form-control @error('name') is-invalid @enderror" placeholder="Enter your full name" required>
                                <label for="inputName">Your Name</label>
                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="form-label-group">
                                <input id="inputEmail" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" placeholder="Enter valid email address" required>
                                <label for="inputEmail">Email address</label>
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="form-label-group">
                                <input id="inputPhone" type="tel" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{ old('phone') }}" placeholder="Enter a valid phone number" required required>
                                <label for="inputPhone">Phone Number</label>
                                @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="form-label-group">
                                <input id="inputCompany" type="tel" class="form-control @error('company') is-invalid @enderror" name="company" value="{{ old('company') }}">
                                <label for="inputCompany">Your Company Name</label>
                                @error('company')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="form-label-group">
                                <input id="inputJob_title" type="tel" class="form-control @error('job_title') is-invalid @enderror" name="job_title" value="{{ old('job_title') }}">
                                <label for="inputJob_title">Your Job Title</label>
                                @error('job_title')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <br>
                            <h5 class="mb-3">Select your ticket type</h5>
                            
                            <div class="row">
                                @foreach($event->tickets as $ticket)
                                <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                <input type="hidden" name="price" value="{{ $ticket->price }}">

                                <!-- <input type="hidden" name="price" value="1"> -->
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

                                  
                                  <div class="col-md-12 col-lg-12 col-sm-12">
                                    
                                    <label>
                                      <input type="radio" name="paymode" id="paymode" value="dpo" required class="card-input-element" />
                            
                                        <div class="card card-default card-input">
                                          <div class="card-body">
                                            Pay with DPO (You will be redirected to DPO wbsite to complete payement)
                                          </div>
                                        </div>
                                    </label>
                                    
                                  </div>
                            </div>
                            
                            
                            <!--<div class="form-row">
                                <div class="form-label-group col-6">
                                    <input id="inputPassword" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Min 8 characters" required required>
                                    <label for="inputPassword">Password</label>
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                
                                <div class="form-label-group col-6">
                                    <input id="inputConfirmPassword" type="password" class="form-control" name="password_confirmation" placeholder="Confirm your password" required>
                                    <label for="inputConfirmPassword">Confirm Password</label>
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>-->


                            <!-- Submit button -->
                            <button type="submit" class="btn btn-yellow btn-block mb-4">
                              Submit
                            </button>
                        </form>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <p class="small fw-bold mt-2 pt-1 mb-0">Already have a delegate account? <a href="{{ route('login') }}"
                            class="link-danger">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <div class="row d-flex justify-content-center align-items-center mt-5">
            <div class="col-md-6 col-lg-6 col-sm-12">
               <div class="card mb-3 border border-primary rounded shadow p-3 mb-5 bg-white rounded">
                  <div class="row no-gutters">
                    <div class="col-md-4">
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5TPjBgLw3_QXQnBwp8Wdar9IjA6yElPu0uA&s" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title">INTERESTED IN EXHIBITING AT FINCON2024?</h5>
                        <p class="card-text">Exhibiting at FinCon2024 opens your door to global decision makers with qualified buying power.</p>
                        <a href="{{ route('view.request.form') }}" class="btn btn-yellow rounded-pill btn-lg">Book Your Booth</a>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@push('styles')
    <style type="text/css">
        .divider:after,
        .divider:before {
          content: "";
          flex: 1;
          height: 1px;
          background: #eee;
        }
        .h-custom {
          height: calc(100% - 73px);
        }
        @media (max-width: 450px) {
          .h-custom {
            height: 100%;
          }
        }
        
        /*
        *
        *CARD RADIO BUTTONS
        *
        */
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
    </style>
@endpush
