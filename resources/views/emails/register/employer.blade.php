@component('mail::message')
Hi {{ $user->name }},

We're excited to start helping you grow your business!

Welcome to Skillslinks, a community where employers like you come to hire their next best performer. Please verify your account to explore the full potential of our recruitment management system.


Thanks,<br>
Team {{ config('app.name') }}
@endcomponent
