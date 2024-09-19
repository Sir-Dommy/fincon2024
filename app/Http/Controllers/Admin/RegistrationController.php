<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\Models\Order;
use App\Models\User;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\OrderTicketDetail;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class RegistrationController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('verified');
    }

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function manage(Request $request)
    {
        //Update user details
        $user = User::find($request->user_id);
        $user->fill($request->all());
        $user->save();
        
        //update order details
        $order = Order::where('user_id', $request->user_id)->orderBy('id', 'desc')->first();
        if($order === null) {
            //if no order record found, create one
            $form['user_id'] = $user->id;
            $form['event_id'] = '1';
            $form['comments'] = $request->paymode;
            $form['status'] = $request->reg_status;
            $order = Order::create($form);
            
            //create order items record
            $form1['order_id'] = $order->id;
            $form1['ticket_id'] = $request->ticket_id;
            $form1['qty'] = '1';
            $form1['currency'] = $request->currency;
            $form1['price'] = $request->amount_paid;
            $form1['comments'] = 'Admin Created Payment Record';
            $orderitem = OrderItem::create($form1);
            
            //create ticket details record
            $form2['order_item_id'] = $orderitem->id;
            $form2['surname'] = $request->name;
            $form2['email'] = $request->email;
            $form2['phone'] = $request->phone;
            $form2['company'] = $request->company;
            $form2['job_title'] = $request->job_title;
            $form2['address'] = $request->address;
            $form2['description'] = $request->description;
            $ticketdetails = OrderTicketDetail::create($form2);
        } else {
            //if an order record is found, update details and status
            $order->comments = $request->paymode;
            $order->status = $request->reg_status;
            $order->trans_code = $request->trans_code;
            $order->save();
            
            //update order items
            $orderitem = OrderItem::with('ticket')->where('order_id', $order->id)->first();
            $orderitem->ticket_id = $request->ticket_id;
            $orderitem->qty = '1';
            $orderitem->currency = $request->currency;
            $orderitem->price = $request->amount_paid;
            $orderitem->comments = 'Admin Updated Payment Record';
            $orderitem->save();
            
            
            //update order ticket details
            $ticket = OrderTicketDetail::where('order_item_id', $orderitem->id)->first();
            $ticket->surname = $request->name;
            $ticket->email = $request->email;
            $ticket->phone = $request->phone;
            $ticket->company = $request->company;
            $ticket->job_title = $request->job_title;
            $ticket->address = $request->address;
            $ticket->description = $request->description;
            $ticket->save();
        }
        
        
        //SEND EMAIL TO THE USER WITH TICKET INFORMATION
        
        
        
        return redirect()->route('admin.users.index')->withSuccess('Delegate Regitration Updated Successfully!');
        
    }
    
    
    public function ordermanage(Request $request)
    {
        
        //update order details
        $order = Order::where('user_id', $request->user_id)->where('id', $request->order_id)->orderBy('id', 'desc')->first();
        
        
        $order->status = $request->order_status;
        $order->save();
        
        //update order items
        $orderitem = OrderItem::with('ticket')->where('order_id', $order->id)->orderBy('id', 'desc')->first();
        $orderitem->comments = 'Admin Updated Payment Record';
        $orderitem->save();
        
        
        //update order ticket details
        /*$payment = Payment::where('order_id', $order->id)->orderBy('id', 'desc')->first();
        $payment->status = $request->pay_status;
        $payment->save();*/
        
        
        //SEND EMAIL TO THE USER WITH TICKET INFORMATION
        
        
        
        return redirect()->route('admin.users.index')->withSuccess('Delegate Regitration Updated Successfully!');
        
    }

}
