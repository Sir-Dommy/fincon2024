@extends('layouts.business')

@section('title', 'My Events')

@section('content')
<div class="jumbotron jumbotron-fluid bg-white">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>My Profile</h3>
          </div>
      </div>
    </div>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-8 col-sm-12">

           <div class="card">
               <div class="card-body">
                   <h4 class="card-title">Edit Profile</h4>
                   
                   @include('shared.notifications')
                   <form method="POST" action="{{ route('user.profile.update') }}">
                        @csrf

                        
                        <div class="form-label-group">
                            <input type="text" name="name" value="{{ old('name', $user->name) }}" id="inputName" class="form-control @error('name') is-invalid @enderror" placeholder="Enter your full name" required autofocus>
                            <label for="inputName">Your Name</label>
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        
                        <div class="form-label-group">
                            <input id="inputEmail" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email', $user->email) }}" placeholder="Enter valid email address" required readonly="readonly">
                            <label for="inputEmail">Email address</label>
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        
                        <div class="form-label-group">
                            <input id="inputPhone" type="tel" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{ old('phone', $user->phone) }}" placeholder="Enter a valid phone number" required required>
                            <label for="inputPhone">Phone Number</label>
                            @error('phone')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        
                        <div class="form-label-group">
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="male">
                              <label class="form-check-label" for="inlineRadio1">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="female">
                              <label class="form-check-label" for="inlineRadio2">Female</label>
                            </div>
                            @error('gender')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>


                        <!-- Submit button -->
                        <button type="submit" class="btn btn-yellow btn-block mb-4">
                          Submit
                        </button>
                    </form>

               </div>
           </div>

               
        </div>
    </div>
</div>
@endsection
