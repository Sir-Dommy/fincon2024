@extends('layouts.admin')

@section('content')
<div class="container">
    <h2>Hi {{ Auth::guard('admin')->user()->name }}!</h2>
    <div class="row justify-content-center">
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    @php
                        $events = App\Models\Event::all();
                    @endphp
                    <h4 class="d-flex justify-content-between">
                        <div>
                            <i class="fa fa-calendar"></i>
                            Events
                        </div>
                        <span class="badge badge-secondary">{{ count($events) }}</span>
                    </h4>
                    <a href="{{ route('admin.events.index') }}" class="btn btn-link">View Details</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    @php
                        $users = App\Models\User::all();
                    @endphp
                    <h4 class="d-flex justify-content-between">
                        <div>
                            <i class="fa fa-users"></i>
                            Users
                        </div>
                        <span class="badge badge-secondary">{{ count($users) }}</span>
                    </h4>
                    <a href="{{ route('admin.users.index') }}" class="btn btn-link">View Details</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    @php
                        $posts = App\Models\Post::all();
                    @endphp
                    <h4 class="d-flex justify-content-between">
                        <div>
                            <i class="fa fa-bullhorn"></i>
                            Blog Posts
                        </div>
                        <span class="badge badge-secondary">{{ count($posts) }}</span>
                    </h4>
                    <a href="{{ route('admin.posts.index') }}" class="btn btn-link">View Details</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    @php
                        $venues = App\Models\Venue::all();
                    @endphp
                    <h4 class="d-flex justify-content-between">
                        <div>
                            <i class="fa fa-building"></i>
                            Venues
                        </div>
                        <span class="badge badge-secondary">{{ count($venues) }}</span>
                    </h4>
                    <a href="{{ route('admin.venues.index') }}" class="btn btn-link">View Details</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
