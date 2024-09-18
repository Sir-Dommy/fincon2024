@extends('layouts.business')

@section('title', 'Tickets')

@section('content')

<section class="bg-light">
    <div class="container p-5">
        <h1 class="display-5">Your Ticket</h1>
        @php
            $event = App\Models\Event::first();
        @endphp

        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                @if($event->tickets->count() > 0)
                    <div class="carddd mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="card-body">
                                    @php
                                        $order = App\Models\Order::where('event_id', $event->id)->where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
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
                                                        <h5>Order Status</h5>
                                                        @if($order->status === 'open')
                                                        <span class="badge badge-primary">Open</span>
                                                        @elseif($order->status === 'pending')
                                                        <span class="badge badge-warning">Pending</span>
                                                        @elseif($order->status === 'complete')
                                                        <span class="badge badge-success">Confirmed</span>
                                                        @elseif($order->status === 'cancelled')
                                                        <span class="badge badge-danger">Cancelled</span>
                                                        @else
                                                        <span class="badge badge-secondary">Unknown</span>
                                                        @endif
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <h5>Paymode</h5>
                                                        <p>{{ $order->comments }}</p>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <div class="responsive">
                                                            <table class="table table-stripped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Ticket Type</th>
                                                                        <th>Quantity</th>
                                                                        <th>Unit Price</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @foreach($order->orderitems as $item)
                                                                    @php
                                                                        $ticket_type = $item->ticket->name;
                                                                    @endphp
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
                                        
                                        @if($order->status === 'complete')
                                            <div class="card card-body">
                                                <h4 class="card-title">Ticket Payments Confirmed</h4>
                                                
                                                <table class="table table-stripped">
                                                    <thead>
                                                        <tr>
                                                            <th>Code</th>
                                                            <th>Pay Mode</th>
                                                            <th>Amount Paid</th>
                                                            <th>Pay Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach($order->payments as $pay)
                                                        <tr>
                                                            <td>{{ $pay->trans_code }}</td>
                                                            <td>{{ $pay->paymode }}</td>
                                                            <td>{{ $pay->currency.' '.$pay->pay_amount }}</td>
                                                            <td>{{ $pay->pay_date }}</td>
                                                            <td>{{ $pay->status }}</td>
                                                        </tr>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        @else
                                            <div class="cardmen mb-3">
                                                <div class="card-body">
                                                    <h4 class="mb-4">Complete your registration</h4>
                                                    <p class="lead">Make payments?</p>
                                                    
                                                    <form action="{{ url('checkout') }}" method="POST">
                                                        {{ csrf_field() }}
                                                        <input type="hidden" name="event_id"  value="{{ $event->id }}">
                                                        
                                                            <div class="row">
                                                                @foreach($order->orderitems as $ticket)
                                                                <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                                                <input type="hidden" name="price" value="{{ $ticket->price }}">
                                                                <input type="hidden" name="qty" value="1">
                                                                    <div class="col-md-3 col-lg-3 col-sm-12">
                                                                    
                                                                        <label>
                                                                            <input type="radio" name="ticket_id" value="{{ $ticket->ticket_id }}" class="card-input-element" required/>
                                                                
                                                                            <div class="card card-default card-input">
                                                                                <div class="card-header"><h4>{{ $ticket->ticket->name }}</h4></div>
                                                                                <div class="card-body">
                                                                                    <h5>{{ $ticket->currency }} {{ number_format($ticket->price, 0) }}</h5>
                                                                                    {{--<p>{{ $ticket->desc }}</p>--}}
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                          
                                                        <div class="form-group">
                                                          <button type="submit" class="btn btn-yellow rounded-pill">Continue</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        @endif
                                    @else
                                    <div class="cardmen mb-3">
                                        <div class="card-body">
                                            <h4 class="mb-4">Let's Continue with your registration</h4>
                                            <p class="lead">How would you like to perticipate?</p>
                                            
                                            <form action="{{ url('checkout') }}" method="POST">
                                                {{ csrf_field() }}
                                                <input type="hidden" name="event_id"  value="{{ $event->id }}">
                                                
                                                    <div class="row">
                                                        @foreach($event->tickets as $ticket)
                                                        <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                                        <input type="hidden" name="price" value="{{ $ticket->price }}">
                                                        <input type="hidden" name="qty" value="1">
                                                            <div class="col-md-3 col-lg-3 col-sm-12">
                                                            
                                                                <label>
                                                                    <input type="radio" name="ticket_id" value="{{ $ticket->id }}" class="card-input-element" required/>
                                                        
                                                                    <div class="card card-default card-input">
                                                                        <div class="card-header"><h4>{{ $ticket->name }}</h4></div>
                                                                        <div class="card-body">
                                                                            <h5>{{ $ticket->currency }} {{ number_format($ticket->price, 0) }}</h5>
                                                                            {{--<p>{{ $ticket->desc }}</p>--}}
                                                                        </div>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        @endforeach
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
                            <h4 class="mb-4">Let's Continue with your registration</h4>
                            <p class="lead">How would you like to perticipate:</p>
                            
                            <form action="{{ url('checkout') }}" method="POST">
                                {{ csrf_field() }}
                                <input type="hidden" name="event_id"  value="{{ $event->id }}">
                                
                                    <div class="row">
                                        @foreach($event->tickets as $ticket)
                                        <input type="hidden" name="currency" value="{{ $ticket->currency }}">
                                        <input type="hidden" name="price" value="{{ $ticket->price }}">
                                        <input type="hidden" name="qty" value="1">
                                            <div class="col-md-4 col-lg-4 col-sm-4">
                                            
                                                <label>
                                                    <input type="radio" name="ticket_id" value="{{ $ticket->id }}" class="card-input-element" />
                                        
                                                    <div class="card card-default card-input">
                                                        <div class="card-header"><h4>{{ $ticket->name }}</h4></div>
                                                        <div class="card-body">
                                                            <h5>{{ $ticket->currency }} {{ number_format($ticket->price, 0) }}</h5>
                                                            {{--<p>{{ $ticket->desc }}</p>--}}
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        @endforeach
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

@push('scripts')
    <script type="text/javascript">
         function show1(){
          document.getElementById('div1').style.display ='none';
          document.getElementById('div2').style.display ='block';
        }
        function show2(){
          document.getElementById('div2').style.display ='none';
          document.getElementById('div1').style.display ='block';
        }
    </script>
@endpush

@push('styles')
<style>
    .hide {
      display: none;
    }
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