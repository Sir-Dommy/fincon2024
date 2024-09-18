@extends('layouts.business')


@section('title', 'Kenya School of Monetary Studies')

@section('description', 'Finanacial Inclusion and Invesntior Exposition')

@section('content')
    
    <div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>VENUE</h3>
              <P class="lead">Kenya School of Monetary Studies</P>
          </div>
      </div>
    </div>
  </div>

    <section>
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-6 col-sm-12">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8687817493305!2d36.86380107496565!3d-1.250045998738045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f1681c629b6ef%3A0x8748f86816536d3d!2sKenya%20school%20of%20monetary%20studies!5e0!3m2!1sen!2ske!4v1713600213783!5m2!1sen!2ske" width="500" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
          <div class="col-md-6 col-lg-6 col-sm-12">
              <div class="py-5">
                  <h2>About Kenya School of Monetary Studies (KSMS)</h2>
                  <p class="lead">Kenya School of Monetary Studies (KSMS) was established as a School of the Central Bank of Kenya and registered in 1997 as a corporate entity, limited by guarantee; under the Companies Act (Chapter 486 of the Laws of Kenya); with the primary mandate to build capacity for the banking industry and support the Bank deliver on its core mandate of fostering a stable and well-functioning financial system.</p>
                    <a href="https://ksms.or.ke/" target="_blank" class="btn btn-yellow rounded-pill">Visit Website</a>
              </div>
          </div>
        </div>
        
        <br><br><br>
        @include('partials.register')
        @include('partials.partners')
        @include('partials.fincon-experience')
      </div>
    </section>

@endsection
