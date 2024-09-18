@extends('layouts.business')

@section('title', $event->title)

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Event Details - {{ $event->title }}</h4>
                  <a href="{{ route('events.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    @include('shared.notifications')
                    
                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-sm-12">
                            <div class="card">
                                <img src="{{ url('storage/events/'. $event->cover_img) }}" class="card-img-top">
                            </div>
                        </div>
                        <div class="col-md-8 col-lg-8 col-sm-12">
                            <h3>{{ $event->title }}</h3>
                            <p>Category: {{ $event->category->name }}</p>
                            <p>Type: {{ $event->eventtype->name }}</p>
                            <p>Start Date: {{ $event->from_date }}</p>
                            <p>End Date: {{ $event->to_date }}</p>
                            <p>Time: {{ $event->start_time.' - '.$event->end_time }}</p>
                            <hr>
                            <h5>Venue: {{ $event->venue->name.' '.$event->venue->location->name }}</h5>
                            <hr>
                            <h5>Organized by: {{ $event->organizer->name }}</h5>
                            <hr>
                            <p>{{ $event->shoart_desc }}</p>
                            <small class="float-right">Last Updated: {{ $event->updated_at }}</small>
                        </div>
                    </div>
                </div>
                <div class="card-header d-flex justify-content-between">
                    <h5>Event Tickets</h5>
                    <a href="#CreateEventTicket" data-toggle="modal" class="btn btn-primary btn-sm">Create Ticket</a>
                        
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="CreateEventTicket" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Create Event Ticket</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('tickets.store') }}" method="post">
                                        @csrf
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control" placeholder="e.g. Regular Ticket or VIP Ticket">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="price">Price</label>
                                                    <input type="number" step="any" min="0" name="price" value="{{ old('price') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="purchase_from">Sell Ticket From</label>
                                                    <input type="date" name="purchase_from" value="{{ old('purchase_from') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="purchase_to">Sell Ticket To</label>
                                                    <input type="date" name="purchase_to" value="{{ old('purchase_to') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="pax">Tickets Available</label>
                                                    <input type="number" min="0" name="pax" value="{{ old('pax') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="desc">Description</label>
                                                    <textarea name="desc" class="form-control">{{ old('desc') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Available Tickets</th>
                                    <th>Sale Duration</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($event->tickets as $ticket)
                                <tr>
                                    <td>{{ $ticket->name }}</td>
                                    <td>{{ $ticket->price }}</td>
                                    <td>{{ $ticket->pax }}</td>
                                    <td>{{ $ticket->purchase_from.' - '.$ticket->purchase_to }}</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#editModal{{ $ticket->code }}" class="btn btn-link"><i class="fa fa-trash"></i>Edit</a>
                                        <div class="modal fade" id="editModal{{ $ticket->code }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Edit Ticket Details</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ route('tickets.update', $ticket) }}" method="post">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" name="name" value="{{ old('name', $ticket->name) }}" class="form-control" placeholder="e.g. Regular Ticket or VIP Ticket">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="price">Price</label>
                                                                    <input type="number" step="any" min="0" name="price" value="{{ old('price', $ticket->price) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="purchase_from">Sell Ticket From</label>
                                                                    <input type="date" name="purchase_from" value="{{ old('purchase_from', $ticket->purchase_from) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="purchase_to">Sell Ticket To</label>
                                                                    <input type="date" name="purchase_to" value="{{ old('purchase_to', $ticket->purchase_to) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="pax">Tickets Available</label>
                                                                    <input type="number" min="0" name="pax" value="{{ old('pax', $ticket->pax) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="desc">Description</label>
                                                                    <textarea name="desc" class="form-control">{{ old('desc', $ticket->desc) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-success">Update</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                        </div>

                                         |
                                        <a href="#" data-toggle="modal" data-target="#deleteModal{{ $ticket->code }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                        <!-- delete Modal-->
                                        <div class="modal fade" id="deleteModal{{ $ticket->code }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Ticket?</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body"><p>You are about to delete {{ $ticket->name }}</p></div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                  
                                                    <form id="delete-category" action="{{ route('tickets.destroy', $ticket) }}" method="POST" class="form-inline">
                                                        <input type="hidden" name="_method" value="delete">
                                                        {{ csrf_field() }}
                                                        <input type="submit" value="Yes, Delete" class="btn btn-danger btn-xs pull-right btn-delete">
                                                    </form>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
