@extends('layouts.business')

@section('title', 'Login')

@section('content')
<section class="testimonials">
    <div class="container h-custom">
        <h4 class="text-center mb-4">Login to your FinCon2024 Delegate Account</h4>
        
        <div class="row d-flex justify-content-center align-items-center h-100">
            
            <div class="col-md-6 col-lg-6 col-xl-6 ">

                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    
                    <div class="form-label-group">
                        <input type="email" name="email" value="{{ old('email') }}" id="form3Example3" class="form-control @error('email') is-invalid @enderror form-control-lg"
                      placeholder="Enter a valid email address" required autocomplete="email" autofocus>
                        <label for="inputEmail">Email address</label>
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                
                    <div class="form-label-group">
                        <input type="password" id="form3Example4" class="form-control @error('password') is-invalid @enderror form-control-lg"
                      placeholder="Enter password" name="password" required autocomplete="current-password">
                        <label for="inputPassword">Password</label>
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" name="remember" value="" id="form2Example3" {{ old('remember') ? 'checked' : '' }} />
                            <label class="form-check-label" for="form2Example3">
                                Remember me
                            </label>
                        </div>
                        @if (Route::has('password.request'))
                            <a class="btn btn-link text-body" href="{{ route('password.request') }}">
                                {{ __('Forgot Your Password?') }}
                            </a>
                        @endif
                    </div>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-yellow btn-lg"
                      style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have a delegate account? <a href="{{ route('register') }}"
                        class="link-danger">Register</a></p>
                    </div>

                </form>
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
    </style>
@endpush
