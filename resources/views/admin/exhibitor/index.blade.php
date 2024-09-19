@extends('layouts.admin')

@section('content')
<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Exhibitor Requests</h4>
                  <div class="">
                        @php
                            $pending = $exhibitors->where('status', 'pending')->count();
                            $active = $exhibitors->where('status', 'active')->count();
                            $inactive = $exhibitors->where('status', 'inactive')->count();
                            $terminated = $exhibitors->where('status', 'terminated')->count();
                        @endphp
                      <span class="badge badge-secondary">Pending: {{ $pending }}</span>
                      <span class="badge badge-success">Active: {{ $active }}</span>
                      <span class="badge badge-info">inactive: {{ $inactive }}</span>
                      <span class="badge badge-danger">Terminated: {{ $terminated }}</span>
                  </div>
                </div>
                <div class="card-body">
                    @include('shared.notifications')

                    <div class="table-responsive">
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Company</th>
                                    <th>Contact Person</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Country</th>
                                    <th>Website</th>
                                    <th>Status</th>
                                    <th>Date Created</th>
                                    <th></th>
                                </tr>
                            </thead> <tbody>
                              @forelse ($exhibitors as $key => $row)
                                <tr>
                                    <td>{{ $exhibitors->firstItem() + $key }}</td>
                                    <td>{{ $row->company }}</td>
                                    <td>{{ $row->contact_person }}</td>
                                    <td>{{ $row->email }}</td>
                                    <td>{{ $row->phone }}</td>
                                    <td>{{ $row->country }}</td>
                                    <td>{{ $row->website }}</td>
                                    <td>
                                        @if($row->status === 'pending')
                                            <span class="badge badge-warning">Pending</span>
                                        @elseif($row->status === 'active')
                                            <span class="badge badge-success">Confirmed</span>
                                        @elseif($row->status === 'inactive')
                                            <span class="badge badge-info">Inactive</span>
                                        @elseif($row->status === 'terminated')
                                            <span class="badge badge-danger">Terminated</span>
                                        @else
                                            <span class="badge badge-secondary">Unknown</span>
                                        @endif
                                    </td>
                                    <td>{{ $row->created_at }}</td>
                                </tr>
                              @empty
                                <p>No Exhibitors to show!</p>
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
