@extends('layouts.business')

@section('title', 'Venues')

@section('description', 'Meetings &amp; Exhibition Africa is a global publication organization that allows content creators to express their ideas and experiences on what goes on in the field of Events, Meetings and Exhibitions happening in Africa.')

@section('content')
  
  <div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>VENUES</h3>
          </div>
      </div>
    </div>
  </div>

    <section class="venues-grid bg-light">
    <div class="container p-0">
        <span class="badge badge-secondary mb-3">{{ count($venues) }} Venues.</span>

      <div class="row">

        @foreach($venues as $venue)
        <div class="col-md-4 col-lg-4 col-sm-12">
          <div class="card">
            <img src="{{ url('storage/venues/'. $venue->cover_img) }}" class="card-img-top" alt="...">
            <div class="card-body">
              <h4 class="card-title"><a href="{{ route('venues.details', $venue->id) }}"> {{ $venue->name }} </a></h4>
              <P class="card-text">{{ $venue->desc }}</P>
              <small class="text-muted float-right">Posted {{ $venue->created_at->diffForHumans() }}</small>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </div>
  </section>

@endsection
