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
        <form action="{{ route('checkout.event.order') }" method="POST">
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