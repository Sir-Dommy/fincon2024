@extends('layouts.business')

@section('title', 'Success')

@section('description', '')

@section('content')

    <section>
      <div class="container mt-5">
        <div class="row d-flex justify-content-center align-items-center">
          <div class="col-md-6 col-lg-6 col-sm-12">
              <div class="carD p-5">
                <div class="card-body p-5">
                    <i class="fa fa-check fa-4x"></i>
                  <h2 class="text-success">Your Contact Information Saved, Pending Payment Confirmation!</h2>
                  <p>Congratulations for making it this far! We will send a ticket to your email address once the payment is confirmed.</p>
                  
                  
                  <a href="{{ url('home') }}" class="btn btn-link">Home Page</a>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>

@endsection
