@component('mail::message')
Dear {{ $user->name }}

We hope this message finds you well.

We are in receipt of your registration to participate in the upcoming
Financial Inclusion Conference and Investor Expo scheduled for 26th and
27th June. In order complete your registration process, we need to
confirm that indeed you finalized the payment of the conference fees.

Towards this end, we request you to furnish us with proof of payment to
enable us validate your registration. and secure your spot at the event.

Should you have any questions or need assistance, please do not hesitate
to contact us. We are here to help and ensure your conference experience
is as enjoyable and productive as possible.

@component('mail::button', ['url' => route('ticket-payment')])
Complete Registration
@endcomponent

Thanks,<br>
Team {{ config('app.name') }} <br>
Email: smithika@amfikenya.com <br>
Phone: 0703418607
@endcomponent
