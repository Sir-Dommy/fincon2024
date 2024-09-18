@extends('layouts.business')

@section('title', 'Welcome')

@section('description', 'Financial inclusion Conference and Investor Exposition 2024 is the biggest finance event happening this year.')

@section('content')

@php
    $event = App\Models\Event::first();
@endphp
<header class="masthead" style="background: url('img/kenya_money001.webp') no-repeat center center; background-size: cover;">
  <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="col-lg-12 col-md-12 col-sm-12 text-center">
        <div class="mask text-light d-flex justify-content-center flex-column text-center py-5" style="background-color: rgba(0, 0, 0, 0.5)">
            <h1 class="display-5 mb-5">{{ $event->title }}</h1>
            <h4 class="mb-3 text-yellow"><i class="fa fa-calendar"></i> &nbsp;&nbsp;{{ \Carbon\Carbon::parse($event->from_date)->format('D d') }} - {{ \Carbon\Carbon::parse($event->to_date)->format('D d M  Y') }}</h4>
            <h4 class="mb-3"><i class="fa fa-map-marker"></i> &nbsp;&nbsp;{{ $event->venue->name }}, {{ $event->venue->location->name }} {{ $event->venue->location->country }}.</h4>
            
            <div class="">
                <a href="{{ route('registration.index') }}" class="btn btn-yellow rounded-pill btn-lg">Register Now!</a>
            </div>
         </div>
      </div>
    </div>
  </div>
</header>

@include('partials.countdown')
@include('partials.about-event')
@include('partials.whyattendevent')
@include('partials.guest-welcomer')
@include('partials.speakers-showcase')
@include('partials.register')
@include('partials.partners')
@include('partials.fincon-experience')

@endsection
