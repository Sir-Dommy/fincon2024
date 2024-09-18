@extends('layouts.business')

@section('title', 'Payments')

@section('description', 'Payments')

@section('content')

    @php
      $event = App\Models\Event::find(session('event_id'));
      $ticket = App\Models\Ticket::find(session('ticket_id'));
    @endphp

    <section>
      <div class="container mt-5">
        <div class="row mb-5">
          <div class="col-md-8 col-lg-8 col-sm-12">
              <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">TICKET PAYMENT</h4>
                    <p class="lead"></p>
                    
                    <div class="payments">
                        @if(session('paymode') === 'mpesa')
                        <div id="div1" class="hide11">
                            <br><br>
                            <h5>Pay Now with M-Pesa</h5>
                            <div class="card card-body mb-4 bg-light">
                                <img src="{{ asset('img/lipa na mpesa.png') }}" style="height: 100px;">
                                 <ul>
                                    <li>Go to your Mpesa Menu</li>
                                    <li>Select Lipa na Mpesa</li>
                                    <li>Select Paybill</li>
                                    <li>Enter Business Number: <b>7326063</b></li>
                                    <li>Enter Account Number: <i><b>{{ session('name') }}</b></i></li>
                                    <li>Enter Amount: @php $mpesa_amount = session('price') * 130; @endphp <b>{{ number_format($mpesa_amount) }}</b> </li>
                                    <li>Enter your Mpesa PIN</li>
                                    <li>Confirm Transaction</li>
                                </ul>
                                
                                <form action="{{ route('confirm.payment.mpesa') }}" method="POST">
                                    {{ csrf_field() }}
                                    <div class="form-group">
                                        <label>M-PESA Confirmation Code</label>
                                        <input type="hidden" name="paymode" value="mpesa">
                                        <input type="hidden" name="mpesa_amount" value="{{ $mpesa_amount }}">
                                        <input type="text" name="trans_code" class="form-control" placeholder="E.g YRT46383744F">
                                        @if ($errors->has('trans_code'))
                                            <span class="alert alert-danger help-block">
                                                <strong>{{ $errors->first('trans_code') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-yellow rounded-pill btn-block">Complete Registration</button>
                                    </div>
                                </form>
                                
                                <h4 class="mb-4 mt-4">OR</h4>
                                <a href="https://payments.fincon2024.co.ke/member/mpesa/stkpush">Member M-PESA STK Push</a>
                                <a href="https://payments.fincon2024.co.ke/nonmember/mpesa/stkpush">Non-Member M-PESA STK Push</a>
                            </div>
                        </div>
                        @elseif(session('paymode') === 'bankdeposit')
                        
                        <div id="div2" class="hide11">
                            <br><br>
                            <h5>Bank Deposit Details</h5>
                            <div class="card card-body bg-light mb-4">
                                <h5>FOR LOCAL CURRENCY TRANSFERS</h5>
                                <p class="lead">Beneficiary bank: <b>CARITAS MICROFINANCE BANK</b></p>
                                  <p class="lead">Account name: <b>ASSOCIATION OF MICROFINANCE INSTITUTIONS</b></p>
                                  <p class="lead">Account number: <b>1003022000250</b></p>
                                  <p class="lead">Swift code : <b>CRMFKENA</b></p>
                                  
                                  <br><hr><br><br>
                                  <h5>FOR USD KINDLY USE THE ATTACHED INFORMATION</h5>
                                  <p>For funds transfer purposes Via Local Bank, the following are the RTGS details:</p>
                                  <p class="lead">Beneficiary: <b>ASSOCIATION OF MICROFINANCE INSTITUTIONS</b></p>
                                    <p class="lead">Account Number: <b>1003090000014</b></p>
                                    <p class="lead">Beneficiary Bank & Branch: <b>Caritas Microfinance Bank</b></p>
                                    <p class="lead">SWIFT CODE: <b>CRMFKENA</b></p>
                                    
                                    
                                    <br><hr><br><br>
                                    <h5>FOR TELEGRAPHIC TRANSFER INTERNATIONAL PAYMENTS) (USD)</h5>
                                    <p class="lead">Beneficiary bank: <b>NCBA bank</b></p>
                                    <p class="lead">Account name: <b>Caritas Microfinance Bank</b></p>
                                    <p class="lead">Account number: <b>1004891763</b></p>
                                    <p class="lead">Swift code: <b>CBAFKENX</b></p>
                                    <p class="lead">Correspondent bank: <b>standard chartered bank</b></p>
                                    <p class="lead">Correspondent swift code: <b>scblus33</b></p>
                                    <p class="lead">Additional details: <b>ASSOCIATION OF MICROFINANCE INSTITUTIONS</b></p>
                                    
                                    <form action="{{ route('confirm.payment.bankdeposit') }}" method="POST" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="paymode" value="bankdeposit">
                                        
                                        <div class="form-group {{ $errors->has('payment_proof') ? ' has-error' : '' }}">
                                            <label for="cover_img">Attachment Proof of Payment</label>
                                            <input type="file" class="form-control" name="payment_proof" value="{{ old('payment_proof') }}">
                                            @if ($errors->has('payment_proof'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('payment_proof') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                      
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-yellow rounded-pill btn-block">Complete Registration</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                        @else
                        <h3>Contact Admin for other Payment options: 0703418607</h3>
                        @endif
                    </div>
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
                    
                    <p class="lead"><b>Ticket Type:</b> {{ session('qty') }} - {{ $ticket->name }}</p>
                    <p class="lead"><b>Ticket Amount:</b> {{ session('currency').' '.session('price') }}</p>
                  </div>
                  <div class="card-header">
                    <h4>Total Payable: {{ session('currency').' '.session('price') * session('qty') }}</h4>
                  </div>
                </div>
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
