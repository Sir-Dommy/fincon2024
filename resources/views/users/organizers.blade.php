@extends('layouts.business')

@section('title', 'Organizers')

@section('content')

<div class="jumbotron jumbotron-fluid bg-white">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>Organizer Profile</h3>
          </div>
      </div>
    </div>
</div>


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            <div class="card card-default">
                <div class="card-body">
                    @include('shared.notifications')
 @forelse ($organizers as $key => $row)
                    <div class="media">
                      <img src="{{ url('storage/organizers/'. $row->logo) }}" class="mr-3" style="width:200px; height: 100px;" alt="...">
                      <div class="media-body">
                        <h4 class="mt-0">{{ $row->name }}</h4>
                        <div class="d-flex justify-content-between">
                            <p>Phone: <a href="tel:{{ $row->phone }}">{{ $row->phone }}</a></p>
                            <p>Email: <a href="mailto:{{ $row->email }}">{{ $row->email }}</a></p>
                            <p>Website: <a href="{{ $row->website }}" target="_blank">{{ $row->website }}</a></p>
                        </div>
                        <p>{{ $row->short_desc }}</p>
                        <div class="float-right">
                            <a href="{{ route('organizers.edit', $row->id) }}" class="btn btn-link"><i class="fa fa-edit"></i>Edit</a>
                            <!--<a href="#" data-toggle="modal" data-target="#deleteModal{{ $organizers->firstItem() + $key }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>-->
                            <!-- delete Modal-->
                            <div class="modal fade" id="deleteModal{{ $organizers->firstItem() + $key }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete this Organizer?</h5>
                                      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                      </button>
                                    </div>
                                    <div class="modal-body"><p>You are about to delete {{ $row->name }}</p></div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">No, I Don't</button>
                                      
                                        <form id="delete-category" action="{{ route('organizers.destroy', $row) }}" method="POST" class="form-inline">
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
                    </div>
                    @empty
                        <div class="card card-body p-5">
                            <p>You Dont Have an Organizer Profile!</p>
                            <a href="{{ route('organizers.create') }}" class="btn btn-primary">Create</a>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
