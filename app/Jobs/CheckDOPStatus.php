<?php

namespace App\Jobs;

use App\Models\DPOModel;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CheckDOPStatus implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $end_date;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($end_date)
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        DPOModel::sirLogging("THINGS ARE GETTING HOTTER");
        //
        // Check if the current date is before the given end date
        if (Carbon::now()->lt(Carbon::parse($this->end_date))) {
            // Your asynchronous function logic here
            $this->performAsyncTask();

            // Redispatch the job to run after a delay (e.g., 10 seconds)
            self::dispatch($this->end_date)->delay(now()->addSeconds(10));
        }
    }

    protected function performAsyncTask()
    {
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

    protected function checkTransactionStatus($payment_token){
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

}
