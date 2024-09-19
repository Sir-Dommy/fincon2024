@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            
            @include('shared.notifications')
            
            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Event Details - {{ $event->title }}</h4>
                  <a href="{{ route('admin.events.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
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
                            <p>{{ $event->short_desc }}</p>
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
                                    <form action="{{ route('admin.tickets.store') }}" method="post">
                                        @csrf
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control" placeholder="e.g. Regular Ticket or VIP Ticket">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="currency">Currency</label>
                                                    <select name="currency" class="form-control">
                                                        <option value="">Select</option>
                                                        <option value="KES">Kenya Shilling</option>
                                                        <option value="USD">US Dollar</option>
                                                        <option value="EURO">EURO</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
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
                                                    <form action="{{ route('admin.tickets.update', $ticket) }}" method="post">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" name="name" value="{{ old('name', $ticket->name) }}" class="form-control" placeholder="e.g. Regular Ticket or VIP Ticket">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="currency">Currency</label>
                                                                    <select name="currency" class="form-control">
                                                                        <option value="">Select</option>
                                                                        <option value="KES" @if($ticket->currency === 'KES') selected="selected" @endif>Kenya Shilling</option>
                                                                        <option value="USD" @if($ticket->currency === 'USD') selected="selected" @endif>US Dollar</option>
                                                                        <option value="EURO" @if($ticket->currency === 'EURO') selected="selected" @endif>EURO</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
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
                                                  
                                                    <form id="delete-category" action="{{ route('admin.tickets.destroy', $ticket) }}" method="POST" class="form-inline">
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
                
                <div class="card-header d-flex justify-content-between">
                    <h5>Event Speakers</h5>
                    <a href="#CreateEventSpeaker" data-toggle="modal" class="btn btn-primary btn-sm">Create Speaker</a>
                        
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="CreateEventSpeaker" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Create Event Speaker</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.speakers.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="job_title">Jon Title</label>
                                                    <input type="text" name="job_title" value="{{ old('job_title') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="company">Company</label>
                                                    <input type="text" name="company" value="{{ old('company') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="tel" name="phone" value="{{ old('phone') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <input type="email" name="email" value="{{ old('email') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="website">Website</label>
                                                    <input type="text" name="website" value="{{ old('website') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="yt_link">Youtube Link</label>
                                                    <input type="text" name="yt_link" value="{{ old('yt_link') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fb_link">Facebook Link</label>
                                                    <input type="text" name="fb_link" value="{{ old('fb_link') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="short_desc">Short Description</label>
                                                    <textarea name="short_desc" class="form-control">{{ old('short_desc') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="long_desc">Long Description</label>
                                                    <textarea name="long_desc" class="form-control">{{ old('long_desc') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                                    <label for="image">Cover Image</label>
                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                    @if ($errors->has('image'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('image') }}</strong>
                                                        </span>
                                                    @endif
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
                                    <th>Job Title</th>
                                    <th>Company</th>
                                    <th>Email</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($event->speakers as $speaker)
                                <tr>
                                    <td>{{ $speaker->name }}</td>
                                    <td>{{ $speaker->job_title }}</td>
                                    <td>{{ $speaker->company }}</td>
                                    <td>{{ $speaker->email }}</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#editModal{{ $speaker->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Edit</a>
                                        <div class="modal fade" id="editModal{{ $speaker->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Edit Speaker Details</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ route('admin.speakers.update', $speaker) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" name="name" value="{{ old('name', $speaker->name) }}" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="job_title">Jon Title</label>
                                                                    <input type="text" name="job_title" value="{{ old('job_title', $speaker->job_title) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="company">Company</label>
                                                                    <input type="text" name="company" value="{{ old('company', $speaker->company) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="phone">Phone</label>
                                                                    <input type="tel" name="phone" value="{{ old('phone', $speaker->phone) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="email">Email</label>
                                                                    <input type="email" name="email" value="{{ old('email', $speaker->email) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="website">Website</label>
                                                                    <input type="text" name="website" value="{{ old('website', $speaker->website) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="yt_link">Youtube Link</label>
                                                                    <input type="text" name="yt_link" value="{{ old('yt_link', $speaker->yt_link) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="fb_link">Facebook Link</label>
                                                                    <input type="text" name="fb_link" value="{{ old('fb_link', $speaker->fb_link) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="short_desc">Short Description</label>
                                                                    <textarea name="short_desc" class="form-control" rows="5">{{ old('short_desc', $speaker->short_desc) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="long_desc">Long Description</label>
                                                                    <textarea name="long_desc" class="form-control" rows="10">{{ old('long_desc', $speaker->long_desc) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group {{ $errors->has('profile_img') ? ' has-error' : '' }}">
                                                                    <label for="profile_img">Profile Image</label>
                                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                                    <img src="{{ url('storage/speakers/'. $speaker->profile_img) }}" style="width:100px; height: 100px;">
                                                                    @if ($errors->has('profile_img'))
                                                                        <span class="help-block">
                                                                            <strong>{{ $errors->first('profile_img') }}</strong>
                                                                        </span>
                                                                    @endif
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
                                        <a href="#" data-toggle="modal" data-target="#deleteModal{{ $speaker->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                        <!-- delete Modal-->
                                        <div class="modal fade" id="deleteModal{{ $speaker->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Speaker?</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body"><p>You are about to delete {{ $speaker->name }}</p></div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                  
                                                    <form id="delete-category" action="{{ route('admin.speakers.destroy', $speaker) }}" method="POST" class="form-inline">
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
                
                <div class="card-header d-flex justify-content-between">
                    <h5>Event Agenda</h5>
                    <a href="#CreateEventAgenda" data-toggle="modal" class="btn btn-primary btn-sm">Create Agenda</a>
                        
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="CreateEventAgenda" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Create Event Agenda</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.agendas.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="code">Code</label>
                                                    <input type="text" name="code" value="{{ old('code') }}" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="title">Title</label>
                                                    <input type="text" name="title" value="{{ old('title') }}" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="position">Positision</label>
                                                    <input type="number" min="1" name="position" value="{{ old('position') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="session_type">Session Type</label>
                                                    <select name="session_type" class="form-control">
                                                        <option value="">Select</option>
                                                        <option value="arrival-registration">Arrival/Registration</option>
                                                        <option value="major-session">Major Session</option>
                                                        <option value="minor-session">Minor Session</option>
                                                        <option value="break-session">Break Session</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="session_date">Date</label>
                                                    <input type="date" name="session_date" value="{{ old('session_date') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="from_time">Start Time</label>
                                                    <input type="time" name="from_time" value="{{ old('from_time') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="to_time">End Time</label>
                                                    <input type="time" name="to_time" value="{{ old('to_time') }}" class="form-control">
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="venue">Venue</label>
                                                    <select name="venue_room_id" class="form-control">
                                                        <option value="">Select</option>
                                                        @foreach($rooms as $room)
                                                        <option value="{{ $room->id }}">{{ $room->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="contact_person">Contact Person</label>
                                                    <input type="text" name="contact_person" value="{{ old('contact_person') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="tel" name="phone" value="{{ old('phone') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <input type="email" name="email" value="{{ old('email') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="short_desc">Short Description</label>
                                                    <textarea name="short_desc" class="form-control">{{ old('short_desc') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                                    <label for="image">Cover Image</label>
                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                    @if ($errors->has('image'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('image') }}</strong>
                                                        </span>
                                                    @endif
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
                                    <th>Title</th>
                                    <th>Date</th>
                                    <th>Venue</th>
                                    <th>Time</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($event->agendas as $agenda)
                                <tr>
                                    <td>{{ $agenda->title }}</td>
                                    <td>{{ $agenda->session_date }}</td>
                                    <td>{{ $agenda->venueroom->name }}</td>
                                    <td>{{ $agenda->from_time.' - '.$agenda->to_time }}</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#editAgendaModal{{ $agenda->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Edit</a>
                                        <div class="modal fade" id="editAgendaModal{{ $agenda->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Edit Agenda Details</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ route('admin.agendas.update', $agenda) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="code">Code</label>
                                                                    <input type="text" name="code" value="{{ old('code', $agenda->code) }}" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="title">Title</label>
                                                                    <input type="text" name="title" value="{{ old('title', $agenda->title) }}" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="position">Positision</label>
                                                                    <input type="number" min="1" name="position" value="{{ old('position', $agenda->position) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="session_type">Session Type</label>
                                                                    <select name="session_type" class="form-control">
                                                                        <option value="">Select</option>
                                                                        <option value="arrival-registration" @if($agenda->session_type === 'arrival-registration') selected @endif>Arrival/Registration</option>
                                                                        <option value="major-session" @if($agenda->session_type === 'major-session') selected @endif>Major Session</option>
                                                                        <option value="minor-session" @if($agenda->session_type === 'minor-session') selected @endif>Minor Session</option>
                                                                        <option value="break-session" @if($agenda->session_type === 'break-session') selected @endif>Break Session</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="session_date">Date</label>
                                                                    <input type="date" name="session_date" value="{{ old('session_date', $agenda->session_date) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="from_time">Start Time</label>
                                                                    <input type="time" name="from_time" value="{{ old('from_time', $agenda->from_time) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="to_time">End Time</label>
                                                                    <input type="time" name="to_time" value="{{ old('to_time', $agenda->to_time) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="venue">Venue</label>
                                                                    <select name="venue_room_id" class="form-control">
                                                                        <option value="">Select</option>
                                                                        @foreach($rooms as $room)
                                                                        <option value="{{ $room->id }}" @if($room->id == $agenda->venue_room_id) selected @endif>{{ $room->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="contact_person">Contact Person</label>
                                                                    <input type="text" name="contact_person" value="{{ old('contact_person', $agenda->contact_person) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="phone">Phone</label>
                                                                    <input type="tel" name="phone" value="{{ old('phone', $agenda->phone) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="email">Email</label>
                                                                    <input type="email" name="email" value="{{ old('email', $agenda->email) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="short_desc">Short Description</label>
                                                                    <textarea name="short_desc" class="form-control">{{ old('short_desc', $agenda->short_desc) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group {{ $errors->has('profile_img') ? ' has-error' : '' }}">
                                                                    <label for="profile_img">Cover Image</label>
                                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                                    <img src="{{ url('storage/agendas/'. $agenda->cover_img) }}" style="width:100px; height: 100px;">
                                                                    @if ($errors->has('profile_img'))
                                                                        <span class="help-block">
                                                                            <strong>{{ $errors->first('cover_img') }}</strong>
                                                                        </span>
                                                                    @endif
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
                                        <a href="#" data-toggle="modal" data-target="#deleteAgendaModal{{ $agenda->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                        <!-- delete Modal-->
                                        <div class="modal fade" id="deleteAgendaModal{{ $agenda->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Agenda?</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body"><p>You are about to delete {{ $agenda->title }}</p></div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                  
                                                    <form id="delete-category" action="{{ route('admin.agendas.destroy', $agenda) }}" method="POST" class="form-inline">
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
                
                <div class="card-header d-flex justify-content-between">
                    <h5>Event Partner</h5>
                    <a href="#CreateEventPartner" data-toggle="modal" class="btn btn-primary btn-sm">Create Partner</a>
                        
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="CreateEventPartner" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Create Event Partner</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.partners.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Event Sponsor Name</label>
                                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="position">Contact Person Name</label>
                                                    <input type="text" name="contact_person" value="{{ old('contact_person') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="tel" name="phone" value="{{ old('phone') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <input type="email" name="email" value="{{ old('email') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="website">Website</label>
                                                    <input type="text" name="website" value="{{ old('website') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios1" value="Platinum">
                                                        <label class="form-check-label" for="exampleRadios1">
                                                            Platinum Sponsorship (KES 6 Million)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Goldplus">
                                                        <label class="form-check-label" for="exampleRadios2">
                                                            Gold+ Sponsorship (KES 4 Million)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Gold">
                                                        <label class="form-check-label" for="exampleRadios2">
                                                            Gold Sponsorship (KES 3 Million)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Bronze">
                                                        <label class="form-check-label" for="exampleRadios2">
                                                            Bronze Sponsorship (KES 1 Million)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Silver">
                                                        <label class="form-check-label" for="exampleRadios2">
                                                            Silver Sponsorship (KES 2 Million)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Category">
                                                        <label class="form-check-label" for="exampleRadios2">
                                                            Category Sponsorship (KES 750,000)
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="short_desc">Short Description</label>
                                                    <textarea name="short_desc" class="form-control">{{ old('short_desc') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                                    <label for="image">Company Logo</label>
                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                    @if ($errors->has('image'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('image') }}</strong>
                                                        </span>
                                                    @endif
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
                                    <th>Contact Person</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Package</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($event->partners as $sponsor)
                                <tr>
                                    <td>{{ $sponsor->name }}</td>
                                    <td>{{ $sponsor->contact_person }}</td>
                                    <td>{{ $sponsor->phone }}</td>
                                    <td>{{ $sponsor->email }}</td>
                                    <td>{{ $sponsor->package_id }}</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#editPartnerModal{{ $sponsor->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Edit</a>
                                        <div class="modal fade" id="editPartnerModal{{ $sponsor->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Edit Partner Details</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ route('admin.partners.update', $sponsor) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="name">Event Sponsor Name</label>
                                                                    <input type="text" name="name" value="{{ old('name', $sponsor->name) }}" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="position">Contact Person Name</label>
                                                                    <input type="text" name="contact_person" value="{{ old('contact_person', $sponsor->contact_person) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="phone">Phone</label>
                                                                    <input type="tel" name="phone" value="{{ old('phone', $sponsor->phone) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="email">Email</label>
                                                                    <input type="email" name="email" value="{{ old('email', $sponsor->email) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="website">Website</label>
                                                                    <input type="text" name="website" value="{{ old('website', $sponsor->website) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios1" value="Platinum" {{ old("package_id", $sponsor->package_id) == 'Platinum' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios1">
                                                                            Platinum Sponsorship (KES 6 Million)
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Goldplus" {{ old("package_id", $sponsor->package_id) == 'Goldplus' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                            Gold+ Sponsorship (KES 4 Million)
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Gold" {{ old("package_id", $sponsor->package_id) == 'Gold' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                            Gold Sponsorship (KES 3 Million)
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Bronze" {{ old("package_id", $sponsor->package_id) == 'Bronze' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                            Bronze Sponsorship (KES 1 Million)
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Silver" {{ old("package_id", $sponsor->package_id) == 'Silver' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                            Silver Sponsorship (KES 2 Million)
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="package_id" id="exampleRadios2" value="Category" {{ old("package_id", $sponsor->package_id) == 'Category' ? 'checked' : '' }}>
                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                            Category Sponsorship (KES 750,000)
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="short_desc">Short Description</label>
                                                                    <textarea name="short_desc" class="form-control">{{ old('short_desc', $sponsor->short_desc) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group {{ $errors->has('company_logo') ? ' has-error' : '' }}">
                                                                    <label for="company_logo">Company Logo</label>
                                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                                    <img src="{{ url('storage/partners/'. $sponsor->company_logo) }}" style="width:100px; height: 100px;">
                                                                    @if ($errors->has('company_logo'))
                                                                        <span class="help-block">
                                                                            <strong>{{ $errors->first('company_logo') }}</strong>
                                                                        </span>
                                                                    @endif
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
                                        <a href="#" data-toggle="modal" data-target="#deletePartnerModal{{ $sponsor->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                        <!-- delete Modal-->
                                        <div class="modal fade" id="deletePartnerModal{{ $sponsor->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Partner?</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body"><p>You are about to delete {{ $sponsor->name }}</p></div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                  
                                                    <form id="delete-category" action="{{ route('admin.partners.destroy', $sponsor) }}" method="POST" class="form-inline">
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
