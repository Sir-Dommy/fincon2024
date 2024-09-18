@component('mail::message')
Hi {{ $user->name }}

Welcome to The Events Diary. You have joined a global network of event promotors. Thank you for submitting your comment.

First, we need to be sure you're you and verify your email address. Please click on the button below to verify your email.

Your Email Address: {{ $user->email }}
Your Phone Number: {{ $user->phone }}

@component('mail::button', ['url' => route('set-password', $user->id)])
Verify Email
@endcomponent

Thanks,<br>
Team {{ config('app.name') }}
@endcomponent
