@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Organizers</h4>
                  <a href="{{ route('admin.organizers.create') }}" class="btn btn-primary">Create</a>
                </div>
                <div class="card-body">
                    @include('shared.notifications')

                    <div class="table-responsive">
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Last Updated</th>
                                    <th></th>
                                </tr>
                            </thead> <tbody>
                              @forelse ($organizers as $key => $row)
                                <tr>
                                    <td>{{ $organizers->firstItem() + $key }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->phone }}</td>
                                    <td>{{ $row->email }}</td>
                                    <td>{{ $row->updated_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.organizers.edit', $row->id) }}" class="btn btn-link"><i class="fa fa-edit"></i>Edit</a>
                                        <a href="#" data-toggle="modal" data-target="#deleteModal{{ $organizers->firstItem() + $key }}" class="btn btn-link"><i class="fa fa-trash"></i>Delete</a>
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
                                                  
                                                    <form id="delete-category" action="{{ route('admin.organizers.destroy', $row) }}" method="POST" class="form-inline">
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
                              @empty
                                <p>No organizers to show!</p>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
