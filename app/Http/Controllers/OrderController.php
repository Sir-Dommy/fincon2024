<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Order;
use App\Models\User;
use App\Models\OrderItem;
use App\Models\OrderTicketDetail;
use App\Http\Requests;
use App\Models\DPOModel;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class OrderController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('verified');
    }

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    
    
    
    
    /*
    * Store order then redirect to promt payments
    */
    
    public function store(Request $request)
    {
        $transcode = $request->paymode.Str::random(8).now();
        
        try{
            DB::beginTransaction();
            
            DPOModel::sirLogging("TRANSCODE IS:: ". $transcode. " ADN EMAIL IS::  ". $request->email);
            //create user
            $user['name'] = $request->name;
            $user['email'] = $request->email;
            $user['phone'] = $request->phone;
            $user['password'] = Hash::make($transcode);
            $delegate = User::create($user);


            DPOModel::sirLogging("DELEGATE CREATED::  ". json_encode($delegate));
            
            //create delegate order
            $form['trans_code'] = $transcode;
            $form['user_id'] = $delegate->id;
            $form['event_id'] = $request->event_id;
            $form['comments'] = $request->paymode;
            $form['status'] = 'pending';
            $order = Order::create($form);

            DPOModel::sirLogging("ORDER CREATED::  ". json_encode($order));
            
            //create order items
            $items = $request->all();
            $items['order_id'] = $order->id;
            $items['ticket_id'] = $request->ticket_id;
            $items['qty'] = '1';
            if($request->paymode == 'bankdeposit') {
                $items['currency'] = $request->currency;
                $items['price'] = $request->price;
            } elseif($request->paymode == 'mpesa') {
                $mpesa_amount = $request->price * 130;
                
                $items['currency'] = 'KES';
                $items['price'] = $mpesa_amount;
            }
            elseif($request->paymode == 'dpo') {   

                $items['currency'] = 'USD';
                $items['price'] = $request->price;
            }
            else{
                throw new Exception("Invalid payment method");
            }
            $orderitem = OrderItem::create($items);

            DPOModel::sirLogging("orderitem CREATED::  ". json_encode($orderitem));
            
            //create details
            $ticket = $request->all();
            $ticket['order_item_id'] = $orderitem->id;
            $ticket['surname'] = $request->name;
            $ticket['email'] = $request->email;
            $ticket['phone'] = $request->phone;
            $ticket['company'] = $request->company;
            $ticket['job_title'] = $request->job_title;
            $ticket['description'] = $request->paymode;
            $ticketdetails = OrderTicketDetail::create($ticket);

            DPOModel::sirLogging("ticketdetails CREATED::  ". json_encode($ticketdetails));

            DB::commit();


            DPOModel::sirLogging("TRANSACTION COMMITTED");
        } 

        catch(\Exception $e){
            DPOModel::sirLogging("KUNA ERROR MANZEEE!!!! :::: ". json_encode($e));
            DB::rollBack();

            return;
        }
        
        
        $request->session()->put('paymode', $request->paymode);
        $request->session()->put('trans_code', $transcode);
        $request->session()->put('order_id', $order->id);
        $request->session()->put('user_id', $delegate->id);
        //store info in session
        $request->session()->put('event_id', $request->event_id);
        $request->session()->put('ticket_id', $request->ticket_id);
        $request->session()->put('currency', $request->currency);
        $request->session()->put('price', $request->price);
        $request->session()->put('qty', $request->qty);
        $request->session()->put('name', $request->name);
        $request->session()->put('email', $request->email);
        $request->session()->put('phone', $request->phone);
        $request->session()->put('company', $request->company);
        $request->session()->put('job_title', $request->job_title);
        $request->session()->put('address', $request->address);
        
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
            DPOModel::sirLogging("TUKO HAPA ACHA TUREQUEST DPO API");

            // $response = $this->requestTokenFromDPO($request->price);
            $response = $this->requestTokenFromDPO($request->price);

            // You can get the response and store its details at this poit

            // What we will use is the payment token generated
            $payment_token = $response['TransToken'] ?? null;

            if($payment_token == null){
                DPOModel::sirLogging("WE ARE UNABLE TO GENERATE PAYMENT TOKEN");
                return redirect()->back()->with('error', 'We are unable to generate payment token at the moment please retry');
            }

            // Update order to contain dpo_code
            Order::where('trans_code', $transcode)
                ->update(['dpo_code' => $payment_token]);
            
            return $this->redirectToDPOForPayment($payment_token);
   
            
        }
        else{
            DPOModel::sirLogging("INAVLID DETAILS FRO PAYMENT METHOD IN REQUEST!!!!!!");
            return redirect()->back()->with('error', 'No payemtn method found please retry');
        }

        //return redirect()->route('order.success')->withOrder(Order::find($order->id));
    }
    
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function mpesastore(Request $request)
    {
        
        //create order
        $validatedData = $request->validate([
            'trans_code' => 'required|unique:orders|max:255'
        ]);
        
        $form['trans_code'] = $request->trans_code;
        
        $form['user_id'] = Auth::user()->id;
        $form['event_id'] = session('event_id');
        $form['comments'] = $request->paymode;
        $form['status'] = 'pending';
        $order = Order::create($form);

        //create order items
        $items = $request->all();
        $items['order_id'] = $order->id;
        $items['ticket_id'] = session('ticket_id');
        $items['qty'] = session('qty');
        if($request->paymode == 'bankdeposit') {
            $items['currency'] = session('currency');
            $items['price'] = session('price');
        } elseif($request->paymode == 'mpesa') {
            $items['currency'] = 'KES';
            $items['price'] = $request->mpesa_amount;
        }
        $orderitem = OrderItem::create($items);
        
        //create details
        $ticket = $request->all();
        $ticket['order_item_id'] = $orderitem->id;
        $ticket['surname'] = session('name');
        $ticket['email'] = session('email');
        $ticket['phone'] = session('phone');
        $ticket['company'] = session('company');
        $ticket['job_title'] = session('job_title');
        $ticket['address'] = session('address');
        $ticket['description'] = $request->paymode;
        $ticketdetails = OrderTicketDetail::create($ticket);

        return redirect()->route('order.success')->withOrder(Order::find($order->id));
    }
    
    
    
    public function bankstore(Request $request)
    {
        //add user is not logged in activate this
        /*$userform = $request->all();
        $userform['password'] = Hash::make(Str::random(10));
        $user = User::create($userform);*/
        
        //create order
        $validatedData = $request->validate([
            'trans_code' => 'required|unique:orders|max:255'
        ]);
    
        $form['trans_code'] = $request->trans_code;
        
        $form['user_id'] = Auth::user()->id;
        $form['event_id'] = session('event_id');
        $form['comments'] = $request->paymode;
        $form['status'] = 'pending';
        $order = Order::create($form);

        //create order items
        $items = $request->all();
        $items['order_id'] = $order->id;
        $items['ticket_id'] = session('ticket_id');
        $items['qty'] = session('qty');
        if($request->paymode == 'bankdeposit') {
            $items['currency'] = session('currency');
            $items['price'] = session('price');
        } elseif($request->paymode == 'mpesa') {
            $items['currency'] = 'KES';
            $items['price'] = $request->mpesa_amount;
        }
        $orderitem = OrderItem::create($items);
        
        //create details
        $ticket = $request->all();
        $ticket['order_item_id'] = $orderitem->id;
        $ticket['surname'] = session('name');
        $ticket['email'] = session('email');
        $ticket['phone'] = session('phone');
        $ticket['company'] = session('company');
        $ticket['job_title'] = session('job_title');
        $ticket['address'] = session('address');
        $ticket['description'] = $request->paymode;
        $ticketdetails = OrderTicketDetail::create($ticket);

        return redirect()->route('order.success')->withOrder(Order::find($order->id));
    }
    
    
    //payments
    public function payments()
    {
        return view('payments');
    }
    
    
    
    //success
    public function success()
    {
        return view('order-success');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }






    //function to generate a transaction token
    public function requestTokenFromDPO($amount){
        return DPOModel::createPaymentToken($amount);
    }

    // function to redirect to DPO for payment
    public function redirectToDPOForPayment($payment_token){
        if($payment_token != null){
            DPOModel::sirLogging("WE ARE REDIRECTING TO PAYMENT PAGE>>>>>>".$payment_token);
            return redirect()->away('https://secure.3gdirectpay.com/dpopayment.php?ID='.$payment_token);
        }

        DPOModel::sirLogging("WE ARE UNABLE TO GENERATE PAYMENT TOKEN");
        return redirect()->back()->with('error', 'We are unable to generate payment token at the moment please retry');
        
    }

    // Confirm if payment is done
    public function checkTransactionStatus($payment_token){
        $response = DPOModel::verifyPaymentToken($payment_token);

        // Updating db
        $status = $response['ResultExplanation'] ?? null;

        // update transaction to complete if its already paid
        if($status == "Transaction Paid"){

            // Update order to complete
            Order::where('dpo_code', $payment_token)
                ->update(['status' => 'complete']);

            return 1;
        }

        elseif($status == null){
            DPOModel::sirLogging("ERROR QUERING TRANSACTION FROM DPO :::::: ". json_encode($response));
        }

        // "Transaction not paid yet" use this to veiry if transaction is not yet paid
        
        DPOModel::sirLogging("NOT YET PAID!!!!! :::::: ". $status);

        return $response;
    }

    public function bulkConfirmDPOTransaction(){
        $all = Order::whereNotNull('dpo_code')
        // $all = Order::whereNull('dpo_code')
        ->where('status', '!=', 'complete')
        ->get();

        DPOModel::sirLogging(json_encode($all));

        $count = 0;
        $failed = 0;
        foreach($all as $transaction){
            $status = $this->checkTransactionStatus($transaction->dpo_code);

            if($status == 1){
                $count +=1;
            }
            else{
                $failed +=1;
            }
        }

        return response()->json([
            "newly_paid"=> $count,
            "not_paid_yet"=>$failed
        ]);
    }

}
