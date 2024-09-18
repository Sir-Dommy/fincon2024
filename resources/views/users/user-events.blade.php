@extends('layouts.business')

@section('title', 'My Events')

@section('content')
<div class="jumbotron jumbotron-fluid bg-white">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>My Events</h3>
          </div>
      </div>
    </div>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            @include('shared.notifications')

                @forelse ($events as $key => $event)

                    <div class="card mb-3">
                        <div class="row no-gutters">
                          <div class="col-md-4">
                            <a href="{{ url('events', $event->id) }}">
                              <img src="{{ url('storage/events/'. $event->cover_img) }}" class="card-img-top"  alt="{{ $event->title }}">
                            </a>
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h4 class="card-title"><a href="{{ route('events.show', $event) }}"> {{ $event->title }} </a></h4>
                                    <div>
                                        <a href="{{ route('events.edit', $event->id) }}" class="btn btn-light">Edit</a>
                                        <a href="#" data-toggle="modal" data-target="#deleteModal{{ $events->firstItem() + $key }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                            <!-- delete Modal-->
                                            <div class="modal fade" id="deleteModal{{ $events->firstItem() + $key }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Event?</h5>
                                                      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body"><p>You are about to delete {{ $event->title }}</p></div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                      
                                                        <form id="delete-category" action="{{ route('events.destroy', $event) }}" method="POST" class="form-inline">
                                                            <input type="hidden" name="_method" value="delete">
                                                            {{ csrf_field() }}
                                                            <input type="submit" value="Yes, Delete" class="btn btn-danger btn-xs pull-right btn-delete">
                                                        </form>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                              <p class="card-text text-orange">{{ \Carbon\Carbon::parse($event->from_date)->format('D, M d')}},  {{\Carbon\Carbon::parse($event->start_time)->format('g:i A') }}</p>
                              <P class="text-muted">{{ $event->venue->name }}, {{ $event->venue->location->name }}</P>                              <h5>{{ $event->organizer->name }}</h5>
                              <small class="text-muted float-right">Posted {{ $event->created_at->diffForHumans() }}</small>
                            </div>
                          </div>
                        </div>
                    </div>

                @empty
                    <p>No events to show!</p>
                @endforelse
        </div>
    </div>
</div>
@endsection
