<section class="testimonials text-center bg-white">
    <div class="container">
        <h2 class="mb-5">Speakers</h2>
        <div class="row">
            @php
                $event = App\Models\Event::first();
            @endphp
            
            
            @forelse ($event->speakers as $key => $speaker)
            <div class="col-lg-4">
                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="{{ url('storage/speakers/'. $speaker->profile_img) }}" alt="{{ $speaker->name }}" />
                    <h5>{{ $speaker->name }}</h5>
                    <p class="card-text"><small class="text-muted">{{ $speaker->job_title.' '.$speaker->company }}</small></p>
                    <p class="font-weight-light mb-0">{!! $speaker->short_desc !!}</p>
                </div>
            </div>
            @empty
                <p>No event speakers to show!</p>
            @endforelse
        </div>
    </div>
</section>