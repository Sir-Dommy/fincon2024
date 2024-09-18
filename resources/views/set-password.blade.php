@extends('layouts.guest-user')

@section('title', 'Register')

@section('content')
<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <a href="{{ url('/') }}"><img src="{{ asset('img/ted-logo-trnsp.png') }}"
              class="img-fluid" alt="Sample image"></a>
              <h1 class="my-5 display-4 fw-bold ls-tight">
                Create a free account <br />
                <span class="text-primary">for events promotion</span>
              </h1>
              <p class="lead">We are a global self-service events promotion platform for live experiences that allows anyone to create, share, find and attend events.</p>
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                <div class="card">
                    <div class="card-body py-5 px-md-5">
                        <form method="POST" action="{{ route('set-password.store') }}">
                            @csrf

                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                            <div class="form-outline">
                              <input type="email" name="email" value="{{ $user->email }}" class="form-control" readonly="readonly">
                              <label>Email Address</label>
                            </div>

                            <div class="form-row">
                                <div class="form-outline col-md-12">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Min 8 characters" required autocomplete="new-password">
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                    <label class="form-label" for="form3Example1">Password</label>
                                </div>
                                <div class="form-outline col-md-12">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirm your password" required autocomplete="new-password">
                                    <label class="form-label" for="form3Example1">Confirm Password</label>
                                </div>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-block mb-4">
                              Confirm
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
        <!-- Copyright -->
        <div class="text-white mb-3 mb-md-0">
            &copy; <a href="{{ url('/') }}" class="text-white">The Events Diary</a> {{ date('Y') }}. All Rights Reserved.
        </div>
        <!-- Copyright -->

        <!-- Right -->
        <div>
            <a href="#!" class="text-white mr-4">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#!" class="text-white mr-4">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="#!" class="text-white mr-4">
                <i class="fab fa-google"></i>
            </a>
            <a href="#!" class="text-white">
                <i class="fab fa-linkedin-in"></i>
            </a>
        </div>
        <!-- Right -->
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
    </style>
@endpush
