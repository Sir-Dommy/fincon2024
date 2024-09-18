@extends('layouts.business')

@section('title', 'Partners')

@section('content')

<section class="bg-light">
    <div class="container py-2">
        <h3 class="mb-5">Sponsors &amp; Partners</h3>
        
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
                    <div class="card mb-4">
                        <img src="{{ url('storage/partners/'. $sponsor->company_logo) }}" class="card-img-top" alt="{{ $sponsor->name }}">
                    </div>
                </div>
                @endforeach
          </div>
        </div>
      </div>
    </div>
</section>

@endsection