@component('mail::message')
Hi {{ $user->name }},

Welcome to Skillslinks, we are pleased to have you onboard, we are a community where job seekers like you come to find the right employer to work with. Please verify your account so that we can start linking you to like minded employers.

@component('mail::button', ['url' => '', 'color' => 'success'])
Verify
@endcomponent

Thanks,<br>
Team {{ config('app.name') }}
@endcomponent
