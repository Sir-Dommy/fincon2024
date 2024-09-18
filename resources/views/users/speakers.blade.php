@extends('layouts.business')

@section('title', 'Speakers')

@section('content')

<div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>SPEAKERS</h3>
              <P class="lead">Kenya School of Monetary Studies</P>
          </div>
      </div>
    </div>
  </div>

<section class="bg-light">
    <div class="container p-5">
        @php
            $event = App\Models\Event::first();
        @endphp
        
        @forelse ($event->speakers as $key => $speaker)
        <div class="card mb-5 border border-white rounded-lg shadow p-3 mb-5 bg-white">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="{{ url('storage/speakers/'. $speaker->profile_img) }}" class="card-img" alt="{{ $speaker->name }}">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">{{ $speaker->name }}</h5>
                <p class="card-text">{!! $speaker->short_desc !!}</p>
                <p class="card-text"><small class="text-muted">{{ $speaker->job_title.' '.$speaker->company }}</small></p>
                
                <a href="{{ route('speakers.show', $speaker) }}" class="btn btn-outline-primary btn-sm">View Profile</a>
              </div>
            </div>
          </div>
        </div>
        @empty
            <p>No event speakers to show!</p>
        @endforelse
        
    </div>
</section>

@endsection

@push('scripts')
    
    
@endpush

@push('styles')
<style>
    
</style>

@endpush