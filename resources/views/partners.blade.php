@extends('layouts.business')

@section('title', 'Partners')

@section('description', 'Financial inclusion and investor exposition 2024 starting thi June')

@section('content')

  <section class="testimonials bg-light-blue">
    <div class="container-fluid p-0">
      <div class="row no-gutters text-white text-center">
        <div class="col-md-8 offset-md-2 order-lg-1 my-auto showcase-text">
          <h2>Partners</h2>
          <p class="mb-5"> Our Strategic Partners.</p>
          
          <div class="row no-gutter">
                @php
                    $sponsors = App\Models\Partner::where('status', 'active')->get();
                @endphp
                
                @foreach($sponsors as $sponsor)
                <div class="col-md-3 col-lg-3 col-sm-12">
                    <a href="{{ $sponsor->website }}" target="_blank">
                        <div class="card mb-4">
                            <img src="{{ url('storage/partners/'. $sponsor->company_logo) }}" class="card-img-top" alt="{{ $sponsor->name }}">
                        </div>
                    </a>
                </div>
                @endforeach
          </div>
        </div>
      </div>
      
      <br><br><br>
      @include('partials.register')
        @include('partials.fincon-experience')
    </div>
  </section>

@endsection
