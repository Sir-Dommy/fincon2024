@extends('layouts.admin')

@section('content')
<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-12 col-sm-12">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Users</h4>
                </div>
                <div class="card-body">
                    @include('shared.notifications')

                    <div class="table-responsive">
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Verified</th>
                                    <th>Code</th>
                                    <th>Paymode</th>
                                    <th>Ticket</th>
                                    <th>Price</th>
                                    <th>Date Created</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead> <tbody>
                              @forelse ($users as $key => $row)
                                <tr>
                                    <td>{{ $users->firstItem() + $key }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->email }}</td>
                                    <td>{{ $row->phone }}</td>
                                    <td>{{ $row->email_verified_at }}</td>
                                    <td>
                                        @php
                                            $order = $row->orders()->orderBy('id', 'desc')->first();
                                        @endphp
                                        {{ $order['trans_code'] }}
                                    </td>
                                    <td> {{ $order['comments'] }}</td>
                                    <td>
                                        @php
                                            $orderitems = App\Models\OrderItem::with('ticket')->where('order_id', $order['id'])->orderBy('id', 'desc')->first();
                                            $ticketdetails = App\Models\OrderTicketDetail::where('order_item_id', $orderitems['id'])->orderBy('id', 'desc')->first();
                                        @endphp
                                        {{ $orderitems['ticket']['name'] }}
                                    </td>
                                    <td>{{ $orderitems['currency'].' '.$orderitems['price'] }}</td>
                                    <td>{{ $row->created_at }}</td>
                                    <td>
                                        @if($order['status'] === 'open')
                                        <span class="badge badge-primary">Open</span>
                                        @elseif($order['status'] === 'pending')
                                        <span class="badge badge-warning">Pending</span>
                                        @elseif($order['status'] === 'complete')
                                        <span class="badge badge-success">Confirmed</span>
                                        @elseif($order['status'] === 'cancelled')
                                        <span class="badge badge-danger">Cancelled</span>
                                        @else
                                        <span class="badge badge-secondary">Unknown</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if($order != null)
                                            <a href="#" data-toggle="modal" data-target="#manageUserPayment{{ $row->id }}" class="btn btn-link"><i class="fa fa-trash"></i> &nbsp;Manage Payment</a>
                                            <div class="modal fade" id="manageUserPayment{{ $row->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Manage Delegate Registration</h5>
                                                      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="{{ route('admin.order.manage') }}" method="post">
                                                            @csrf
                                                            <input type="hidden" name="user_id" value="{{ $row->id }}">
                                                            <input type="hidden" name="order_id" value="{{ $order['id'] }}">
                                                            <div class="card mb-5">
                                                                <div class="card-header"><h5>Ticket Order Details</h5></div>
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="order_status">Order Status</label>
                                                                                <select name="order_status" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="open">Open</option>
                                                                                    <option value="pending">Pending</option>
                                                                                    <option value="complete">Confirmed</option>
                                                                                    <option value="cancelled">Cancelled</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="pay_status">Payment Status</label>
                                                                                <select name="pay_status" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="open">Open</option>
                                                                                    <option value="pending">Pending</option>
                                                                                    <option value="accepted">Accepted</option>
                                                                                    <option value="rejected">Rejected</option>
                                                                                    <option value="cancelled">Cancelled</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group">
                                                                <button type="submit" class="btn btn-primary">Save and Send Email</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                        @else
                                            <a href="#" data-toggle="modal" data-target="#editUserModal{{ $row->id }}" class="btn btn-link"><i class="fa fa-trash"></i> &nbsp;Add Payment</a>
                                            <div class="modal fade" id="editUserModal{{ $row->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Manage Delegate Registration</h5>
                                                      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="{{ route('admin.registration.manage') }}" method="post">
                                                            @csrf
                                                            <input type="hidden" name="user_id" value="{{ $row->id }}">
                                                            <div class="card mb-5">
                                                                <div class="card-header"><h5>User Profile Details</h5></div>
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label for="name">Full Name</label>
                                                                                <input type="text" name="name" value="{{ old('name', $row->name) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="email">Email</label>
                                                                                <input type="email" name="email" value="{{ old('name', $row->email) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="phone">Phone</label>
                                                                                <input type="tel" name="phone" value="{{ old('phone', $row->phone) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="phone">Gender</label>
                                                                                <select name="gender" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="male">Male</option>
                                                                                    <option value="female">Female</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="company">Company</label>
                                                                                <input type="text" name="company" value="{{ old('company', $ticketdetails['company']) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="job_title">Job Title</label>
                                                                                <input type="text" name="job_title" value="{{ old('job_title', $ticketdetails['job_title']) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="address">Address</label>
                                                                                <textarea name="address" class="form-control">{{ old('address', $ticketdetails['address']) }}</textarea>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="description">Description</label>
                                                                                <textarea name="description" class="form-control">{{ old('description', $ticketdetails['description']) }}</textarea>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="card-header"><h5>Ticket Order Details</h5></div>
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="name">Transaction Code</label>
                                                                                <input type="text" name="trans_code" value="{{ old('name', $order['trans_code']) }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="ticket_id">Ticket Type</label>
                                                                                <select name="ticket_id" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    @php
                                                                                        $tickets = App\Models\Ticket::get();
                                                                                    @endphp
                                                                                    @foreach($tickets as $ticket)
                                                                                    <option value="{{ $ticket->id }}">{{ $ticket->name }} - ({{ $ticket->currency.' '.$ticket->price }})</option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="paymode">Pay mode</label>
                                                                                <select name="paymode" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="mpesa">M-Pesa</option>
                                                                                    <option value="bankdeposit">Bank Deposit</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="currency">Currency</label>
                                                                                <select name="currency" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="KES">Kenya Shilling</option>
                                                                                    <option value="USD">US Dollar</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="name">Amount Paid</label>
                                                                                <input type="number" min="0" name="amount_paid" value="{{ old('amount_paid') }}" class="form-control">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="form-group">
                                                                                <label for="reg_status">Registration Status</label>
                                                                                <select name="reg_status" class="form-control">
                                                                                    <option value="">Select</option>
                                                                                    <option value="open">Open</option>
                                                                                    <option value="pending">Pending</option>
                                                                                    <option value="complete">Confirmed</option>
                                                                                    <option value="cancelled">Cancelled</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group">
                                                                <button type="submit" class="btn btn-primary">Save and Send Email</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                        @endif
                                    </td>
                                </tr>
                              @empty
                                <p>No users to show!</p>
                            @endforelse
                            </tbody>
                        </table>
                        
                        <div class="mb-4">
                            {{ $users->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
