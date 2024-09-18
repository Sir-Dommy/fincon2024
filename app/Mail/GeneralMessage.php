<?php

namespace App\Mail;

use App\Models\User;
use App\Models\Message;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class GeneralMessage extends Mailable
{
    use Queueable, SerializesModels;


    /**
    * The user instance.
    *
    * @var Order
    */
    public $user;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.generalmessage')->subject('Reminder to pay for FinCon2024 Registration')->attach('docs/bankingdetails.pdf', ['as' => 'Fincon2024BankPaymentDetails.pdf', 'mime' => 'application/pdf']);
    }
}
