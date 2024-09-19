@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Venue Details - {{ $venue->name }}</h4>
                  <a href="{{ route('admin.venues.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-sm-12">
                            <div class="card">
                                <img src="{{ url('storage/venues/'. $venue->cover_img) }}" class="card-img-top">
                            </div>
                        </div>
                        <div class="col-md-8 col-lg-8 col-sm-12">
                            <h3>{{ $venue->name }}</h3>
                            <p>{{ $venue->desc }}</p>
                            <small class="float-right">Last Updated: {{ $venue->updated_at }}</small>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="card-header d-flex justify-content-between">
                    <h5>Venue Rooms</h5>
                    <a href="#CreateVenueRoom" data-toggle="modal" class="btn btn-primary btn-sm">Create Venue Room</a>
                        
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="CreateVenueRoom" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Create Venue Name</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.venuerooms.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="venue_id" value="{{ $venue->id }}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="size">Event Space in Sq. Ft.</label>
                                                    <input type="number" min="0" step="any" name="size" value="{{ old('size') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="max_capacity">Max Capacity</label>
                                                    <input type="number" min="0" step="any" name="max_capacity" value="{{ old('max_capacity') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="auditorium">Auditorium</label>
                                                    <input type="number" min="0" step="any" name="auditorium" value="{{ old('auditorium') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="classroom">Classroom</label>
                                                    <input type="number" min="0" step="any" name="classroom" value="{{ old('classroom') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="u_shape">U-Shape</label>
                                                    <input type="number" min="0" step="any" name="u_shape" value="{{ old('u_shape') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="reception">Reception</label>
                                                    <input type="number" min="0" step="any" name="reception" value="{{ old('reception') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="banquet">Banquet</label>
                                                    <input type="number" min="0" step="any" name="banquet" value="{{ old('banquet') }}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="address">Location Address</label>
                                                    <textarea name="address" class="form-control">{{ old('address') }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="description">Description</label>
                                                    <textarea name="description" class="form-control">{{ old('description') }}</textarea>
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
                                    <th>Address</th>
                                    <th>Size</th>
                                    <th>Capacity</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($venue->rooms as $room)
                                <tr>
                                    <td>{{ $room->name }}</td>
                                    <td>{{ $room->address }}</td>
                                    <td>{{ $room->size }}</td>
                                    <td>{{ $room->max_capacity }}</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#editRoomModal{{ $room->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Edit</a>
                                        <div class="modal fade" id="editRoomModal{{ $room->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Edit Venue Room</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ route('admin.venuerooms.update', $room) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        <input type="hidden" name="_method" value="patch">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" name="name" value="{{ old('name', $room->name) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="size">Event Space in Sq. Ft.</label>
                                                                    <input type="number" min="0" step="any" name="size" value="{{ old('size', $room->size) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="max_capacity">Max Capacity</label>
                                                                    <input type="number" min="0" name="max_capacity" value="{{ old('max_capacity', $room->max_capacity) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="auditorium">Auditorium</label>
                                                                    <input type="number" min="0" step="any" name="auditorium" value="{{ old('auditorium', $room->auditorium) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="classroom">Classroom</label>
                                                                    <input type="number" min="0" step="any" name="classroom" value="{{ old('classroom', $room->classroom) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="u_shape">U-Shape</label>
                                                                    <input type="number" min="0" step="any" name="u_shape" value="{{ old('u_shape', $room->u_shape) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="reception">Reception</label>
                                                                    <input type="number" min="0" step="any" name="reception" value="{{ old('reception', $room->reception) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="banquet">Banquet</label>
                                                                    <input type="number" min="0" step="any" name="banquet" value="{{ old('banquet', $room->banquet) }}" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="address">Address</label>
                                                                    <textarea name="address" class="form-control">{{ old('address', $room->address) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="description">Description</label>
                                                                    <textarea name="description" class="form-control">{{ old('description', $room->description) }}</textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                                                    <label for="image">Cover Image</label>
                                                                    <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                                                                    <img src="{{ url('storage/rooms/'. $room->cover_img) }}" style="width:100px; height: 100px;">
                                                                    @if ($errors->has('image'))
                                                                        <span class="help-block">
                                                                            <strong>{{ $errors->first('image') }}</strong>
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
                                        <a href="#" data-toggle="modal" data-target="#deleteRoomModal{{ $room->id }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
                                        <!-- delete Modal-->
                                        <div class="modal fade" id="deleteRoomModal{{ $room->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Venue Room?</h5>
                                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body"><p>You are about to delete {{ $room->name }}</p></div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                                  
                                                    <form id="delete-category" action="{{ route('admin.venuerooms.destroy', $room) }}" method="POST" class="form-inline">
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
