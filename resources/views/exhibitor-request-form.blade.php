@extends('layouts.business')

@section('title', 'Exhibitor Information Request Form')

@section('description', 'Financial inclusion and investor exposition 2024 starting this June 26th to 27th')

@section('content')

  <section class="testimonials bg-light text-dark">
    <div class="container h-custom">
      <div class="row no-gutters text-center">
        <div class="col-md-8 offset-md-2 order-lg-1 my-auto showcase-text">
          <h2>Exhibit at FinCon2024, Kenya School of Monetary Studies.</h2>
          <p class="lead">Gain access to thousands of pre-qualified buyers and achieve real ROI. Our personalised support will ensure you get the most from your FinCon experience and put you face-to-face with the buyers.</p>
        </div>
      </div>
      
      <div class="row no-gutters d-flex justify-content-center">
             <div class="col-md-8 col-lg-8 col-sm-12">
                 <div class="card bg-primary border border-primary rounded shadow p-3 mb-5">
                    <div class="card-body py-5 px-md-5">
                        <h4 class="card-title mb-4 text-white">Information Request Form</h4>
                        
                        @include('shared.notifications')
                        <form method="POST" action="{{ route('save.request.form') }}">
                            @csrf

                            
                            <div class="form-label-group">
                                <input type="text" name="company" value="{{ old('company') }}" id="inputName" class="form-control @error('company') is-invalid @enderror" placeholder="Enter name of your company" required autofocus>
                                <label for="inputName">Company Name</label>
                                @error('company')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" name="contact_person" value="{{ old('contact_person') }}" id="inputName" class="form-control @error('contact_person') is-invalid @enderror" placeholder="Enter name of the contact person" required autofocus>
                                <label for="inputName">Contact Person Name</label>
                                @error('contact_person')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            
                            <div class="form-row">
                                <div class="form-label-group col-6">
                                    <input id="inputPhone" type="tel" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{ old('phone') }}" placeholder="Enter a valid phone number" required>
                                    <label for="inputPhone">Phone Number</label>
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-label-group col-6">
                                    <input id="inputName" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" placeholder="Enter a valid email address" required>
                                    <label for="inputName">Email Address</label>
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-label-group col-6">
                                    <input id="inputName" type="text" class="form-control @error('website') is-invalid @enderror" name="website" value="{{ old('website') }}" placeholder="Enter a website address">
                                    <label for="inputName">Website</label>
                                    @error('website')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-label-group col-6">
                                    <input id="inputName" type="text" class="form-control @error('country') is-invalid @enderror" name="country" value="{{ old('country') }}" placeholder="Enter a country of operations">
                                    <label for="inputName">Country</label>
                                    @error('country')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
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
         
         <br><br><br>
         <div class="row d-flex justify-content-center align-items-center h-100 mt-5">
            <div class="col-md-6 col-lg-6 col-sm-12">
               <div class="card mb-3 border border-white rounded-lg shadow p-3 mb-5 bg-white">
                  <div class="row no-gutters">
                    <div class="col-md-4">
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzGM06B-QPWY-gKDtfvoyCaocyou4WC_B9Bfr8kizRZMZlTJhj8npvIzKxU72ODaoYp4U&usqp=CAU" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title">DELEGATE REGISTRATION</h5>
                        <p class="card-text">Visiting FinCon2024 offers you countless opportunities to meet the right people.</p>
                        <a href="{{ route('registration.index') }}" class="btn btn-yellow rounded-pill btn-lg">Register Now</a>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
  </section>

@endsection
