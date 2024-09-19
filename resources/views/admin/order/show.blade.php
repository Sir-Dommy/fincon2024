@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            
            @include('shared.notifications')
         
            <div class="card">
                <div class="card-header">
                    Invoice
                    <strong>{{ $order->trans_code }}</strong> 
                    
                    
                    @if($order->status === 'open')
                    <span class="badge badge-primary float-right"><strong>Open</strong></span>
                    @elseif($order->status === 'pending')
                    <span class="badge badge-warning float-right"><strong>Pending</strong></span>
                    @elseif($order->status === 'complete')
                    <span class="badge badge-success float-right"><strong>Confirmed</strong></span>
                    @elseif($order->status === 'cancelled')
                    <span class="badge badge-danger float-right"><strong>Cancelled</strong></span>
                    @else
                    <span class="badge badge-secondary float-right"><strong>Unknown</strong></span>
                    @endif
                
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-6">
                            <h6 class="mb-3">From:</h6>
                            <div>
                            <strong>AMFI-KENYA</strong>
                            </div>
                            <div>Oloitokitok Road Off Argwings Kodhek, Lavington</div>
                            <div>Nairobi, Kenya.</div>
                            <div>Email: finco2024@amfikenya.com</div>
                            <div>Phone: +254 737 409059</div>
                        </div>
                        
                        <div class="col-sm-6">
                            @php
                                $user = App\Models\User::find($order->user_id);
                            @endphp
                            <h6 class="mb-3">To:</h6>
                            <div>
                            <strong>{{ $user->name }}</strong>
                            </div>
                            <div>Email: {{ $user->email }}</div>
                            <div>Phone: {{ $user->phone }}</div>
                        </div>
                    </div>
                    
                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="center">#</th>
                                    <th>Ticket Description</th>
                                    <th class="right">Unit Cost</th>
                                    <th class="center">Qty</th>
                                    <th class="right">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $orderitems = App\Models\OrderItem::with('ticket')->where('order_id', $order->id)->paginate(50);
                                @endphp
                                @forelse ($orderitems as $key => $row)
                                <tr>
                                    <td class="center">{{ $orderitems->firstItem() + $key }}</td>
                                    <td class="left strong">{{ $row->ticket->name }}</td>
                                    <td class="right">{{ $row->currency.' '.number_format($row->price, 0) }}</td>
                                    <td class="center">{{ $row->qty }}</td>
                                    <td class="right">{{ $row->currency.' '.number_format($row->price, 0) }}</td>
                                </tr>
                                @empty
                                    <p>No Ticket Orders to show!</p>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                    <div class="col-lg-4 col-sm-5">
                    
                    </div>
                    
                    <div class="col-lg-4 col-sm-5 ml-auto">
                    <table class="table table-clear">
                    <tbody>
                    <tr>
                    <td class="left">
                    <strong>Subtotal</strong>
                    </td>
                    <td class="right">{{ $row->currency.' '.number_format($row->price, 0) }}</td>
                    </tr>
                    <tr>
                    <td class="left">
                    <strong>Discount (0%)</strong>
                    </td>
                    <td class="right">{{ $row->currency }} 0.00</td>
                    </tr>
                    <tr>
                    <td class="left">
                     <strong>VAT (16%)</strong>
                    </td>
                    <td class="right">{{ $row->currency }} {{ $row->price * 0.16 }} </td>
                    </tr>
                    <tr>
                    <td class="left">
                    <strong>Total</strong>
                    </td>
                    <td class="right">
                    <strong>{{ $row->currency.' '.number_format($row->price, 0) }}</strong>
                    </td>
                    </tr>
                    </tbody>
                    </table>
                    
                    </div>
                    
                    </div>
                
                </div>
            </div>
            
            
            
        </div>
    </div>
</div>
@endsection
