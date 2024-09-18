@extends('layouts.business')

@section('title', 'Events')

@section('description', 'Meetings &amp; Exhibition Africa is a global publication organization that allows content creators to express their ideas and experiences on what goes on in the field of Events, Meetings and Exhibitions happening in Africa.')

@section('content')

  @include('partials.event-search-form')

    <section class="events-grid bg-light">
    <div class="container p-0">
      @if(isset($category_id))
        @php
          $category = App\Models\Category::where('id', $category_id)->first();
        @endphp
        <h4>{{ $category->name }}</h4>
      @endif
        <span class="badge badge-secondary mb-3">{{ count($events) }} Events.</span>

      <div class="row">

        @foreach($events as $event)
        <div class="col-md-6 col-lg-6 col-sm-12">
          <div class="card mb-3">
            <div class="row no-gutters">
              <div class="col-md-4">
                <a href="{{ url('events', $event->id) }}">
                  <img src="{{ url('storage/events/'. $event->cover_img) }}" class="card-img-top"  alt="{{ $event->title }}">
                </a>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title"><a href="{{ url('all-events/'. $event->slug) }}"> {{ $event->title }} </a></h4>
                  <p class="card-text text-orange">{{ \Carbon\Carbon::parse($event->from_date)->format('D, M d')}},  {{\Carbon\Carbon::parse($event->start_time)->format('g:i A') }}</p>
                  <P class="text-muted">{{ $event->venue->name }}</P>
                  <p>{{ $event->venue->location->name }}</p>
                  <h5>{{ $event->organizer->name }}</h5>
                </div>
              </div>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </div>
  </section>

@endsection
