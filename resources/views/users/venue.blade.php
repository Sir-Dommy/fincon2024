@extends('layouts.business')

@section('title', 'Venue -'.$venue->name)

@section('content')

<div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>Venue</h3>
              <P class="lead">{{ $venue->name }}</P>
          </div>
      </div>
    </div>
  </div>
  
  <section class="bg-light">
      <div class="container mb-5">
          <div class="row no-gutter">
              @foreach($venue->rooms as $room)
              <div class="col-md-8">
                  <div class="card mb-2">
                      <div class="card-body">
                          <h4 class="card-title">{{ $room->name }}</h4>
                          <a href="{{ route('room.details', $room) }}" class="btn btn-outline-primary float-right btn-sm">View Details</a>
                      </div>
                  </div>
              </div>
              @endforeach
          </div>
      </div>
  </section>


@endsection
