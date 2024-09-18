@extends('layouts.business')

@section('title', 'Speaker - ')

@section('content')

<section class="h-100 gradient-custom-2">
  <div class="container-fluid py-5 h-100">
    <div class="row d-flex justify-content-center">
      <div class="col col-lg-9 col-xl-8">
        <div class="card">
          <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
            <div class="ml-4 mt-5 d-flex flex-column" style="width: 150px;">
              <img src="{{ url('storage/speakers/'. $speaker->profile_img) }}" alt="{{ $speaker->name }}" class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">
            </div>
            <div class="ml-3" style="margin-top: 130px;">
              <h5>{{ $speaker->name }}</h5>
              <p>{{ $speaker->job_title.' '.$speaker->company }}</p>
            </div>
          </div>
          <div class="p-4 text-black bg-body-tertiary">
            <div class="d-flex justify-content-end text-center py-1 text-body">
                <a href="{{ $speaker->fb_link }}"><i class="fab fa-facebook-f fa-lg mr-3"></i></a>
                <a href="{{ $speaker->ln_link }}"><i class="fab fa-linkedin fa-lg mr-3"></i></a>
                <a href="{{ $speaker->x_link }}"><i class="fab fa-twitter fa-lg"></i></a>
            </div>
          </div>
          <div class="card-body p-4 text-black">
            <div class="mb-5  text-body">
                <p class="lead fw-normal mb-1">About</p>
                <div class="card p-4 bg-body-tertiary">
                    <div class="card-body p-4">
                        <h6>Information</h6>
                        <hr class="mt-0 mb-4">
                        <!--<div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6>Email</h6>
                                <p class="text-muted">{{ $speaker->email }}</p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6>Phone</h6>
                                <p class="text-muted">{{ $speaker->phone }}</p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6>Website</h6>
                                <p class="text-muted">{{ $speaker->website }}</p>
                            </div>
                        </div>-->
                    </div>
                    <div class="">
                        {!! $speaker->long_desc !!}
                    </div>
                </div> 
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
</section>

@endsection