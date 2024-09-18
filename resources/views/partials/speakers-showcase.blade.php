<section class="testimonials bg-white">
    <div class="container py-2">
        <h2 class="text-center mb-5 text-uppercase">Conference Speakers</h2>
        @php
            $event = App\Models\Event::first();
        @endphp
        
        
        @forelse ($event->speakers as $key => $speaker)
        <div class="card mb-5 border border-white rounded-lg shadow p-3 mb-5 bg-white">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="{{ url('storage/speakers/'. $speaker->profile_img) }}" class="card-img" alt="{{ $speaker->name }}">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">{{ $speaker->name }}</h5>
                <p class="card-text">{!! $speaker->short_desc !!}</p>
                <p class="card-text"><small class="text-muted">{{ $speaker->job_title.' '.$speaker->company }}</small></p>
              </div>
            </div>
          </div>
        </div>
        @empty
            <p>No event speakers to show!</p>
        @endforelse
    </div>
</section>