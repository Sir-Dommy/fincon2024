@extends('layouts.business')

@section('title', 'Home')

@section('content')

<section class="bg-light">
    <div class="container p-5">
        <h1 class="display-5">Hi {{ Auth::user()->name }}! Welcome to your account.</h1>
        <p class="lead">This is where you can manage your participation at all FinCon2024 Sessions in one place.</p>
        @php
            $event = App\Models\Event::first();
        @endphp

        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('newsfeed') }}">
                    <div class="card border-left-primary mb-3 border border-primary rounded-lg shadow p-3 mb-5 bg-primary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col1">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Newsfeed</div>
                                </div>
                                <div class="col1">
                                    <i class="fas fa-th-list fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('programme') }}">
                    <div class="card border-left-primary mb-3 border border-warning rounded-lg shadow p-3 mb-5 bg-warning">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col2">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Programme</div>
                                </div>
                                <div class="col2">
                                    <i class="fas fa-calendar fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('speakers') }}">
                    <div class="card border-left-primary mb-3 border border-success rounded-lg shadow p-3 mb-5 bg-success">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col1">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Speakers</div>
                                </div>
                                <div class="col2">
                                    <i class="fas fa-users fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('partners') }}">
                    <div class="card border-left-primary mb-3 border border-info rounded-lg shadow p-3 mb-5 bg-info">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col1">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Sponsors & Partners</div>
                                </div>
                                <div class="col2">
                                    <i class="fas fa-bullhorn fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('venue-rooms') }}">
                    <div class="card border-left-primary mb-3 border border-secondary rounded-lg shadow p-3 bg-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col1">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Venue Rooms</div>
                                </div>
                                <div class="col2">
                                    <i class="fas fa-home fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 col-lg-4 col-sm-12">
                <a href="{{ route('ticket-payment') }}">
                    <div class="card border-left-primary mb-3 border border-secondary rounded-lg shadow p-3 bg-danger">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="col1">
                                    <div class="text-xs font-weight-bold text-white text-uppercase mb-1">Ticket Payment</div>
                                </div>
                                <div class="col2">
                                    <i class="fas fa-credit-card fa-2x text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
    
    
@endpush

@push('styles')
<style>
    
</style>

@endpush