@extends('layouts.admin')

@section('content')
<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                    <h4>Ticket Orders</h4>
                  
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                        Filter Orders
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="{{ url('backoffice/delegates/complete') }}">Paid</a>
                            <a class="dropdown-item" href="{{ url('backoffice/delegates/pending') }}">Not Paid</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    @include('shared.notifications')

                    <div class="table-responsive">
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Code</th>
                                    <th>Delegate Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Ticket</th>
                                    <th>Price</th>
                                    <th></th>
                                </tr>
                            </thead> <tbody>
                              @forelse ($orders as $key => $row)
                                <tr>
                                    <td>{{ $orders->firstItem() + $key }}</td>
                                    <td><a href="{{ route('admin.orders.show', $row) }}">{{ $row->trans_code }}</a></td>
                                    <td>{{ $row->user->name }}</td>
                                    <td>{{ $row->user->phone }}</td>
                                    <td>{{ $row->user->email }}</td>
                                    <td>
                                        @if($row->status === 'open')
                                        <span class="badge badge-primary">Open</span>
                                        @elseif($row->status === 'pending')
                                        <span class="badge badge-warning">Pending</span>
                                        @elseif($row->status === 'complete')
                                        <span class="badge badge-success">Confirmed</span>
                                        @elseif($row->status === 'cancelled')
                                        <span class="badge badge-danger">Cancelled</span>
                                        @else
                                        <span class="badge badge-secondary">Unknown</span>
                                        @endif
                                    </td>
                                    <td>{{ $row->created_at }}</td>
                                    <td>
                                        @php
                                            $orderitems = App\Models\OrderItem::with('ticket')->where('order_id', $row->id)->orderBy('id', 'desc')->first();
                                            $ticketdetails = App\Models\OrderTicketDetail::where('order_item_id', $orderitems['id'])->orderBy('id', 'desc')->first();
                                        @endphp
                                        {{ $orderitems['ticket']['name'] }}
                                    </td>
                                    <td>{{ $orderitems['currency'].' '.$orderitems['price'] }}</td>
                                    
                                </tr>
                              @empty
                                <p>No Ticket Orders to show!</p>
                            @endforelse
                            </tbody>
                        </table>
                        
                        <div class="mb-4">
                            {{ $orders->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
