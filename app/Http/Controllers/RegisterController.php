<?php

namespace App\Http\Controllers;

use App\DPOModel;
use Auth;
use App\Models\Order;
use App\Models\User;
use App\Models\OrderItem;
use App\Models\OrderTicketDetail;
use App\Models\BankUpload;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('register');
    }
    
    
    

    /*
    * Store order then redirect to promt payments
    */
    
    // public function store(Requests\StoreRegistration $request)
    // {
    public function store(Request $request)
    {
        $transcode = Str::random(8);
        
        // //create user
        // $user['name'] = $request->name;
        // $user['email'] = $request->email;
        // $user['phone'] = $request->phone;
        // $user['password'] = Hash::make($transcode);
        // $delegate = User::create($user);
        
        // //create delegate order
        // $form['trans_code'] = $transcode;
        // $form['user_id'] = $delegate->id;
        // $form['event_id'] = $request->event_id;
        // $form['comments'] = $request->paymode;
        // $form['status'] = 'pending';
        // $order = Order::create($form);

        // //create order items
        // $items = $request->all();
        // $items['order_id'] = $order->id;
        // $items['ticket_id'] = $request->ticket_id;
        // $items['qty'] = '1';
        // if($request->paymode == 'bankdeposit') {
        //     $items['currency'] = $request->currency;
        //     $items['price'] = $request->price;
        // } elseif($request->paymode == 'mpesa') {
        //     $mpesa_amount = $request->price * 130;
            
        //     $items['currency'] = 'KES';
        //     $items['price'] = $mpesa_amount;
        // }
        // $orderitem = OrderItem::create($items);
        
        // //create details
        // $ticket = $request->all();
        // $ticket['order_item_id'] = $orderitem->id;
        // $ticket['surname'] = $request->name;
        // $ticket['email'] = $request->email;
        // $ticket['phone'] = $request->phone;
        // $ticket['company'] = $request->company;
        // $ticket['job_title'] = $request->job_title;
        // $ticket['description'] = $request->paymode;
        // // $ticketdetails = OrderTicketDetail::create($ticket);
        
        // $request->session()->put('paymode', $request->paymode);
        // $request->session()->put('trans_code', $transcode);
        // $request->session()->put('order_id', $order->id);
        // $request->session()->put('user_id', $delegate->id);
        // //store info in session
        // $request->session()->put('event_id', $request->event_id);
        // $request->session()->put('ticket_id', $request->ticket_id);
        // $request->session()->put('currency', $request->currency);
        // $request->session()->put('price', $request->price);
        // $request->session()->put('qty', $request->qty);
        // $request->session()->put('name', $request->name);
        // $request->session()->put('email', $request->email);
        // $request->session()->put('phone', $request->phone);
        // $request->session()->put('company', $request->company);
        // $request->session()->put('job_title', $request->job_title);
        // $request->session()->put('address', $request->address);
        
        if($request->paymode == 'bankdeposit') {
            return redirect()->route('order.payments');   
        } elseif($request->paymode == 'mpesa') {
            if($request->ticket_id == '1') {
                return redirect()->away('https://payments.fincon2024.co.ke/member/mpesa/stkpush/'.$transcode);
            } elseif($request->ticket_id == '2') {
                return redirect()->away('https://payments.fincon2024.co.ke/nonmember/mpesa/stkpush/'.$transcode);
            } else {
                return redirect()->route('order.payments');
            }
        }elseif($request->paymode == 'dpo') {
            //request dpo token for payment
            $this->sirLogging("TUKO HAPA ACHA TUREQUEST DPO API");
            echo DPOModel::createPaymentToken($transcode);
            
            // return redirect()->back()->with('success', 'WE ARE SURE IT IS DPO!!!!!!!');
        }
        else{
            $this->sirLogging("HAPA HAKUNA SHIET");
            
            echo $request;
            // return redirect()->back()->with('success', 'NO NOTHING FOUND!!!!!!!');
        }

        //return redirect()->route('order.success')->withOrder(Order::find($order->id));
    }
    
    
    /*
    * Store order then redirect to promt payments
    */
    
    public function bankupload(Request $request)
    {
        $this->validate($request, [

            'payment_proof' => 'required|mimes:pdf,jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('payment_proof');
        $ext = $file->getClientOriginalExtension();
        $logo_image_path = 'banklisp'.time().'.' . $ext;
        $path = Storage::putFileAs('/public/bankslips/', $file, $logo_image_path, 'public');
        $form = $request->all();
        $form['order_id'] = session('order_id');
        $form['user_id'] = session('user_id');
        if ($path) {
            $form['upload_file'] = $logo_image_path;
        }
        $event = BankUpload::create($form);
        
        //update order details
        $order = Order::find(session('order_id'));
        $order->status = 'pending';
        $order->save();
        
        return redirect()->route('order.success');
    }

    public function requestTokenFroDPO(){

    }
    private function sirLogging($message){
        $path = storage_path('logs/sir.log');
        file_put_contents($path, "[" . now() . "] ". $message . ".\n", FILE_APPEND);

    }
    
    
}
